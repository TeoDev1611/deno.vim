" Author: TeoDev1611
" Version: 0.1.0
" Mantainer: TeoDev1611
" Deno Vim

" Config Variables
let g:deno_fmt = 'deno fmt '
let g:deno_cache = 'deno cache '
let g:deno_run = 'deno run -A '
let g:deno_doc = 'deno doc --json '
" Util variables
let s:current_time = strftime('%c')
let s:path = expand('<sfile>:p')

if !executable("deno")
  echoerr "Deno executable not found"
  finish
endif

" Fmt Runner
function DenoFmt()
  execute "!" . g:deno_fmt
  echo "Succesfuly formated with: " . g:deno_fmt
  echomsg "Fmt runned at " . s:current_time . "with: " . g:deno_fmt "path: " . s:path
endfunction

" Cache runner
function DenoCache()
  execute "!". g:deno_cache . s:path	
  echo "Cached succesfuly with: " . g:deno_cache
  echomsg "Cache runned at " . s:current_time . "with: " . g:deno_cache "path: " . s:path
endfunction

" Run current file
function DenoRun()
  execute "!". g:deno_run . s:path
  echo "Script runned succesfuly with: " . g:deno_run
  echomsg "Script runned at " . s:current_time . "with: " . g:deno_run "path: " . s:path
endfunction

" Deno Doc arg
function DenoDoc()
  let s:inputUser = input("Name of the module or the file?: ")
  if empty(s:inputUser)
    echoerr "The input is required"
    echomsg "Command Runned at " . s:current_time . "with: " . g:deno_doc
    finish
  else
    execute "!". g:deno_doc . s:inputUser
    echo "Documentation runned with: ". g:deno_doc
    echomsg "Script runned at " . s:current_time . "with: " . g:deno_doc "path: " . s:path
  endif
endfunction

" Register the commands 
command! -nargs=0 DenoFmt call DenoFmt()
command! -nargs=0 DenoCache call DenoCache()
command! -nargs=0 DenoRun call DenoRun()
command! -nargs=0 DenoDoc call DenoDoc()
