" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'tpope/vim-sensible'
" Plug 'https://github.com/supercollider/scvim.git'
" Plug 'davidgranstrom/scnvim', {'do': ':UpdateRemotePlugins'}
Plug 'davidgranstrom/scnvim', {'do': {-> scnvim#install()}}
Plug 'madskjeldgaard/vim-supercollider-snippets'
" Plug 'https://github.com/gregsexton/Atom.git'
" Plug 'rakr/vim-one'
" Plug 'sonph/onehalf'
Plug 'tikhomirov/vim-glsl'

" Typing
Plug 'https://tpope.io/vim/surround.git'
Plug 'jiangmiao/auto-pairs'

" Commentary
Plug 'https://tpope.io/vim/commentary.git'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
Plug 'sophacles/vim-processing'
Plug 'SirVer/ultisnips'
Plug 'vim-pandoc/vim-pandoc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'

" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jceb/vim-orgmode'

" Distraction-free mode
Plug 'junegunn/goyo.vim'

" Godot game engine
" Plug 'calviken/vim-gdscript3'

" Optional:
Plug 'honza/vim-snippets'

Plug 'tidalcycles/vim-tidal'

" note taking
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'

" firefox
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" music sequencer/tracker
Plug 'flipcoder/vim-textbeat'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

au VimEnter *.md :TableModeEnable

let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
set number
set relativenumber
set runtimepath+=~/.vim_runtime
" colorscheme purify
" colorscheme spacecamp
" colorscheme ayu
" colorscheme wombat256mod
" colorscheme one-dark
colorscheme OceanicNext
" let g:airline_theme='onehalfdark'
" highlight Normal ctermbg=234
" hi CursorLine guifg=none guibg=#333344 ctermbg=Gray
" hi Visual guifg=none guibg=#333344 gui=none
" hi Folded guifg=none guibg=#222222 ctermbg=Gray
" autocomplete popup menu
" hi Pmenu ctermbg=234 guibg=#444455
" set background=dark
set cursorline
set ruler
"add line marker
"add max column marker
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set linebreak
set textwidth=0
set wrapmargin=0
" recursive path
set path+=**

let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'scnvim-data']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Use deoplete.
let g:deoplete#enable_at_startup = 1

au BufEnter,BufWinEnter,BufNewFile,BufRead *.md,*.markdown set filetype=markdown
" do not close makdown preview tab when switchin to other buffers
let g:mkdp_auto_close = 0
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
nnoremap <M-m> :MarkdownPreview<CR>
autocmd filetype markdown normal zR

" File explorer 'netrw'
" let g:netrw_browse_split = 1
" let g:netrw_winsize = 25

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set filetype=supercollider
" au Filetype supercollider packadd scvim

au BufEnter,BufWinEnter,BufNewFile,BufRead *.tidal set filetype=tidal

" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * :Vexplore
" augroup END

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Supercollider
" let g:scFlash=1

" Key maps
" Shortcut SPACE for ':'
nmap <space> :
" Yank with 'Y' to the end of line
nmap Y y$
" Save file
map <C-S> :w<CR>
" Move around buffers
" nmap <C-N> :bn<CR>
" nmap <C-P> :bN<CR>
" Move around windows (splits)
" nmap <C-H> <C-W>h
" nmap <C-J> <C-W>j
" nmap <C-K> <C-W>k
" nmap <C-L> <C-W>l
" Autocomplete popup menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-g>u\<CR>"
inoremap <expr> <C-h> pumvisible() ? "\<C-p>" : "\<C-g>u\<CR>"
" Move lines or blocks of text up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Copy and paste
" nnoremap <C-c> "+y
" nnoremap <C-v> "+P
" inoremap <C-c> "+y
" inoremap <C-v> "+P
" vnoremap <C-c> "+y
" vnoremap <C-v> "+P


" Supercollider
" browse documentation in nvim (requires 'pandoc')
let g:scnvim_scdoc = 1
augroup sclang_maps
    autocmd!
    autocmd filetype supercollider imap <C-Q> <F12>
    autocmd filetype supercollider nmap <C-Q> <F12>
    autocmd filetype supercollider nmap ,. <F12>
    autocmd filetype supercollider nmap ,, <M-e>
    autocmd filetype supercollider vmap ,, <M-e>
    autocmd filetype supercollider nmap ,m <C-E>
    autocmd filetype supercollider nmap <Space> :
    autocmd filetype supercollider nmap ,ss :SCNvimStart<enter>
    autocmd filetype supercollider nmap ,sr :SCNvimRecompile<enter>
    autocmd filetype supercollider imap <Tab> <C-p>
    " snippets
    "a.do{|x| x._([].pseq(inf))}<Esc>F[a
    autocmd filetype supercollider nnoremap ,al a.do{\|x\| x};<Esc>Fx
    autocmd filetype supercollider nnoremap ,ar aArray.rand()<Esc>i
    autocmd filetype supercollider nnoremap ,Ar iArray.rand()<Esc>i
    autocmd filetype supercollider nnoremap ,tsa iTocata.sample(\)<Esc>i
    autocmd filetype supercollider nnoremap ,tsy iTocata.synth(\)<Esc>i
    autocmd filetype supercollider nnoremap ,deg a.degree_([].pseq(inf))<Esc>F[a
    autocmd filetype supercollider nnoremap ,dur a.dur_([].pseq(inf))<Esc>F[a
    autocmd filetype supercollider nnoremap ,leg a.legato_([].pseq(inf))<Esc>F[a
    autocmd filetype supercollider nnoremap ,amp a.amp_([].pseq(inf) * 0.2)<Esc>F[a
    autocmd filetype supercollider nnoremap ,syn :read ~/loopier/code/snippets/synthdef.scd<cr>/%<cr>s
augroup END

function! s:set_sclang_statusline()
    setlocal stl=
    setlocal stl+=%f
    setlocal stl+=%=
    setlocal stl+=%(%l,%c%)
    setlocal stl+=\ \|
    setlocal stl+=%18.18{scnvim#statusline#server_status()}
endfunction

augroup scnvim_stl
    autocmd!
    autocmd Filetype supercollider call <SID>set_sclang_statusline()
augroup END

let g:scnvim_postwin_size = 50
let g:scnvim_postwin_auto_toggle = 1
let g:scnvim_postwin_direction = 'left'
let g:scnvim_scdoc = 1
let g:scnvim_postwin_auto_toggle = 1
    
" Compile and run C++
autocmd filetype h nnoremap <C-Space> :w <bar> exec 'make Debug && make RunDebug'<CR>
autocmd filetype cpp nnoremap <C-Space> :w <bar> exec 'make Debug && make RunDebug'<CR>

" Compile and run Processing
autocmd filetype processing nnoremap <C-Space> :w <bar> :make<CR>

" TidalCycles
augroup tidal_maps
    autocmd!
    autocmd filetype tidal nmap ,m <C-e>
    autocmd filetype tidal nmap ,, \s
    autocmd filetype tidal setlocal commentstring=--%s
    autocmd filetype tidal nnoremap ,amps :put =map(range(1,6), 'printf(''# amp%d 0'', v:val)')<CR>
    autocmd filetype tidal nnoremap ,ratios :put =map(range(1,6), 'printf(''# ratio%d %d'', v:val, v:val)')<CR>
    autocmd filetype tidal colorscheme OceanicNext
    " autocmd filetype tidal hi Pmenu guifg=#666666 guibg=#222222
    " autocmd filetype tidal hi CursorLine guibg=#222222
augroup END

" run TidalCycles inside nivm (without tmux)
let g:tidal_target = "terminal"

" Org-mode
" au BufEnter,BufWinEnter,BufNewFile,BufRead *.org set filetype=org
" autocmd filetype org hi CursorLine guifg=none guibg=#333333

" Comment .Xresources
" au BufEnter,BufWinEnter,BufNewFile,BufRead .Xresources set filetype=xresources
" autocmd filetype xresources setlocal commentstring=!%s

" VimWiki
let g:vimwiki_list = [{
    \ 'path': '~/Dropbox/vimwiki', 
    \ 'ext': '.md'
    \}]
