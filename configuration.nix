# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "";

  # Select internationalisation properties.
  i18n.defaultLocale = "";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "";
    LC_IDENTIFICATION = "";
    LC_MEASUREMENT = "";
    LC_MONETARY = "";
    LC_NAME = "";
    LC_NUMERIC = "";
    LC_PAPER = "";
    LC_TELEPHONE = "";
    LC_TIME = "";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "";
    variant = "";
  };

  # Configure GUI layout
  # services.xserver = {
  #   enable = true;
  #   displayManager.sddm.Wayland.enable = true;
  #};
  
  security.polkit = {
    enable = true;
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; 
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.test = {
    isNormalUser = true;
    description = "test";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "test";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  btop
  rofi-wayland
  swaybg
  polkit
  nautilus
  sway
  #firefox-beta
  wlroots
  waybar
  xwayland
  ghostty
  #gnome-system-monitor
  vscodium
  #nwg-displays
  ];

  fonts.packages = with pkgs; [
  font-awesome
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
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
