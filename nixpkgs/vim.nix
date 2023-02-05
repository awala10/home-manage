pkgs:

{
  enable = true;
  plugins = with pkgs.vimPlugins; [
    gruvbox
    vim-nix
    vim-airline
    vim-surround
    vim-lastplace
    vim-gitgutter
    vim-better-whitespace
    vim-yaml
  ];

  extraConfig = ''
  syntax on
  set background=dark
  filetype plugin indent on
  set nocompatible
  set hlsearch
  set autoread
  set expandtab
  set autoindent
  set number relativenumber
  set path+=**
  set ruler
  set wildmenu
  set noswapfile
  set showmatch
  set splitright
  au BufRead,BufNewFile *.yml,*.yaml set filetype=yaml
  let mapleader=","
  set cursorline

  nmap <leader>w :wq<CR>
  nmap <leader>! :q!<CR>
  set list listchars+=eol:¬,trail:¶
  let &t_SI="\e[6.q"
  let &t_EI="\e[1.q"
  autocmd BufWritePre * %s/\s\+$//e

  let g:airline_powerline_forts = 1
  let g:airline_theme='dark'
  colorscheme gruvbox
    '';
  }
