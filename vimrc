"source $VIM/_vimrc

execute pathogen#infect()

autocmd vimenter * NERDTree

let g:NERDTreeWinSize=41
"https://www.reddit.com/r/vim/comments/a4yzyt/g_characters_prefixing_directory_and_file_names/
let g:NERDTreeNodeDelimiter = "\u00a0"

"set runtimepath^=~/.vim/bundle/ctrlp.vim

set nocompatible
"set verbose=9

" enable per-project configuration files and secure it
set exrc
set secure

":nmap <F6> :w<CR>:!ruby %<CR>
":nmap ,t :w\|:!ruby %<CR>
:nmap ,t :w\|:!ruby %<CR>
:nmap ,b :w\|:!bash %<CR>
:nmap ,ne :NERDTree<CR> " https://stackoverflow.com/questions/6467634/create-a-command-shortcut-for-nerdtree-in-vim-editor
" :command NE NERDTree

"colorscheme ir_black
"colorscheme dim
"colorscheme slate
"colorscheme Tomorrow-Night
"colorscheme grb256
"colorscheme obsidian2

"This is from a vim.org tip to help break people from the habit of hitting
"escape when unneeded
"nmap <Esc> :execute 'wq! ' . bufname(bufnr('%')) . '.p0wned'<CR>

" vim -b : edit binary using xxd-format!
	augroup Binary
	  au!
	  au BufReadPre  *.mpp let &bin=1
	  au BufReadPost *.mpp if &bin | %!xxd
	  au BufReadPost *.mpp set ft=xxd | endif
	  au BufWritePre *.mpp if &bin | %!xxd -r
	  au BufWritePre *.mpp endif
	  au BufWritePost *.mpp if &bin | %!xxd
	  au BufWritePost *.mpp set nomod | endif
	augroup END
"

"Remap how to switch between windows
"The 15 is how big the window should be
map <C-J> <C-W>j<15C-W>_
map <C-K> <C-W>k<15C-W>

"Set encoding
"The console (on Windows) might be cp850 or cp437
"To reload the file with a different encoding use
":e ++enc=cp850
"To see the current encoding use the following
":echo &encoding
set encoding=utf-8

let showmarks_enable=0

"set nowrap
set winwidth=40
let g:netrw_altv=1

au BufRead text set textwidth=70
au BufRead text set nowrap
au BufRead xml set nowrap

set wildmenu
set wildmode=longest,full

"Try to show at least three lines and two columns of context when scolling
set scrolloff=3
set sidescrolloff=2

"Remove the pre-existing search string
"autocmd VimEnter * nohls

if has("gui_running")
  "colorscheme darkblue
  "colorscheme inkpot
endif

"set background=dark
filetype plugin indent on

"https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown nocin tw=79
autocmd BufNewFile,BufReadPost *.html set tw=79

"The following is really nice for editing paragraphs, but not for coding
"set formatoptions+=a

syntax on
"set nohlsearch
set incsearch " hightlight as you type
set showcmd "show command we are typing
set showmatch " show matching brackets

set backspace=2 " :help 'backspace'
set ai
"set si
set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo


"http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


"http://fahdshariff.blogspot.com/2012/06/vim-change-statusline-colour-based-on.html
" statusline
" format markers:
"   %t File name (tail) of file in the buffer
"   %m Modified flag, text is " [+]"; " [-]" if 'modifiable' is off.
"   %r Readonly flag, text is " [RO]".
"   %y Type of file in the buffer, e.g., " [vim]".
"   %= Separation point between left and right aligned items.
"   %l Line number.
"   %L Number of lines in buffer.
"   %c Column number.
"   %P percentage through buffer
set statusline=%t\ %m%r%y%=(%l/%L,%c)\ (%P)
set laststatus=2
" change highlighting based on mode
"if version >= 700
" highlight statusLine cterm=bold ctermfg=black ctermbg=red
" au InsertLeave * highlight StatusLine cterm=bold ctermfg=black ctermbg=red
" au InsertEnter * highlight StatusLine cterm=bold ctermfg=black ctermbg=green
"ndif


set ruler
"set rulerformat=%l,%c%V%=%P
set rulerformat=%l\:%c       "better ruler format"

hi statusline guibg=DarkGrey ctermfg=White guifg=White ctermbg=DarkGrey
hi statuslinenc guibg=DarkGrey ctermfg=LightGrey guifg=White ctermbg=DarkGrey
