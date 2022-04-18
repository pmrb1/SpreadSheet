#include "sheet.h"
#include "cell.h"
#include "common.h"

#include <algorithm>
#include <functional>
#include <iostream>
#include <optional>

using namespace std::literals;

Sheet::~Sheet() {
  for (auto &row : sheet_) {
    for (auto &cell : row) {
      if (cell != nullptr) {
        cell->Clear();
      }
    }
  }
}

void Sheet::SetCell(Position pos, std::string text) {
  if (!pos.IsValid()) {
    throw InvalidPositionException(
        "Invalid position passed to Sheet::SetCell()");
  }

  int sheet_size = sheet_.size();
  sheet_.resize(std::max(pos.row + 1, sheet_size));

  int row_size = sheet_[pos.row].size();
  sheet_[pos.row].resize(std::max(pos.col + 1, row_size));

  auto &cell = sheet_[pos.row][pos.col];
  if (!cell) {
    cell = std::make_unique<Cell>(*this);
  }
  cell->Set(std::move(text));
}

CellInterface *Sheet::GetCell(Position pos) {
  if (!pos.IsValid()) {
    throw InvalidPositionException(
        "Invalid position passed to Sheet::GetCell()");
  }
  if (sheet_.empty()) {
    return nullptr;
  }
  int row_size = sheet_[pos.row].size();
  int sheet_size = sheet_.size();

  if (pos.row >= sheet_size || pos.col >= row_size) {
    return nullptr;
  }

  return sheet_[pos.row][pos.col].get();
}

const CellInterface *Sheet::GetCell(Position pos) const {
  if (!pos.IsValid()) {
    throw InvalidPositionException(
        "Invalid position passed to Sheet::GetCell()");
  }
  if (sheet_.empty()) {
    return nullptr;
  }

  int row_size = sheet_[pos.row].size();
  int sheet_size = sheet_.size();

  if (pos.row >= sheet_size || pos.col >= row_size) {
    return nullptr;
  }

  return sheet_[pos.row][pos.col].get();
}

void Sheet::ClearCell(Position pos) {
  if (!pos.IsValid()) {
    throw InvalidPositionException("Error");
  }
  if (sheet_.empty()) {
    return;
  }

  int sheet_size = sheet_.size();
  int row_size = sheet_[pos.row].size();

  if (pos.row < sheet_size && pos.col < row_size) {
    if (auto &cell = sheet_[pos.row][pos.col]) {
      if (!cell) {
        return;
      }
      cell.reset();
    }
  }
}

Size Sheet::GetPrintableSize() const {
  Size size;
  int sheet_size = sheet_.size();

  for (int row = 0; row < sheet_size; ++row) {
    int row_size = sheet_[row].size();

    for (int col = row_size - 1; col >= 0; --col) {

      if (const auto &cell = sheet_[row][col]) {
        if (!cell->GetText().empty()) {
          size.rows = std::max(size.rows, row + 1);
          size.cols = std::max(size.cols, col + 1);
          break;
        }
      }
    }
  }
  return size;
}

void Sheet::PrintValues(std::ostream &output) const {
  PrintCells(output, [&](const CellInterface &cell) {
    std::visit([&](const auto &value) { output << value; }, cell.GetValue());
  });
}

void Sheet::PrintTexts(std::ostream &output) const {
  PrintCells(output, [&output](const CellInterface &cell) {
    output << cell.GetText();
  });
}

std::unique_ptr<SheetInterface> CreateSheet() {
  return std::make_unique<Sheet>();
}

const Cell *Sheet::GetConcreteCell(Position pos) const {
  if (!pos.IsValid()) {
    throw InvalidPositionException(
        "Invalid position passed to Sheet::GetCell()");
  }
  if (sheet_.empty()) {
    return nullptr;
  }
  int row_size = sheet_[pos.row].size();
  int sheet_size = sheet_.size();
  if (pos.row >= sheet_size || pos.col >= row_size) {
    return nullptr;
  }
  return sheet_[pos.row][pos.col].get();
}

Cell *Sheet::GetConcreteCell(Position pos) {
  return const_cast<Cell *>(
      static_cast<const Sheet &>(*this).GetConcreteCell(pos));
}

void Sheet::PrintCells(
    std::ostream &output,
    const std::function<void(const CellInterface &)> &printCell) const {

  auto size = GetPrintableSize();

  for (int row = 0; row < size.rows; ++row) {
    for (int col = 0; col < size.cols; ++col) {
      if (col > 0) {
        output << '\t';
      }
      int row_size = sheet_[row].size();
      if (col < row_size) {
        if (const auto &cell = sheet_[row][col]) {
          printCell(*cell);
        }
      }
    }
    output << '\n';
  }
}