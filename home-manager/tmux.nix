pkgs: {
  enable = true;
  clock24 = true;
  plugins = with pkgs.tmuxPlugins; [
  ];
  extraConfig =  builtins.readFile ./tmux.conf;
}
