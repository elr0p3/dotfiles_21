" ----- USER CONFIG -----

" UTF-8
set encoding=utf-8

" Options
" 'ic' 'ignorecase'       ignore upper/lower case when searching
" 'is' 'incsearch'        show partial matches for a search phrase
" 'hls' 'hlsearch'        highlight all matching phrases

" Pal raton
set mouse=a

" 1 tab == 4 spaces, with intelligent indenting
set shiftwidth=4
set tabstop=4
"softtabstop
"smarttab
set noexpandtab
set cinkeys-=:
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" Setting vertical line
set colorcolumn=79
highlight ColorColumn ctermbg=236

" Floating windows and pmenu colors
highlight NormalFloat ctermbg=237
highlight Pmenu ctermbg=237 ctermfg=255

" Shows the line count on the left
set number
highlight LineNr ctermfg=darkgrey

" System clipboard by default. Doesn't clear the clipboard when closing vim
" set clipboard=unnamed,unnamedplus
" autocmd VimLeave * call system("xsel -ib", getreg('+'))
" System clipboard by default and not clearing it when vim is closed: requires
" xsel.
set clipboard=unnamedplus
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Set a Cursor Line (and Cursor Column) https://vim.fandom.com/wiki/Highlight_current_line
set cursorline
"set cursorcolumn
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


" ----- COMMANDS -----
set splitbelow
highlight ColorColumn ctermbg=236
command Term :split | resize 16 | term
noremap ,t :Term<CR>


"  ----- PLUGINS -----

" Specify a directory for plugins
" - For Vim: ~/.vim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'

"Plug 'arcticicestudio/nord-vim' ", { 'for': 'go' }
"Plug 'dikiaap/minimalist'
"Plug 'trevordmiller/nova-vim'
"Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
"Plug 'dracula/vim'
"Plug 'ayu-theme/ayu-vim'

" Initialize plugin system
call plug#end()


" NERDCommenter
let NERDSpaceDelims=1
noremap ,c :call NERDComment(0,'Toggle')<CR>

" Lightline
"set noshowmode
"set laststatus=2

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * 
     \ if (argc() == 0 && !exists("s:std_in")) || isdirectory(expand('%'))
         \ | NERDTree |
     \ endif
let NERDTreeShowHidden=1
let NERDTreeWinSize=25


" ----- THEME SETTINGS -----

" Nord
"set termguicolors
"colorscheme nord

" Minimalist
"set t_Co=256
"syntax on
"colorscheme minimalist

" Nova
" # configure transparent background
"let g:nova_transparent = 1
"syntax enable
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set termguicolors
"set background=dark
"colorscheme nova

" One
" Setting for the theme one
"let g:airline_theme='one'
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
"set background=dark " for the dark version
"" set background=light " for the light version
"let g:one_allow_italics = 1 " I love italic for comments
"colorscheme one

" Gruvbox
" set bg=dark https://www.vim.org/scripts/script.php?script_id=4349
" set background=dark
" let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox

" Dracula
"set termguicolors
"colorscheme dracula

" Ayu-vim
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
