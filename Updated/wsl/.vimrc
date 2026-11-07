" ================================
"      Basic Settings
" ================================

let mapleader = " "
inoremap kj <Esc>
set nocompatible

" ================================
"      Plugin Manager: vim-plug
" ================================

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'   " Enable easymotion if desired

call plug#end()

" ================================
"      Visuals & UI
" ================================

syntax on
set number
set relativenumber
set ruler
set cursorline
set showmode
set showcmd
set laststatus=2
set listchars=tab:▸\ ,eol:¬
nnoremap <leader>l :set list!<CR>
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
set visualbell
set showmatch
set mouse=a

" ================================
"      Indentation & Whitespace
" ================================

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set wrap
set textwidth=79
set formatoptions=tcqrn1
set backspace=indent,eol,start

" ================================
"      Navigation & Splits
" ================================

" Move by visual lines
nnoremap j gj
nnoremap k gk

" Navigate between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open vertical/horizontal splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Scroll context
set scrolloff=3
set hidden
set ttyfast

" ================================
"      Searching
" ================================

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <leader><space> :let @/=''<CR>

" ================================
"      Plugin Key Mappings
" ================================

" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>:wincmd p<CR>
nnoremap <leader>e :NERDTreeToggle<CR>:wincmd p<CR>
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

" ================================
"      VSCode Vim-like Mappings
" ================================

" Simulate VSCode command palette (replace with real fuzzy finder plugin if desired)
nnoremap <leader>p :Commands<CR>

" Write and quit
nnoremap <leader>q :wq<CR>

" Cursor moves
nnoremap <leader>g G
nnoremap <leader>h 0
nnoremap <leader>l $
nnoremap <leader>r <C-r>

" Toggle panel/split equivalents
nnoremap <leader>j :copen<CR>
nnoremap <leader>d :q<CR>
nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>s :Files<CR>

" ================================
"      Visual/Insert mode mappings
" ================================

" Escape from insert and visual mode
inoremap kj <Esc>
vnoremap kj <Esc>

" Visual mode cursor home/end
vnoremap <leader>h 0
vnoremap <leader>l $

" ================================
"      Misc
" ================================

set modelines=0
set encoding=utf-8
runtime! macros/matchit.vim
nnoremap <leader>fq gqip
inoremap <F1> <Esc>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

set clipboard=unnamedplus

" Function to write selection to Windows clipboard using clip.exe
function! YankToClipboard(type)
  if a:type ==# 'line'
    normal! '[V']y
  elseif a:type ==# 'char'
    normal! `[v`]y
  elseif a:type ==# 'block'
    echo "Block selection not supported"
    return
  endif
  call system('clip.exe', getreg('"'))
endfunction

" Use s to cut (like d) and copy to clipboard
vnoremap s d:call system('clip.exe', @")<CR>
nnoremap s "_d

" Remap yanks to also use Windows clipboard
xnoremap y y:call system('clip.exe', @")<CR>
nnoremap yy yy:call system('clip.exe', @")<CR>
nnoremap Y Y:call system('clip.exe', @")<CR>

" Remap deletions to also use clipboard (optional)
xnoremap d d:call system('clip.exe', @")<CR>
nnoremap dd dd:call system('clip.exe', @")<CR>

" Remap change 
xnoremap c c:call system('clip.exe', @")<CR>
nnoremap cc cc:call system('clip.exe', @")<CR>

