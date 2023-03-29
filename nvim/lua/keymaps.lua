local builtin = require('telescope.builtin')
local map = vim.keymap.set

-- Telescope
map('n', '<leader>f', builtin.find_files, {})
map('n', '<leader>t', builtin.live_grep, {})
map('n', '<leader>b', builtin.buffers, {})
map('n', '<leader>h', builtin.help_tags, {})
map('n', '<leader>m', builtin.marks, {})


-- Insert
map('i', 'kj', '<esc>', {})
map('i', 'kj', '<esc>', {})

-- Buffer
map('n', '<C-h>', '<cmd> bprevious <CR>', {})
map('n', '<C-l>', '<cmd> bnext <CR>', {})
map('n', '<leader>w', '<cmd> w <CR>', {})
map('n', '<leader>q', '<cmd> q <CR>', {})
map('n', '<leader>c', '<cmd> bd <CR>', {})

-- Windows
map('n', '<C-l>', '<C-w>l', {})
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})

-- Quickfix
map('n', '<C-q>', '<cmd> call QuickFixToggle() <CR>', {})

