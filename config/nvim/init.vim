call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'zim0369/butcher'
Plug 'simeji/winresizer'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'easymotion/vim-easymotion'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'yuttie/comfortable-motion.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
" Themes dark
Plug 'sjl/badwolf'
Plug 'tomasr/molokai' 
Plug 'w0ng/vim-hybrid' 
Plug 'yuttie/hydrangea-vim' 
Plug 'tomasiser/vim-code-dark' 
Plug 'AlessandroYorba/Despacio' 
Plug 'arcticicestudio/nord-vim' 
Plug 'rafalbromirski/vim-aurora' 
Plug 'ghifarit53/tokyonight-vim' 
Plug 'tyrannicaltoucan/vim-deep-space' 
" Themes light/dark
Plug 'morhetz/gruvbox'
Plug 'nightsense/snow' 
Plug 'cocopon/iceberg.vim' 
Plug 'junegunn/seoul256.vim'
Plug 'nightsense/stellarized' 
Plug 'nightsense/cosmic_latte' 
Plug 'NLKNguyen/papercolor-theme' 
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()			

syntax on
set nocompatible
let mapleader=" " 
filetype plugin indent on

source /home/zim/.config/nvim/settings.vim
source /home/zim/.config/nvim/autocmd.vim
source /home/zim/.config/nvim/plugin.vim
source /home/zim/.config/nvim/theme.vim
source /home/zim/.config/nvim/compiler.vim
source /home/zim/.config/nvim/shortcuts.vim
