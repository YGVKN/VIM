func! Scratch() abort
  split
  noswapfile enew
  setlocal nowrap nonumber nocursorline buftype=nofile
  setlocal nofoldenable nobuflisted bufhidden=wipe
  if exists('&relativenumber') | setlocal norelativenumber | endif
  setfiletype scratch
endfunc
":call Scratch()"
