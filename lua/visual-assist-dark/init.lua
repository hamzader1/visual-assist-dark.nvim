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
  hi("FloatTitle",   { fg = p.fg_dim, bg = p.bg_float })

  hi("Cursor",       { fg = p.bg, bg = p.cursor1 })
  hi("CursorLine",   { bg = p.bg_status })
  hi("CursorColumn", { bg = p.bg_status })
  hi("CursorLineNr", { fg = p.fg_dim })
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
  hi("Title",        { fg = p.orange })
  hi("ColorColumn",  { bg = p.bg_status })
  hi("Conceal",      { fg = p.fg_gray })
  hi("MatchParen",   { fg = p.orange, underline = true })
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

  hi("DiagnosticVirtualTextError", { fg = p.red,        bg = p.none })
  hi("DiagnosticVirtualTextWarn",  { fg = p.yellow,      bg = p.none })
  hi("DiagnosticVirtualTextInfo",  { fg = p.blue_bright, bg = p.none })
  hi("DiagnosticVirtualTextHint",  { fg = p.hint,        bg = p.none })

  hi("Error",   { fg = p.red, bg = p.bg })
  hi("Warning", { fg = p.yellow })
  hi("Todo",    { fg = p.bg, bg = p.orange })

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
  hi("Comment",        { fg = p.green })

  hi("Constant",       { fg = p.accent })
  hi("String",         { fg = p.string })
  hi("Character",      { fg = p.string })
  hi("Number",         { fg = p.number })
  hi("Boolean",        { fg = p.blue })
  hi("Float",           { fg = p.number })

  hi("Identifier",     { fg = p.fg })
  hi("Function",       { fg = p.orange })

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
  hi("StorageClass",   { fg = p.keyword })
  hi("Structure",      { fg = p.type })
  hi("Typedef",        { fg = p.type })

  hi("Special",        { fg = p.purple })
  hi("SpecialChar",    { fg = p.string })
  hi("Tag",             { fg = p.keyword })
  hi("Delimiter",      { fg = p.pure_white })
  hi("SpecialComment", { fg = p.green })
  hi("Debug",          { fg = p.red })

  hi("Underlined",     { underline = true })
  hi("Ignore",          { fg = p.fg_gray })

  -- =========================================================
  -- Treesitter
  -- =========================================================
  hi("@variable",             { fg = p.fg })
  hi("@variable.builtin",     { fg = p.fg }) -- e.g. `self`: same color as normal variables
  hi("@variable.parameter",   { fg = p.fg })
  hi("@variable.member",      { fg = p.property })

  hi("@constant",              { fg = p.accent })
  hi("@constant.builtin",      { fg = p.accent })
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

  hi("@function",               { fg = p.orange })
  hi("@function.builtin",       { fg = p.orange })
  hi("@function.macro",         { fg = p.orange })
  hi("@function.method",        { fg = p.orange })
  hi("@constructor",            { fg = p.orange })

  hi("@keyword",                { fg = p.keyword })
  hi("@keyword.function",       { fg = p.keyword })
  hi("@keyword.operator",       { fg = p.keyword })
  hi("@keyword.return",         { fg = p.keyword })
  hi("@conditional",            { fg = p.keyword })
  hi("@repeat",                  { fg = p.keyword })
  hi("@exception",              { fg = p.keyword })

  -- storage qualifiers: `mut` (Rust) etc. take plain keyword color
  hi("@keyword.storage",        { fg = p.keyword })
  hi("@keyword.modifier",       { fg = p.keyword })
  hi("@type.qualifier",         { fg = p.keyword })
  hi("@storageclass",           { fg = p.keyword })

  -- `&` and `*` (refs/derefs): no special color, just plain
  hi("@operator",               { fg = p.fg })

  -- parentheses / brackets: pure white, not variable-colored
  hi("@punctuation.bracket",    { fg = p.pure_white })
  hi("@punctuation.delimiter",  { fg = p.pure_white })
  hi("@punctuation.special",    { fg = p.pure_white })
  hi("@punctuation.list_marker",{ fg = p.pure_white })

  hi("@property",               { fg = p.property })
  hi("@field",                  { fg = p.property })
  hi("@attribute",              { fg = p.purple })

  hi("@type",                   { fg = p.type })
  hi("@type.builtin",           { fg = p.type })  -- primitive types (i32, bool, str, ...) -> yellow like other types
  hi("@type.definition",        { fg = p.type })    -- `type Foo = Bar;` gets Type color, not Variable
  hi("@type.enum",              { fg = p.type })

  hi("@tag",                    { fg = p.keyword })
  hi("@tag.attribute",          { fg = p.purple })
  hi("@tag.delimiter",          { fg = p.pure_white })

  hi("@comment",                { fg = p.green })
  hi("@comment.documentation",  { fg = p.green })

  hi("@text.literal",           { fg = p.text_lit })
  hi("@markup.link",            { fg = p.blue_bright, underline = true })
  hi("@markup.heading",         { fg = p.orange })

  -- =========================================================
  -- LSP semantic tokens (rust-analyzer's semantic highlighting
  -- OVERRIDES plain Treesitter captures whenever it's active,
  -- so every relevant group must be set explicitly here or it
  -- silently falls back to Normal/@variable color)
  -- =========================================================
  -- types (was missing @lsp.type.struct -> this was THE bug
  -- causing every struct-typed identifier to render as Normal)
  hi("@lsp.type.struct",        { fg = p.type })
  hi("@lsp.type.enum",          { fg = p.type })
  hi("@lsp.type.union",         { fg = p.type })
  hi("@lsp.type.trait",         { fg = p.type })
  hi("@lsp.type.type",          { fg = p.type })
  hi("@lsp.type.typeAlias",     { fg = p.type })    -- `type Foo = Bar;` LHS
  hi("@lsp.type.enumMember",    { fg = p.type })
  hi("@lsp.type.builtinType",   { fg = p.type })  -- primitives -> yellow like other types

  -- constants/statics: confirmed via :Inspect the actual group
  -- rust-analyzer emits is @lsp.type.const (not "variable"+modifier
  -- as generically documented) -- set it directly
  hi("@lsp.type.const",         { fg = p.accent })
  hi("@lsp.type.static",        { fg = p.accent })
  hi("@lsp.typemod.variable.constant",      { fg = p.accent })
  hi("@lsp.typemod.variable.static",        { fg = p.accent })
  hi("@lsp.typemod.variable.constant.rust", { fg = p.accent })
  hi("@lsp.typemod.variable.static.rust",   { fg = p.accent })

  -- namespaces / module paths (`bitmap` in `use bitmap::BitMap;`):
  -- plain white, NOT the same color as an actual type
  hi("@lsp.type.namespace",     { fg = p.pure_white })
  hi("@module",                 { fg = p.pure_white })
  hi("@namespace",              { fg = p.pure_white })

  -- rust-analyzer semantic-tokens punctuation separately from
  -- Treesitter when its punctuation highlighting is enabled --
  -- this is why parens kept reverting to variable color
  hi("@lsp.type.punctuation",   { fg = p.pure_white })
  hi("@lsp.type.formatSpecifier", { fg = p.pure_white }) -- {} placeholders in format strings

  -- legacy (non-Treesitter) rust.vim syntax group used for
  -- brace/paren folding -- confirmed via :Inspect
  hi("rustFoldBraces",          { fg = p.pure_white })

  hi("@lsp.type.variable",      { fg = p.fg })
  hi("@lsp.type.parameter",     { fg = p.fg })
  hi("@lsp.type.property",      { fg = p.property })
  hi("@lsp.type.function",      { fg = p.orange })
  hi("@lsp.type.method",        { fg = p.orange })
  hi("@lsp.type.macro",         { fg = p.preproc })
  hi("@lsp.type.keyword",       { fg = p.keyword }) -- covers `mut`
  hi("@lsp.type.selfKeyword",   { fg = p.fg })    -- lowercase `self`: same as normal variables
  hi("@lsp.type.selfTypeKeyword", { fg = p.type }) -- uppercase `Self`: same as types (yellow)
  hi("@lsp.type.lifetime",      { fg = p.purple })
  hi("@lsp.type.label",         { fg = p.keyword })
  hi("@lsp.type.attribute",     { fg = p.purple })
  hi("@lsp.type.derive",        { fg = p.purple })
  hi("@lsp.type.deriveHelper",  { fg = p.purple })
  hi("@lsp.type.toolModule",    { fg = p.purple })
  hi("@lsp.type.string",        { fg = p.string })
  hi("@lsp.type.number",        { fg = p.number })
  hi("@lsp.type.operator",      { fg = p.fg })

  -- =========================================================
  -- LSP
  -- =========================================================
  hi("LspReferenceText",  { bg = p.bg_status })
  hi("LspReferenceRead",  { bg = p.bg_status })
  hi("LspReferenceWrite", { bg = p.bg_status })
  hi("LspCodeLens",       { fg = p.fg_gray })
  hi("LspInlayHint",      { fg = p.fg_gray, bg = p.none })

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

  -- =========================================================
  -- Bracket color, forced
  -- =========================================================
  -- Whatever governs () {} [] in your setup (legacy rust.vim
  -- syntax, Treesitter, or LSP semantic tokens) has proven
  -- inconsistent to target directly. matchadd() is a separate
  -- highlighting layer that renders ON TOP of all of them, so
  -- this guarantees the color regardless of which engine "wins"
  -- underneath.
  vim.api.nvim_set_hl(0, "VisualAssistDarkBrackets", { fg = p.pure_white })

  local function apply_bracket_match()
    -- clear any previous match from this plugin in this window
    for _, m in ipairs(vim.fn.getmatches()) do
      if m.group == "VisualAssistDarkBrackets" then
        vim.fn.matchdelete(m.id)
      end
    end
vim.fn.matchadd("VisualAssistDarkBrackets", "[(){}\\[\\]]", 100)

  end

  local group = vim.api.nvim_create_augroup("VisualAssistDarkFixups", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "ColorScheme" }, {
    group = group,
    callback = apply_bracket_match,
  })
  -- apply immediately to the current window too
  apply_bracket_match()
end

return M