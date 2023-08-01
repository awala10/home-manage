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
    vim-fugitive
    nord-vim
    vim-terraform
#   YouCompleteMe
    # vim-one
  ];

  extraConfig = builtins.readFile ./vimrc;
  }
