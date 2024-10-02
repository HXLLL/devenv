set nocompatible
filetype plugin indent on
set backspace=indent,eol,start 

set fileencodings=ucs-bom,utf-8,cp936

set nowrap
set number
set relativenumber
set ruler

"search
set ignorecase
set smartcase
set hlsearch

syntax on
"indent
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

set showcmd
set diffopt="filter, vertical"

set t_Co=256

"maps
noremap ' `
noremap H ^
noremap L $
noremap K H
noremap J L
noremap Y J
noremap $ K

"copy & paste
let mapleader = "\<Space>"
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>d "+d
noremap <Leader>y "+y
"preserving clearing clipboard after exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"auto correct
iab itn int
iab viod void
inoremap {<CR> {<CR>}<ESC>O
command! W w

"compile & exec & debug

func! Compile()
	if &filetype == "ocaml"
        if filereadable("dune")
            exec "!dune build"
        else
            exec "!ocamlc % -o %<"
        endif
	endif
	if &filetype == "haskell"
		exec "!ghc % -o %<"
	endif
	if &filetype == "graphviz" || &filetype == "dot"
		exec "!dot -Tpng % -o %<.png"
	endif
	if &filetype == "c"
		exec ":w"
		exec "!gcc % -o %< -Wall -g3"
	endif
	if &filetype == "cpp"
		exec ":w"
		exec "!g++ % -o %< -Wall -g3 -std=c++20"
	endif
  if &filetype == "rust"
      exec ":w"
      exec ":!cargo check"
  endif
  if &filetype == "sh"
      exec "!chmod +x ./%"
  endif
  if &filetype == "pascal"
      exec "!fpc %"
  endif
  if &filetype == "scala"
      exec "!scalac %"
  endif
endfunc
func! Exec()
    if &filetype == "ruby"
        exec ":w"
        exec "!ruby %"
    endif
	if &filetype == "ocaml"
        if filereadable("dune")
            exec "!dune exec ./%<.exe"
        else
            exec "!./%<"
        endif
	endif
	if &filetype == "haskell"
		exec "!./%<"
	endif
	if &filetype == "graphviz" || &filetype == "dot"
		exec "!%<.png"
	endif
	if &filetype == "c"
		exec "!./%<"
	endif
	if &filetype == "cpp"
		exec "!./%<"
	endif
	if &filetype == "python"
		exec "!python %"
	endif
  if &filetype == "rust"
      exec "!cargo run"
  endif
  if &filetype == "sh"
      exec "!./%"
  endif
  if &filetype == "pascal"
      exec "!./%<"
  endif
  if &filetype == "scala"
      exec "!scala %"
  endif
endfunc
func! Debug()
	if &filetype == "c"
		exec ":w"
		exec "!gcc % -o %< -g3 -Wall"
		exec "!lldb %<"
	endif
	if &filetype == "cpp"
		exec ":w"
		exec "!g++ % -o %< -g3 -Wall"
		exec "!lldb %<"
	endif
endfunc

nnoremap <Enter> :noh<CR>
nnoremap <C-H> :noh<CR>
noremap <F8> <ESC>gg"+yG
nnoremap <F9> :w<CR>:call Compile()<CR>
nnoremap <F10> :call Exec()<CR>
nnoremap <F11> :w<CR>:call Compile()<CR>:call Exec()<CR>
nnoremap <F5> :call Debug()<CR><CR><CR>

noremap <C-F12> <ESC>:source ~\.vimrc<CR>
