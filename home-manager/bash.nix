pkgs: {
  enable = true;
  enableCompletion = true;
  #enableLsColors =true;
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
    "cd *"
  ];
  bashrcExtra = ''
    shopt -s autocd
      '';
  initExtra = ''
    set -o vi
    export EDITOR=vim
    '';
  }
