let mapleader =" "

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
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
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
Plug 'kyoz/purify', { 'rtp': 'vim' }						"colorscheme
Plug 'morhetz/gruvbox'                                      "colorscheme
Plug 'rust-lang/rust.vim'                                   "rust
Plug 'puremourning/vimspector'                              "debug
Plug 'szw/vim-maximizer'                                    "maximizer

							"auto completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
"----------------------------------------------------------------------------------------------------------

"----------------------------------------------colorscheme-----------------------------------------------
"-----------------gruvbox------------------
colorscheme gruvbox

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
"------------------------------------------

"-----------------colorcolumn------------------
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
"----------------------------------------------

"-----------------neodark------------------
" colorscheme purify
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
	autocmd FileType javascript nnoremap <leader>r :w<esc>:FloatermNew node %<CR>
	autocmd FileType c nnoremap <leader>r :w<esc>:FloatermNew gcc % && ./a.out && rm a.out<CR>
	autocmd FileType cpp nnoremap <leader>r :w<esc>:FloatermNew g++ % && ./a.out && rm a.out<CR>
	autocmd FileType python nnoremap <leader>r :w<esc>:FloatermNew python3 %<CR>
	autocmd FileType typescript nnoremap <leader>r :w<esc>:FloatermNew ts-node %<CR>
	autocmd FileType lua nnoremap <leader>r :w<esc>:FloatermNew lua %<CR>
	autocmd FileType markdown nnoremap <leader>r :w<esc>:FloatermNew mdv %<CR>
	autocmd FileType rust nnoremap <leader>r :w<esc>:FloatermNew rustc % -o a.out && ./a.out && rm a.out<CR>
	autocmd FileType typescript nnoremap <leader>j :w<esc>:FloatermNew tsc % --outFile a.js ; cat a.js ; rm a.js<CR>

" auto compile
	autocmd FileType c nnoremap <leader>R :w<esc>:term gcc % && ./a.out && rm a.out<CR>
	autocmd FileType javascript nnoremap <leader>R :w<esc>:term node %<CR>
	autocmd FileType cpp nnoremap <leader>R :w<esc>:term g++ % && ./a.out && rm a.out<CR>
	autocmd FileType python nnoremap <leader>R :w<esc>:term python3 %<CR>
	autocmd FileType typescript nnoremap <leader>R :w<esc>:term ts-node %<CR>
	autocmd FileType lua nnoremap <leader>R :w<esc>:term lua<CR>
	autocmd FileType markdown nnoremap <leader>R :w<esc>:term mdv %<CR>
	autocmd FileType rust nnoremap <leader>R :w<esc>:term rustc % -o a.out && ./a.out && rm a.out<CR>


"tagbar toggle
	nnoremap <leader>t :w<esc>:TagbarToggle<CR>

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
    nnoremap D <c-d>
    nnoremap U <c-u>

" terminal
	tnoremap <leader><esc> <C-\><C-N>

" full screen mode
	nnoremap <leader>m :AirlineToggle<CR><esc>:set laststatus=0<CR><esc>:set nonumber<CR><esc>:set norelativenumber<esc>:set noruler<esc>:set noshowmode<esc>:highlight NonText ctermfg=0<CR>
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

"--------------------------------------------vimspector-----------------------------------------------------
nnoremap <leader>M :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint

nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"---------------------------------------------------------------------------------------------------------
