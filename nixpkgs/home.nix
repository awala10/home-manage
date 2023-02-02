{ config,  pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "awala";
  home.homeDirectory = "/home/awala";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tree
    gnupg
    ctags
    screen
  ];
  programs.bash = {

    enable = true;
    enableCompletion = true;
    historySize = 10000;
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    historyIgnore = [
      "ls *"
      "exit"
      "history *"
      "tree *"
    ];
    bashrcExtra = ''
      shopt -s autocd
      set -o vi
      '';
  };
#  programs.zsh = {
#    enable = true;
#    enableAutosuggestions = true;
#    enableCompletion = true;
#    enableSyntaxHighlighting = true;
#    autocd = true;
#    historySubstringSearch.searchDownKey = true;
#
#  };
  programs.git = {
    enable = true;
    userName = "awala10";
    userEmail = "khalad.awala@gmail.com";
  };
  programs.vim = {
    enable = true;
    extraConfig = ''
      syntax on
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
      nmap <leader>w :wq<CR>
      nmap <leader>! :q!<CR>
      set list listchars+=eol:¬,trail:¶
      let &t_SI="\e[6.q"
      let &t_EI="\e[1.q"
      autocmd BufWritePre * %s/\s\+$//e
      '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-surround
      vim-lastplace
      vim-gitgutter
      vim-better-whitespace
      vim-yaml
    ];
  };
}
