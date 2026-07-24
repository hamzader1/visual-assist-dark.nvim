local M = {}

function M.setup(opts)
  opts = opts or {}
  M.options = opts
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "visual-assist-dark"

  local p = require("visual-assist-dark.palette").palette

  local function hi(group, opts_tbl)
    vim.api.nvim_set_hl(0, group, opts_tbl)
  end

  -- =========================================================
  -- Editor UI
  -- =========================================================
  hi("Normal",       { fg = p.fg, bg = p.bg })
  hi("NormalNC",      { fg = p.fg, bg = p.bg })
  hi("NormalFloat",  { fg = p.fg, bg = p.bg_float })
  hi("FloatBorder",  { fg = p.fg_gray, bg = p.bg_float })
  hi("FloatTitle",   { fg = p.fg_dim, bg = p.bg_float, bold = true })

  hi("Cursor",       { fg = p.bg, bg = p.cursor1 })
  hi("CursorLine",   { bg = p.bg_status })
  hi("CursorColumn", { bg = p.bg_status })
  hi("CursorLineNr", { fg = p.fg_dim, bold = true })
  hi("LineNr",       { fg = p.fg_gray, bg = p.bg_gutter })
  hi("SignColumn",   { fg = p.fg_gray, bg = p.bg_gutter })

  hi("Visual",       { bg = p.bg_select })
  hi("VisualNOS",    { bg = p.bg_select2 })

  hi("Search",       { fg = p.bg, bg = p.yellow })
  hi("IncSearch",    { fg = p.bg, bg = p.orange })
  hi("CurSearch",    { fg = p.bg, bg = p.orange })

  hi("Pmenu",        { fg = p.fg, bg = p.bg_float })
  hi("PmenuSel",     { fg = p.bg, bg = p.blue_bright })
  hi("PmenuSbar",    { bg = p.bg_status })
  hi("PmenuThumb",   { bg = p.fg_gray })

  hi("StatusLine",   { fg = p.fg, bg = p.bg_status })
  hi("StatusLineNC", { fg = p.fg_gray, bg = p.bg_status })

  hi("TabLine",      { fg = p.fg_gray, bg = p.bg_status })
  hi("TabLineSel",   { fg = p.fg, bg = p.bg })
  hi("TabLineFill",  { bg = p.bg_status })

  hi("VertSplit",    { fg = p.bg_status, bg = p.bg })
  hi("WinSeparator", { fg = p.bg_status, bg = p.bg })

  hi("Directory",    { fg = p.blue })
  hi("Title",        { fg = p.orange, bold = true })
  hi("ColorColumn",  { bg = p.bg_status })
  hi("Conceal",      { fg = p.fg_gray })
  hi("MatchParen",   { fg = p.orange, bold = true, underline = true })
  hi("NonText",      { fg = p.fg_gray })
  hi("Whitespace",   { fg = p.bg_drop })
  hi("SpecialKey",   { fg = p.fg_gray })
  hi("WildMenu",     { fg = p.bg, bg = p.blue })
  hi("Folded",       { fg = p.fg_gray, bg = p.bg_status })
  hi("FoldColumn",   { fg = p.fg_gray, bg = p.bg_gutter })

  hi("EndOfBuffer",  { fg = p.bg })

  -- =========================================================
  -- Diagnostics / Info
  -- =========================================================
  hi("DiagnosticError", { fg = p.red })
  hi("DiagnosticWarn",  { fg = p.yellow })
  hi("DiagnosticInfo",  { fg = p.blue_bright })
  hi("DiagnosticHint",  { fg = p.hint })
  hi("DiagnosticOk",    { fg = p.green })

  hi("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
  hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = p.yellow })
  hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = p.blue_bright })
  hi("DiagnosticUnderlineHint",  { undercurl = true, sp = p.hint })

  hi("DiagnosticVirtualTextError", { fg = p.red,        bg = p.bg_float })
  hi("DiagnosticVirtualTextWarn",  { fg = p.yellow,      bg = p.bg_float })
  hi("DiagnosticVirtualTextInfo",  { fg = p.blue_bright, bg = p.bg_float })
  hi("DiagnosticVirtualTextHint",  { fg = p.hint,        bg = p.bg_float })

  hi("Error",   { fg = p.red, bg = p.bg })
  hi("Warning", { fg = p.yellow })
  hi("Todo",    { fg = p.bg, bg = p.orange, bold = true })

  -- =========================================================
  -- Diff / Git
  -- =========================================================
  hi("DiffAdd",    { fg = p.green,        bg = p.bg })
  hi("DiffChange", { fg = p.yellow,       bg = p.bg })
  hi("DiffDelete", { fg = p.red,          bg = p.bg })
  hi("DiffText",   { fg = p.yellow_dim,   bg = p.bg_status })

  hi("GitSignsAdd",    { fg = p.green })
  hi("GitSignsChange", { fg = p.yellow })
  hi("GitSignsDelete", { fg = p.red })

  -- =========================================================
  -- Base syntax groups
  -- =========================================================
  hi("Comment",        { fg = p.green, italic = true })

  hi("Constant",       { fg = p.blue, bold = true })
  hi("String",         { fg = p.string })
  hi("Character",      { fg = p.string })
  hi("Number",         { fg = p.number })
  hi("Boolean",        { fg = p.blue })
  hi("Float",           { fg = p.number })

  hi("Identifier",     { fg = p.fg })
  hi("Function",       { fg = p.orange, bold = true })

  hi("Statement",      { fg = p.keyword })
  hi("Conditional",    { fg = p.keyword })
  hi("Repeat",         { fg = p.keyword })
  hi("Label",          { fg = p.keyword })
  hi("Operator",       { fg = p.operator })
  hi("Keyword",        { fg = p.keyword })
  hi("Exception",      { fg = p.keyword })

  hi("PreProc",        { fg = p.preproc })
  hi("Include",        { fg = p.preproc })
  hi("Define",         { fg = p.preproc })
  hi("Macro",          { fg = p.preproc })
  hi("PreCondit",      { fg = p.preproc })

  hi("Type",           { fg = p.type })
  hi("StorageClass",   { fg = p.type })
  hi("Structure",      { fg = p.type })
  hi("Typedef",        { fg = p.type })

  hi("Special",        { fg = p.purple })
  hi("SpecialChar",    { fg = p.string })
  hi("Tag",             { fg = p.keyword })
  hi("Delimiter",      { fg = p.punct })
  hi("SpecialComment", { fg = p.green })
  hi("Debug",          { fg = p.red })

  hi("Underlined",     { underline = true })
  hi("Ignore",          { fg = p.fg_gray })

  -- =========================================================
  -- Treesitter
  -- =========================================================
  hi("@variable",             { fg = p.fg })
  hi("@variable.builtin",     { fg = p.fg, italic = true })
  hi("@variable.parameter",   { fg = p.fg })
  hi("@variable.member",      { fg = p.property })

  hi("@constant",              { fg = p.blue, bold = true })
  hi("@constant.builtin",      { fg = p.blue, bold = true })
  hi("@constant.macro",        { fg = p.preproc })

  hi("@string",                { fg = p.string })
  hi("@string.escape",         { fg = p.string })
  hi("@string.regex",          { fg = p.string })
  hi("@string.special",        { fg = p.string })
  hi("@string.special.symbol", { fg = p.string })
  hi("@character",             { fg = p.string })

  hi("@number",                 { fg = p.number })
  hi("@boolean",                { fg = p.blue })
  hi("@float",                  { fg = p.number })

  hi("@function",               { fg = p.orange, bold = true })
  hi("@function.builtin",       { fg = p.orange, bold = true })
  hi("@function.macro",         { fg = p.orange, bold = true })
  hi("@function.method",        { fg = p.orange, bold = true })
  hi("@constructor",            { fg = p.orange, bold = true })

  hi("@keyword",                { fg = p.keyword })
  hi("@keyword.function",       { fg = p.keyword })
  hi("@keyword.operator",       { fg = p.keyword })
  hi("@keyword.return",         { fg = p.keyword })
  hi("@conditional",            { fg = p.keyword })
  hi("@repeat",                  { fg = p.keyword })
  hi("@exception",              { fg = p.keyword })

  hi("@operator",               { fg = p.operator })
  hi("@punctuation.bracket",    { fg = p.punct })
  hi("@punctuation.delimiter",  { fg = p.punct })
  hi("@punctuation.special",    { fg = p.punct })
  hi("@punctuation.list_marker",{ fg = p.punct })

  hi("@property",               { fg = p.property })
  hi("@field",                  { fg = p.property })
  hi("@attribute",              { fg = p.purple })

  hi("@type",                   { fg = p.type })
  hi("@type.builtin",           { fg = p.type })
  hi("@type.definition",        { fg = p.type })

  hi("@tag",                    { fg = p.keyword })
  hi("@tag.attribute",          { fg = p.purple })
  hi("@tag.delimiter",          { fg = p.punct })

  hi("@comment",                { fg = p.green, italic = true })
  hi("@comment.documentation",  { fg = p.green })

  hi("@text.literal",           { fg = p.text_lit })
  hi("@markup.link",            { fg = p.blue_bright, underline = true })
  hi("@markup.heading",         { fg = p.orange, bold = true })

  -- =========================================================
  -- LSP
  -- =========================================================
  hi("LspReferenceText",  { bg = p.bg_status })
  hi("LspReferenceRead",  { bg = p.bg_status })
  hi("LspReferenceWrite", { bg = p.bg_status })
  hi("LspCodeLens",       { fg = p.fg_gray })
  hi("LspInlayHint",      { fg = p.fg_gray, bg = p.bg_status, italic = true })

  -- =========================================================
  -- Terminal colors
  -- =========================================================
  vim.g.terminal_color_0  = p.fg_gray
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.yellow_dim
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.magenta
  vim.g.terminal_color_6  = p.cyan
  vim.g.terminal_color_7  = p.white
  vim.g.terminal_color_8  = p.fg_gray
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green_bright
  vim.g.terminal_color_11 = p.string
  vim.g.terminal_color_12 = p.blue_bright
  vim.g.terminal_color_13 = p.magenta
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.white
end

return M
