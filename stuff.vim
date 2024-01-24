func public#stuff#Out() abort
	" Create a channel log so we can see what happens.
call ch_logfile('logfile', 'w')

" Function handling a line of text that has been typed.
func TextEntered(text)
  " Send the text to a shell with Enter appended.

  call ch_sendraw(s:shell_job, a:text .. "\n")
endfunc

" Function handling output from the shell: Add it above the prompt.
func GotOutput(channel, msg)
  call append(line("$") - 1, "- " .. a:msg)
endfunc

" Function handling the shell exits: close the window.
func JobExit(job, status)
  quit!
endfunc

" Start a shell in the background.
let s:shell_job = job_start(["/bin/zsh"], #{
	\ out_cb: function('GotOutput'),
	\ err_cb: function('GotOutput'),
	\ exit_cb: function('JobExit'),
	\ })

new
set buftype=prompt
set nonumber
let buf = bufnr('')
call prompt_setcallback(buf, function("TextEntered"))
eval prompt_setprompt(buf, "$> ")

" start accepting shell commands
startinsert
endfunc
