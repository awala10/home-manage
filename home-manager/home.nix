{ config,  pkgs, ... }:
let
  vimsettings = import ./vim.nix;
  packages =  import ./packages.nix pkgs;
  bashsettings = import ./bash.nix;
  tmuxConf = import ./tmux.nix;
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "awala";
    homeDirectory = "/home/awala";
    packages = packages;
    stateVersion = "23.05";
  };
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # Let Home Manager install and manage itself.
  programs = {
    home-manager = {
      enable = true;
    };
    bash = bashsettings pkgs;
    vim = vimsettings pkgs;
    tmux = tmuxConf pkgs;
    git = {
      enable = true;
      userName = "xxxxxxxxx";
      userEmail = "xxxxxxxxxxxxxx";
    };
  };
#  programs.zsh = {
#    enable = true;
#    enableAutosuggestions = true;
#    enableCompletion = true;
#    enableSyntaxHighlighting = true;
#    autocd = true;
#    historySubstringSearch.searchDownKey = true;
#  };
}
