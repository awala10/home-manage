# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  boot.kernelPackages =  pkgs.linuxPackages_latest;
  boot.loader.grub.configurationLimit = 10;
  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  networking.hostName = "nixos-pi"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.networks.TMNL-494231.pskRaw = "e54ebaded77f1644eace74ca85ec8ef0202816fe6dc37164897290a985f253c0";
  systemd.services.nix-gc.unitConfig.ConditionACPower = true;
  # services.unclutter.package = true;
  environment.variables = { EDITOR = "vim"; };
  programs.vim.defaultEditor = true;
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;

  };
  nix  = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
    };
#    extraOptions = "experimental-features = nix-command flakes";
#      [
#      " nix-command "
#      " flakes "
#      ];

   };
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.awala = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    #shell = pkgs.zsh;
      packages = with pkgs; [
    ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
    extraConfig = ''
       Match Address 192.168.178.0/24
       PasswordAuthentication yes
       AllowUsers awala kawala
      '';
  };
#    fileSystems."/export/sen" = {
#      device = "/mnt/sen";
#      options = [ "bind" ];
#    };
  services.nfs.server = {
    enable = true;
    exports =
      ''
      #/export 192.168.178.0/24 (rw,fsid=0,no_subtree_check)
      /export 192.168.178.0/24 (rw,sync,no_root_squash,no_subtree_check)  #(rw,no_subtree_check)
      #/export/sen 192.168.178.0/24 #(rw,sync,no_root_squash,no_subtree_check) #(rw,nohide,no_subtree_check)
      #/export/sen 192.168.178.0/24 (rw,nohide,insecure,no_subtree_check)
     '';
  };
  # Open ports in the firewall.
  #  networking.firewall.allowedTCPPorts = [ 2049 ];
  #  networking.firewall.allowPing = false;
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

