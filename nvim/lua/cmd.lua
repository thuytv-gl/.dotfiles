local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- General settings:
--------------------

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '100' })
  end
})

augroup('htmlSyntax', { clear = true })
autocmd({ 'BufNewFile', 'BufRead' }, {
  group = 'htmlSyntax',
  pattern = { '*.svelte' },
  command = 'set syntax=html'
})

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

vim.cmd [[
  function! NetrwToggle()
    if &ft ==# "netrw"
      Rex
    else
      Ex
    endif
  endfunction
]]
