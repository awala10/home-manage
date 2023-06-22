pkgs: {
  enable = true;
  clock24 = true;
  plugins = with pkgs.tmuxPlugins; [
  ];
  extraConfig = ''
    set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
    run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
  '';
}
