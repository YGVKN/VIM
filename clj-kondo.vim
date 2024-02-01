if exists("current_compiler")
  finish
endif
let current_compiler="clj-kondo"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m
""CompilerSet makeprg=clj-kondo\ --lint\ %
""CompilerSet makeprg=clj-kondo\ --lint \"$(clj -Spath)\"\ --dependencies\ --parallel\ --copy-configs
""clj-kondo --lint zhuzha-clj-linter "$(clj -Spath)" --dependencies --parallel --copy-configs YGVKN/clj_cli/clj-async-profiler/src/profiler.clj --c
""onfig '{:output {:format :json}}' | jq '.findings[0]'
"":echo system("$(clj -Spath)")
CompilerSet makeprg=clj-kondo\ --lint\ --dependencies\ --parallel\ --copy-configs\ %
":compiler clj-kondo"
":make"
"Or :Dispatch -compiler=clj-kondo"
