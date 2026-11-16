
" ================================
"      Leader & Escape
" ================================

" Space is the leader key; written as <Space> directly for reliability
unmap <Space>

" Escape from insert/visual mode with kj
inoremap kj <Esc>
vnoremap kj <Esc>

" ================================
"      Navigation
" ================================

" Move by visual lines
nmap j gj
nmap k gk

" Pane navigation (Ctrl-h/j/k/l) – remove Obsidian's Ctrl+H/J/K/L hotkeys first
exmap focusleft obcommand editor:focus-left
exmap focusdown obcommand editor:focus-bottom
exmap focusup obcommand editor:focus-top
exmap focusright obcommand editor:focus-right
nmap <C-h> :focusleft<CR>
nmap <C-j> :focusdown<CR>
nmap <C-k> :focusup<CR>
nmap <C-l> :focusright<CR>

" Splits
exmap splitvertical obcommand workspace:split-vertical
exmap splithorizontal obcommand workspace:split-horizontal
nmap <Space>v :splitvertical<CR>

" Cursor moves
nmap <Space>g G
nmap <Space>h 0
nmap <Space>l $
vmap <Space>h 0
vmap <Space>l $

" File search (Quick Switcher)
exmap quickswitcher obcommand switcher:open
nmap <Space>s :quickswitcher<CR>

" ================================
"      Sidebar / File panel
" ================================

" Toggle collapse of the left sidebar
exmap toggleleft obcommand app:toggle-left-sidebar
nmap <Space>b :toggleleft<CR>

" Focus the file explorer in the left panel (opens the sidebar if it's collapsed)
exmap focusfiles obcommand file-explorer:open
nmap <Space>e :focusfiles<CR>

" Close the current split, including all tabs in it
exmap closesplit obcommand workspace:close-tab-group
nmap <Space>x :closesplit<CR>

