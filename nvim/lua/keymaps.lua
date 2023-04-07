local builtin = require('telescope.builtin')
local map = vim.keymap.set

-- Telescope
map('n', '<leader>f', builtin.find_files, {})
map('n', '<leader>t', builtin.live_grep, {})
map('n', '<leader>b', builtin.buffers, {})
map('n', '<leader>h', builtin.help_tags, {})
map('n', '<leader>m', builtin.marks, {})

map('n', '<leader>h', '<cmd> noh <CR>', {})

-- Insert
map('i', 'kj', '<esc>', {})
map('i', 'kj', '<esc>', {})

-- Buffer
map('n', '<S-h>', '<cmd> bprevious <CR>', {})
map('n', '<S-l>', '<cmd> bnext <CR>', {})
map('n', '<leader>w', '<cmd> w <CR>', {})
map('n', '<leader>q', '<cmd> q <CR>', {})
map('n', '<leader>c', '<cmd> bd <CR>', {})

-- Windows
map('n', '<C-l>', '<C-w>l', {})
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-]>', '<cmd> vertical resize +10 <CR>', {})
map('n', '<C-[>', '<cmd> vertical resize -10 <CR>', {})

-- Quickfix
map('n', '<C-q>', '<cmd> call QuickFixToggle() <CR>', {})
map('n', '<leader>e', '<cmd> call NetrwToggle() <CR>', {})

-- Terminal
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true });
