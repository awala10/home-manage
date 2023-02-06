{ config,  pkgs, ... }:
let
  vimsettings = import ./vim.nix;
  packages =  import ./packages.nix pkgs;
  bashsettings = import ./bash.nix pkgs;
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "awala";
    homeDirectory = "/home/awala";
    packages = packages;
    stateVersion = "22.11";
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
    bash = bashsettings;
    vim = vimsettings pkgs;
    git = {
      enable = true;
      userName = "awala10";
      userEmail = "khalad.awala@gmail.com";
    };
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
#  programs.git = {
#    enable = true;
#    userName = "awala10";
#    userEmail = "khalad.awala@gmail.com";
#  };

}
