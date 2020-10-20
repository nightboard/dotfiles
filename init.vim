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
Plug 'voldikss/vim-floaterm'								"float term
Plug 'maksimr/vim-jsbeautify'								"formate
Plug 'joshdick/onedark.vim'									"colorscheme
Plug 'kyoz/purify', { 'rtp': 'vim' }						"colorscheme
Plug 'pangloss/vim-javascript'								"js highlight

							"auto completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'w0rp/ale'											"ale
"Plug 'valloric/youcompleteme'                              "youcompleteme
"Plug 'prabirshrestha/vim-lsp'								"lsp
"Plug 'mattn/vim-lsp-settings'								"lsp settings
"Plug 'prabirshrestha/asyncomplete.vim'						"auto complete
call plug#end()
"----------------------------------------------------------------------------------------------------------

"----------------------------------------------colorscheme-----------------------------------------------
"-----------------gruvbox------------------
" colorscheme gruvbox
"
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_invert_selection='0'
"------------------------------------------

"-----------------colorcolumn------------------
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey
"----------------------------------------------

"-----------------neodark------------------
" colorscheme onedark
colorscheme purify
"------------------------------------------


"-----------------neodark------------------
" colorscheme neodark
"
" autocmd * highlight Normal ctermbg=none
" autocmd * highlight NonText ctermbg=none
"
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

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
set numberwidth=2
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
set cmdheight=1
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
	autocmd FileType markdown nnoremap <buffer> <F5> :w<esc>:FloatermNew mdv %<CR>

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

" Some shortcuts
	nnoremap ci( f)ci(
	nnoremap E $

" full screen mode
	nnoremap <F3> :AirlineToggle<CR><esc>:set laststatus=0<CR>
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
autocmd BufNewFile *.cpp r ~/.config/nvim/templates/a.cpp

set timeoutlen=1000
set ttimeoutlen=0
"----------------------------------------------------------------------------------------------------------

"--------------------------------------------lsp----------------------------------------------------------
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'allowlist': ['python'],
"         \ })
" endif
"
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> gr <plug>(lsp-references)
"     nmap <buffer> gi <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
"     nmap <buffer> <leader>rn <plug>(lsp-rename)
"     nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
"     nmap <buffer> K <plug>(lsp-hover)
"
"     " refer to doc to add more commands
" endfunction
"
" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
"---------------------------------------------------------------------------------------------------------

"--------------------------------------------coc-nvim-----------------------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"---------------------------------------------------------------------------------------------------------
