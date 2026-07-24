-- Palette extracted from the "Visual Assist Dark" Zed theme
-- https://zed.dev/schema/themes/v0.2.0.json

local M = {}

M.palette = {
  bg          = "#202020",
  bg_status   = "#303030",
  bg_panel    = "#202020",
  bg_gutter   = "#202020",
  bg_float    = "#0e0e0e",
  bg_select   = "#606060",
  bg_select2  = "#808080",
  bg_drop     = "#383b3d",
  custom_white = "#DCDCDC",
  custom_red = "#E74B3C",
  custom_green = "#4FCAB1",

  fg          = "#BDB76B", -- editor.foreground / variable
  fg_dim      = "#d4d4d4", -- active line number / white
  fg_gray     = "#808080", -- black / ignored

  cursor1     = "#569CD6",
  cursor2     = "#ff8000",

  red         = "#d16969", -- error / deleted / conflict
  green       = "#608b4e", -- created / comment
  green_bright= "#b5cea8",
  yellow      = "#d7ba7d", -- warning / modified
  yellow_dim  = "#ce9178",
  blue        = "#569cd6", -- boolean / constant
  blue_bright = "#9cdcfe", -- info
  magenta     = "#c586c0",
  cyan        = "#4ec9b0",
  white       = "#d4d4d4",

  purple      = "#d6abdb", -- attribute
  keyword     = "#D8A0DF", -- keyword / tag
  orange      = "#ff8000", -- constructor / function
  string      = "#d69d85",
  number      = "#B5CEA8",
  operator    = "#DCDCDC",
  preproc     = "#bd63c5",
  property    = "#C8C8C8",
  punct       = "#DCDCDC",
  type        = "#ffd700",
  text_lit    = "#68685B",

  hint        = "#969696",
  none        = "NONE",

  -- requested overrides
  accent      = "#6BA8DC", -- primitive types + constants/static
  pure_white  = "#FFFFFF", -- parentheses / brackets
}

return M
