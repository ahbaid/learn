syntax on
set matchpairs=(:),[:],{:},<:>
set number
set noautoindent
set nowrap
set syntax=plsql
set tabstop=3
set laststatus=2
set statusline=%F:%y:(%l,%c)
highlight CursorLine ctermbg=lightgray
highlight CursorColumn ctermbg=lightgray

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
set dictionary=~/dictionaries/default.dic,~/dictionaries/oracle_keywords.dic
set tags=~/dictionaries/ahbaid.tags
" }}}

" {{{ Folding
if has("folding")
  highlight Folded term=standout ctermfg=Yellow ctermbg=Blue
  set commentstring=#%s
  set fillchars="vert:|,fold: "
  set foldmethod=marker
  set foldmarker={,}

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
map   <F2>    :OracleSQLProcedureHeader<CR>
map   <F3>    :OracleSQLPackageHeader<CR>
map   <F6>    :set cursorline!<CR>
map   <F7>    :set cursorcolumn!<CR>
map   <F8>    :set number!<CR>
map   <F10>   :bdel<CR>
map   <F11>   :bp!<CR>
map   <F12>   :bn!<CR>
" }}}

