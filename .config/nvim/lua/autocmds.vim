" Jump to last known position and center buffer around cursor.
augroup jumplast
  autocmd!
  autocmd BufWinEnter ?* call autocmds#jumplast#()
augroup end

" Save the current buffer after any changes.
augroup savebuffer
  autocmd!
  autocmd InsertLeave,TextChanged * call autocmds#savebuffer#()
augroup end
