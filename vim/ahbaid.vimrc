syntax on
set matchpairs=(:),[:],{:},<:>
set number
set noautoindent
set nowrap
set syntax=plsql
set tabstop=3

" {{{ Tab Completion
"
function! InsertTabWrapper(direction)
   let col = col('.') - 1

   if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
   elseif "backward" == a:direction
      return "\<c-p>"
   else
      return "\<c-n>"
   endif
endfunction
   
inoremap <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <tab> <c-r>=InsertTabWrapper ("backward")<cr>

" }}}

" {{{ Tag Completion
set complete=.,w,b,u,t,i,k
set dictionary=~/dictionaries/postgres.dic
set tags=~/dictionaries/vim-tags.txt
" }}}

" {{{ Folding
if has("folding")
  highlight Folded term=standout ctermfg=Yellow ctermbg=Blue
  set commentstring=#%s
  set fillchars="vert:|,fold: "
  set foldmethod=marker
  set foldmarker={{{,}}}

  fun! ToggleFold()
  if foldlevel('.') == 0
  normal! l
  else
  if foldclosed('.') < 0
  . foldclose
  else
  . foldopen
  endif
  endif
  " Clear status line
  echo
  endfun

  " Map this function to Space key.
  noremap <space> :call ToggleFold()<CR>

endif
" }}}

" {{{ Functions for SQL scripts

" {{{ function SQLSpool()
function SQLSpool()
   let @n="spool ".expand('%:t:r')."\n\n"
   put! n
endfunction
command! -nargs=0 SQLPromptSpool call SQLSpool()
" }}}

" {{{ function SQLConnect()
function SQLConnect()
   let schema=toupper(input("Connect to schema: "))
   let @n="PROMPT\n"
   let @n=@n."PROMPT Enter Password and TNS Connect String for ".schema."....\n"
   let @n=@n."PROMPT\n"
   let @n=@n."connect ".schema."\n\nset serveroutput on size 400000\nset autocommit off"
   put! n
endfunction
command! -nargs=0 SQLPromptConnect call SQLConnect()
" }}}

" {{{ function SQLContinue()
function SQLContinue()
   let mesg=input("Enter additional message: ")
   let @p="\nACCEPT continue PROMPT \"If there were errors, hit CTRL-C now ".mesg."....\"\n\n"
   put! p
endfunction
command! -nargs=0 SQLPromptContinue call SQLContinue()
" }}}

" {{{ function SQLHeader()
function SQLHeader()
   let @d="-- Author:\t\tAhbaid Gaffoor\n"
   let @d=@d."-- File:\t\t".expand('%')."\n"
"   let @d=@d."-- Date:\t\t".strftime("%c")."\n"
   let @d=@d."-- Date:\t\t"."$Date$"."\n"
   let @d=@d."-- Revision:\t\t"."$Revision$"."\n"
   let @d=@d."-- Use:\t\t\n\n"
   let @d=@d."spool ".expand('%:t:r')."\n\n"
   put! d
endfunction
command! -nargs=0 SQLPromptHeader call SQLHeader()
" }}}

" {{{ function SQLPackage()
function SQLPackage()
   let package=toupper(input("Enter Package Name: "))
   let @d="-- {{{ Package Specification\n"
   let @d=@d."create or replace package ".package." as\n\n"
   let @d=@d."end ".package.";\n"
   let @d=@d."/ \n"
   let @d=@d."show errors\n"
   let @d=@d."-- }}}\n\n"
   let @d=@d."-- {{{ Package Implementation\n"
   let @d=@d."create or replace package body ".package." as\n\n"
   let @d=@d."end ".package.";\n"
   let @d=@d."/ \n"
   let @d=@d."show errors\n"
   let @d=@d."-- }}}\n\n"
   put! d
endfunction
command! -nargs=0 SQLPackageHeader call SQLPackage()
" }}}

" {{{ function SQLProcedure()
function SQLProcedure()
   let procedure=input("Enter Procedure Name: ")
   let @d="-- {{{ procedure ".procedure."\n"
   let @d=@d."procedure ".procedure." is\n"
   let @d=@d."begin\n"
   let @d=@d."   null;\n"
   let @d=@d."end ".procedure.";\n"
   let @d=@d."-- }}}"
   put! d
endfunction
command! -nargs=0 SQLProcedureHeader call SQLProcedure()
" }}}

" }}}

" {{{ Functions for PHP scripts

" {{{ function PHPfunction ()
function PHPfunction ()
   let function=input("Enter Function Name: ")
   let @d="# {{{ function ".function."\n"
   let @d=@d."function ".function." () {\n"
   let @d=@d."}\n"
   let @d=@d."# }}}\n"
   put! d
endfunction
command! -nargs=0 PHPfunctionHeader call PHPfunction()
" }}}

" }}}

" {{{ Key Mappings
map   <F10>   :bdel<CR>
map   <F11>   :bp!<CR>
map   <F12>   :bn!<CR>
map   <F8>    :set number!<CR>

map   <F2>    :SQLProcedureHeader<CR>
map   <F3>    :SQLPackageHeader<CR>
map   <F4>    :SQLPromptHeader<CR>
map   <F5>    :SQLPromptSpool<CR>
map   <F6>    :SQLPromptConnect<CR>
map   <F7>    :SQLPromptContinue<CR>

map   <F9>    :PHPfunctionHeader<CR>
" }}}
