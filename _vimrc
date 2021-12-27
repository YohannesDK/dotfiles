" visual studio commands:
" https://docs.microsoft.com/en-us/visualstudio/ide/default-keyboard-shortcuts-in-visual-studio?view=vs-2019
let mapleader=" "

nnoremap <Tab> >>
nnoremap <Shift><Tab> <<

" escape
inoremap kj <Esc>
vnoremap <Tab> <Esc>

" shortcurts
nnoremap <leader>s :vsc Window.QuickLaunch<cr>
vnoremap <leader>s :vsc Window.QuickLaunch<cr>


set wildmenu

set number
set relativenumber
