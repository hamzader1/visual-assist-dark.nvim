# visual-assist-dark.nvim

A Neovim port of the **Visual Assist Dark** 

## Installation

### lazy.nvim

```lua
{
  "hamzader1/visual-assist-dark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("visual-assist-dark")
  end,
}
```

### packer.nvim

```lua
use({
  "hamzader1/visual-assist-dark.nvim",
  config = function()
    vim.cmd.colorscheme("visual-assist-dark")
  end,
})
```

### vim-plug

```vim
Plug 'hamzader1/visual-assist-dark.nvim'
```

then in your `init.vim` / `init.lua`:

```vim
colorscheme visual-assist-dark
```

## Usage without a plugin manager

Just source `colors/visual-assist-dark.lua` — Neovim's runtime path auto-discovers
any `colors/*.lua` file once the repo is on your `packpath`/`runtimepath`, or clone
it manually:

```bash
git clone https://github.com/hamzader1/visual-assist-dark.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/visual-assist-dark.nvim
```

Then, in `init.lua`:

```lua
vim.cmd.colorscheme("visual-assist-dark")
```

## Requirements

- Neovim >= 0.8
- `termguicolors` enabled (the colorscheme turns this on automatically)

