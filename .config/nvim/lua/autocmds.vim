" Briefly highlight yanked region.
augroup highlightyank
  autocmd!
  autocmd TextYankPost *
    \ lua vim.highlight.on_yank({
      \ higroup = 'Visual',
      \ timeout = 100,
      \ on_visual = false
    \ })
augroup end

" Jump to last known position and center buffer around cursor.
augroup jumplast
  autocmd!
  autocmd BufWinEnter ?* call autocmds#jumplast#()
augroup end

" Block changes to read-only buffers.
augroup blockreadonly
  autocmd!
  autocmd BufReadPost * let &l:modifiable = !&readonly
augroup end

" Save the current buffer after any changes.
augroup savebuffer
  autocmd!
  autocmd InsertLeave,TextChanged * call autocmds#savebuffer#()
augroup end

" augroup vueFiletype
"   autocmd!
"   autocmd BufRead,BufNewFile *.vue :set filetype=vue.html
" augroup end
