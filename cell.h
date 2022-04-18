#pragma once

#include "common.h"
#include "formula.h"

#include <functional>
#include <unordered_set>

class Sheet;

class Cell : public CellInterface {
public:
  Cell(Sheet &sheet);
  ~Cell();

  void Set(std::string text);
  void Clear();

  Value GetValue() const override;
  std::string GetText() const override;
  std::vector<Position> GetReferencedCells() const override;

private:
  class Impl;
  class EmptyImpl;
  class TextImpl;
  class FormulaImpl;

  bool CheckForCircularDependency(const Impl &newImpl) const;

  void UpdateRefs();

  void ClearCaches();

private:
  Sheet &sheet_;
  std::unique_ptr<Impl> impl_;
  std::vector<Cell *> incomingRefs_;
  std::vector<Cell *> outgoingRefs_;
};