""""""""""""""""""""""""""""""""""""""""
"""" @ri7nz <ri7nz.labs@gmail.com> """""
""""""""""""""""""""""""""""""""""""""""

" map leader to space
let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>

set encoding=utf8

" Search down into subfulder with find
set path+=**
" set guifont=DroidSansMono_Nerd_Font:h11
set guifont=Hack_Nerd_Font:h11

" Display all matching files when we tab complete
set wildmenu

" commenter
let g:NERDSpaceDelims = 1

" we want pretty symbol when available
set t_CO=256

" set unittest
let g:test#php#phpunit#executable = "docker exec -w /var/www/mami53 laradock_workspace_1 ./vendor/bin/phpunit"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Convert between camel and snek case (and kebab case)
Plug 'nicwest/vim-camelsnek'

" install candid themes vim
Plug 'flrnd/candid.vim'

" vim surround
Plug 'tpope/vim-surround'

" Vim-php-namespace is a vim plugin for inserting use statements automatically
Plug 'arnaud-lb/vim-php-namespace'

" themes
Plug 'ParamagicDev/vim-medic_chalk'

" vim for comment code
Plug 'preservim/nerdcommenter'

" install for git blame
Plug 'zivyangll/git-blame.vim'

" themes nord
Plug 'arcticicestudio/nord-vim'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ReasonML
" Plug 'jordwalke/vim-reasonml'
Plug 'reasonml-editor/vim-reason-plus'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'alok/notational-fzf-vim'
let g:nv_search_paths = ['~/wiki', '~/writing', 'docs.md' , './notes.md']
let g:python3_host_prog = "/usr/bin/python3.7" 


" Dash Documentation
Plug 'rizzatti/dash.vim'

" NERDTreeToggle 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dsimidzija/vim-nerdtree-ignore'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utility
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'gilsondev/searchtasks.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'majutsushi/tagbar'
" Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'yardnsm/vim-import-cost', {'do': 'yarn install'}

" Communicate with tmux
Plug 'benmills/vimux' 
Plug 'tyewang/vimux-jest-test'

" Tracking
Plug 'wakatime/vim-wakatime'

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'

" Theme / Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/Colorizer'

" Icon
Plug 'ryanoasis/vim-devicons'

" Generic Programming Support Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'tobyS/vmustache'
Plug 'janko/vim-test'

" Lint
Plug 'dense-analysis/ale'

" Javascript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'trkw/yarn.vim'

Plug 'vifm/vifm.vim'

""" NEED TO TRY
" junegunn/vim-easy-align
" Plug 'itchyny/lightline.vim'
" Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" for multiple cursor
""" Plug 'terryma/vim-multiple-cursors'

""" 
call plug#end()
" essential & common configuration
source ~/.vimrc.common
" LanguageServer configuration  
" source ~/.vimrc.lsp
source ~/.vimrc.reasonml 
" theme & fancy configuration
source ~/.vimrc.theme
" fuzzy finder
source ~/.vimrc.fzf
" asynchronous lint engine
source ~/.vimrc.ale
" keyboard mapping configuration
source ~/.vimrc.mapping
" COC/Intelisense
source ~/.vimrc.coc
" Javascript
source ~/.vimrc.javascript 
" SideBar for file finder
source ~/.vimrc.nerdtree 
" Vim function
source ~/.vimrc.fun
" EasyMotion
source ~/.vimrc.easymotion

" colorscheme nord
set termguicolors
set background=dark
syntax on
colorscheme candid

"" if you use lightline
" Lightline
let g:lightline = { 'colorscheme': 'candid' }
highlight LineNr guifg=grey

" colorscheme medic_chalk
" hi CursorLine   cterm=NONE ctermbg="#25533"
