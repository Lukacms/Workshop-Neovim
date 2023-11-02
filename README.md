# Workshop-Neovim
What is neovim ? How to use it ? How to configure it ?

## Neovim
Neovim is a text editor. It's not an IDE, which means it's much quicker than vscode, for example. Also, it's less ressources consuming, as you install everything yourself.

### What is the main difference ?
Neovim has 4 modes:
* *Normal mode* the one you'll learn to master to be much more efficient than you vscode friends :)
* *Insertion mode* after *i* is typed, just to write text
* *Visual mode* after *v* is typed, to select text and do actions with it
* *Command-line mode* usually after *:*, run vim and bash commands

### But it's time demanding to get used to it ?
Yes, a little bit. Neovim propose some exercices to get used to the pelicular syntax:
```sh
nvim .
:Tutor
```
You'll have exercices on how to create files, save file, wander around a file, copy / cut / paste, ...

## Config
You start from scratch with this editor. There are multiples ways to do one, in either lua or vimscript (vimscript is depreciated tho, don't do that).

You'll just have to put your configuration files in `~/.config/nvim` folder.

### Lazy
There are multiples packet managers, such as [Packer](https://github.com/wbthomason/packer.nvim) or [Lazy](https://github.com/folke/lazy.nvim). We're just gonna talk about Lazy, because we use it, and it's quite simple for new users.

example of a configuration init file:
```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- require lazy file

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- install lazy on your laptop if not installed

-- require configuration files
require("options")
require("mappings")
require("settings")
require("lazy").setup("plugins")
require("lsp")
require("highlights")
```

example of configuration file:
```lua
return { -- return the plugins to be executed
  {
      "keklleo/tabline.nvim", -- link to github page -> go to https://github.com/keklleo/tabline.vim to check
      opts = { enable = false }, -- optionnal arguments
      dependencies = { -- dependencies if neeeded. Everything should be specified in README of github plugin page
          { "hoob3rt/lualine.nvim" },
          { "nvim-tree/nvim-web-devicons" },
      },
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  { "norcalli/nvim-colorizer.lua", opts = { "*" } },

  { "luukvbaal/stabilize.nvim" }, -- this plugin doesn't need anything other than to be imported

  {
      "windwp/nvim-autopairs",
      config = function(plugin, opts)
          require("nvim-autopairs").setup()
      end,
  },
}
```

## Quickstart
Just copy the `nvim` folder in this repository:
```sh
$> cp -r ./nvim ~/.config/
```

To update all plugins:
```sh
$> nvim .
:Lazy sync
```

*n.b.:* some of the lsp are to be manually installed
