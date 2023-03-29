local opt = vim.opt
local g = vim.g

g.mapleader = " "

opt.clipboard = "unnamedplus"

-- Number
opt.number = true
opt.numberwidth = 2

-- Indent
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2


require('plugin')
require('keymaps')
