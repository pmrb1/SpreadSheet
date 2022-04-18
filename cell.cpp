#include "cell.h"
#include "sheet.h"

#include <cassert>
#include <iostream>
#include <optional>
#include <stack>
#include <string>

class Cell::Impl {
public:
  virtual ~Impl() = default;

  virtual Value GetValue() const = 0;

  virtual std::string GetText() const = 0;

  virtual std::vector<Position> GetReferencedCells() const { return {}; }

  virtual FormulaInterface *GetFormula() { return nullptr; }

  virtual bool IsCacheValid() const { return true; }

  virtual void InvalidateCache() {}
};

class Cell::EmptyImpl : public Impl {
public:
  std::vector<Position> GetReferencedCells() const override {
    return std::vector<Position>{};
  }

  Value GetValue() const override { return 0.0; }

  std::string GetText() const override { return std::string{}; }
};

class Cell::TextImpl : public Impl {
public:
  explicit TextImpl(std::string text) : text_(std::move(text)) {
    if (text_.empty()) {
      throw std::logic_error(
          "TextImpl should not contain empty text, use EmptyImpl for this "
          "purpose.");
    }
  }

  Value GetValue() const override {
    if (text_[0] == ESCAPE_SIGN) {
      return text_.substr(1);
    }
    return text_;
  }

  std::string GetText() const override { return text_; }

  std::vector<Position> GetReferencedCells() const override {
    return std::vector<Position>{};
  }

private:
  std::string text_;
};

class Cell::FormulaImpl : public Impl {
public:
  explicit FormulaImpl(std::string text, const SheetInterface &sheet)
      : sheet_(sheet) {
    if (text.empty() || text[0] != FORMULA_SIGN) {
      throw std::logic_error("A formula should start with '=' sign");
    }
    formula_ = ParseFormula(text.substr(1));
  }

  Value GetValue() const override {
    if (!cachedValue_) {
      cachedValue_ = formula_->Evaluate(sheet_);
    }

    return std::visit([](const auto &x) { return Value(x); }, *cachedValue_);
  }

  std::string GetText() const override {
    return FORMULA_SIGN + formula_->GetExpression();
  }

  std::vector<Position> GetReferencedCells() const override {
    return formula_->GetReferencedCells();
  }

  FormulaInterface *GetFormula() override { return formula_.get(); }

  bool IsCacheValid() const override { return cachedValue_.has_value(); }

  void InvalidateCache() override { cachedValue_ = std::nullopt; }

private:
  const SheetInterface &sheet_;
  std::unique_ptr<FormulaInterface> formula_;
  mutable std::optional<FormulaInterface::Value> cachedValue_;
};

Cell::Cell(Sheet &sheet)
    : sheet_(sheet), impl_(std::make_unique<EmptyImpl>()) {}

Cell::~Cell() {
  assert(incomingRefs_.empty());
  assert(outgoingRefs_.empty());
}

void Cell::Set(std::string text) {
  std::unique_ptr<Impl> newImpl;

  if (text.empty()) {
    newImpl = std::make_unique<EmptyImpl>();
  } else if (text.size() > 1 && text[0] == FORMULA_SIGN) {
    newImpl = std::make_unique<FormulaImpl>(std::move(text), sheet_);
  } else {
    newImpl = std::make_unique<TextImpl>(std::move(text));
  }

  if (CheckForCircularDependency(*newImpl)) {
    throw CircularDependencyException(
        "Setting this formula would introduce circular dependency!");
  }
  impl_ = std::move(newImpl);

  UpdateRefs();

  ClearCaches();
}

void Cell::Clear() { Set(""); }

Cell::Value Cell::GetValue() const { return impl_->GetValue(); }

std::string Cell::GetText() const { return impl_->GetText(); }

std::vector<Position> Cell::GetReferencedCells() const {
  return impl_->GetReferencedCells();
}

bool Cell::CheckForCircularDependency(const Impl &newImpl) const {
  if (newImpl.GetReferencedCells().empty()) {
    return false;
  }
  std::vector<const Cell *> referenced;

  for (const auto &pos : newImpl.GetReferencedCells()) {
    referenced.push_back(sheet_.GetConcreteCell(pos));
  }

  std::vector<const Cell *> visited;
  std::stack<const Cell *> toVisit;

  toVisit.push(this);

  while (!toVisit.empty()) {
    const Cell *current = toVisit.top();

    toVisit.pop();
    visited.push_back(current);
    auto current_it = std::find(referenced.begin(), referenced.end(), current);

    if (current_it != referenced.end()) {
      return true;
    }
    for (const Cell *incoming : current->incomingRefs_) {
      auto it = std::find(visited.begin(), visited.end(), incoming);

      if (it == visited.end()) {
        toVisit.push(incoming);
      }
    }
  }

  return false;
}

void Cell::UpdateRefs() {
  for (Cell *outgoing : outgoingRefs_) {
    auto it = std::find(outgoing->incomingRefs_.begin(),
                        outgoing->incomingRefs_.end(), this);
    outgoing->incomingRefs_.erase(it);
  }
  outgoingRefs_.clear();
  for (const auto &pos : impl_->GetReferencedCells()) {
    Cell *outgoing = sheet_.GetConcreteCell(pos);
    if (!outgoing) {
      sheet_.SetCell(pos, "");
      outgoing = sheet_.GetConcreteCell(pos);
    }
    outgoingRefs_.push_back(outgoing);
    outgoing->incomingRefs_.push_back(this);
  }
}

void Cell::ClearCaches() {
  if (impl_->IsCacheValid()) {
    impl_->InvalidateCache();

    for (Cell *incoming : incomingRefs_) {
      incoming->ClearCaches();
    }
  }
}