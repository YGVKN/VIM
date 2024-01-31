func public#stuff#Out() abort

  call ch_logfile('vimlogfile', 'w')

  func! TextEntered(text)
    call ch_sendraw(s:shell_job, a:text .. "\n")
  endfunc

  func! GotOutput(channel, msg)
    call append(line("$") - 1, "  " .. a:msg)
  endfunc

  func! JobExit(job, status)
    call job_stop(s:shell_job)
    echowindow "Job Status [" .. job_status(s:shell_job) .. "]"
    echomsg job_info(s:shell_job)
    quit!
  endfunc

  let s:shell_job = job_start([$SHELL], #{
        \ out_cb:   "GotOutput",
        \ err_cb:   "GotOutput",
        \ exit_cb:  "JobExit",
        \ noblock: 1,
    \ })

  new
  setlocal buftype=prompt
  setlocal nonumber
  let buf = bufnr('')
  call prompt_setcallback(buf, "TextEntered")
  eval prompt_setprompt(buf, "$>")
  sleep 1
  echowindow "Job Status [" .. job_status(s:shell_job) .. "]"
  startinsert
endfunc
