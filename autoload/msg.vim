function! msg#DebugMsg(msg)	" {{{2
    if s:IsDebugMsgOn()
	echohl WarningMsg
	echomsg a:msg
	echohl None
    endif
endfunction

function! msg#Assert(num, ...)	" {{{2
    if !a:num
	throw 'MsgException for '.string(a:num)
    endif
endfunction

function! msg#WarningMsg(msg)	" {{{2
    echohl WarningMsg
    echomsg a:msg
    echohl None
endfunction

function! msg#ErrorMsg(msg)	" {{{2
    echohl ErrorMsg
    echomsg a:msg
    echohl None
endfunction

function! s:IsDebugMsgOn()	" {{{2
    if exists('g:debug_msg_status') && type(g:debug_msg_status) != type(0)
	unlet g:debug_msg_status
    endif
    if !exists('g:debug_msg_status')
	let g:debug_msg_status = 0
    endif
    return g:debug_msg_status
endfunction

function! msg#ToggleDebugMsgStatus()	" {{{2
    let g:debug_msg_status = !s:IsDebugMsgOn()
endfunction
