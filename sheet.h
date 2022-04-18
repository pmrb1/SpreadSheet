#pragma once

#include "cell.h"
#include "common.h"

#include <functional>

class Sheet : public SheetInterface {
public:
  ~Sheet();

public:
  void SetCell(Position pos, std::string text) override;

  const CellInterface *GetCell(Position pos) const override;

  CellInterface *GetCell(Position pos) override;

  void ClearCell(Position pos) override;

  Size GetPrintableSize() const override;

  void PrintValues(std::ostream &output) const override;

  void PrintTexts(std::ostream &output) const override;

  // need for check referenced cells
  const Cell *GetConcreteCell(Position pos) const;

  Cell *GetConcreteCell(Position pos);

private:
  void PrintCells(std::ostream &output,
             const std::function<void(const CellInterface &)> &printCell) const;

private:
  Size size_ = {0, 0};
  Size printable_size_ = {0, 0};
  std::vector<std::vector<std::unique_ptr<Cell>>> sheet_;
};
