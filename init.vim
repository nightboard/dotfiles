let mapleader =","

"-----------------------------------------plugin manager---------------------------------------------------
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
"----------------------------------------------------------------------------------------------------------

"-------------------------------------------plugins--------------------------------------------------------
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'KeitaNakamura/neodark.vim'							"dark theme
Plug 'majutsushi/tagbar'									"tagbar { do : pacman -S ctags }
Plug 'tomtom/tcomment_vim'									"comment : gc
Plug 'octol/vim-cpp-enhanced-highlight'			            "systax highlight for c/c++
Plug 'sheerun/vim-polyglot'				                    "for syntax collection of language pacs
Plug 'morhetz/gruvbox'                                      "gruv box
Plug 'jiangmiao/auto-pairs'				                    "auto pair braces in nvim
Plug 'scrooloose/syntastic'				                    "detect error in clang
Plug 'jremmen/vim-ripgrep'                                  "fast grep
Plug 'lyuts/vim-rtags'                                      "for c++
Plug 'mbbill/undotree'                                      "for undo stuff
Plug 'valloric/youcompleteme'                               "youcompleteme
Plug 'voldikss/vim-floaterm'								"float term
Plug 'prabirshrestha/vim-lsp'								"lsp
Plug 'mattn/vim-lsp-settings'								"lsp settings
Plug 'prabirshrestha/asyncomplete.vim'						"auto complete
call plug#end()
"----------------------------------------------------------------------------------------------------------

"----------------------------------------------colorscheme-----------------------------------------------
"-----------------gruvbox------------------
" colorscheme gruvbox
"
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_invert_selection='0'
"------------------------------------------


"-----------------neodark------------------
colorscheme neodark

" autocmd * highlight Normal ctermbg=none
" autocmd * highlight NonText ctermbg=none

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" make transparant
"------------------------------------------

"-------------------------------------------------basic---------------------------------------------------
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/.vim/undodir
set undofile
set incsearch
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
nnoremap [ {
nnoremap ] }
" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"--------------------------------------------------------------------------------------------------------

"------------------------------------------mappings------------------------------------------------------
"auto compile
	autocmd FileType javascript nnoremap <buffer> <F5> :w<esc>:FloatermNew node %<CR>
	autocmd FileType c nnoremap <buffer> <F5> :w<esc>:FloatermNew gcc % && ./a.out && rm a.out<CR>
	autocmd FileType cpp nnoremap <buffer> <F5> :w<esc>:FloatermNew g++ % && ./a.out && rm a.out<CR>
	autocmd FileType python nnoremap <buffer> <F5> :w<esc>:FloatermNew python3 %<CR>
	autocmd FileType typescript nnoremap <buffer> <F5> :w<esc>:FloatermNew ts-node %<CR>
	autocmd FileType typescript nnoremap <leader>j :w<esc>:FloatermNew tsc % --outFile a.js ; cat a.js ; rm a.js<CR>

"tagbar toggle
	nnoremap <F2> :w<esc>:TagbarToggle<CR>

"groff document
	nmap <c-g> :! groff -ms -e % -T pdf > output.pdf ; zathura output.pdf<CR><CR>

"undotree
	nnoremap <leader>u :UndotreeToggle<CR>


"Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>
"---------------------------------------------------------------------------------------------------------

"---------------------------------------------Nerd tree---------------------------------------------------
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = '~/.config/nvim/.vim' . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif
"----------------------------------------------------------------------------------------------------------

"--------------------------------------------helpful------------------------------------------------------
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

"comment
noremap <C-m> :normal! I//<CR>

noremap <C-m> :<S-Left>exe "<S-Right>normal! I".b:commentType<CR>

autocmd BufReadPost *.[ch] let b:commentType='//' "C files
autocmd BufReadPost *.pl let b:commentType='#'    "Perl files

set timeoutlen=1000
set ttimeoutlen=0
"----------------------------------------------------------------------------------------------------------

"--------------------------------------------lsp----------------------------------------------------------
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"---------------------------------------------------------------------------------------------------------
