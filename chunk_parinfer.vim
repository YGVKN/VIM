source parinfer.vim

" Open our input file and copy it to register 'a'
e tests/really_long_file
normal ggVG"ay
let s:text = @a
