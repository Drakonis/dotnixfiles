# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-unstable;
    networking.hostName = "nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    opengl.driSupport32Bit = true;
  };
  virtualisation.virtualbox.host.enable = true;
  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "br-abnt2";
     defaultLocale = "en_US.UTF-8";
   };
  nixpkgs.config = {
  firefox.enableAdobeFlash = true;
  firefox.enableOfficialBranding = true;
  # firefox.enableGnomeExtensions = true;
   allowUnfree = true;
   #allowBroken = true;
  };
  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";
  time.hardwareClockInLocalTime = true; 
  security.sudo.wheelNeedsPassword = false;
  virtualisation.docker.enable = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
   environment.systemPackages = with pkgs; [
     nox
     virtualbox
     keepassx
     pavucontrol
     weechat
     hexchat
     firefox
     steam
     gzdoom
     quakespasm
   # system utils
   lsof 
   xorg.xev
   acpi
   pciutils
   usbutils   
   powertop
   htop
   wget   
   tree
   ag

   # images
   gimp

   # Chat
   chatzilla

   # Email subsystem
   offlineimap msmtp mu

   # Editors and tools
   emacs vim neovim
   tig git git-crypt
   gnumake cmake autoconf automake gcc
   unzip unrar
   gnutls
   libxml2
   jq
   bind

   # multimedia and torrents
   transmission
   vlc

   # DE functionality - file manager, wallpapers etc.
   scrot rofi pa_applet networkmanagerapplet
   imagemagick
   faba-icon-theme adapta-gtk-theme
   flat-plat
   numix-gtk-theme paper-gtk-theme
   arc-icon-theme elementary-icon-theme
   mate.mate-icon-theme
   moka-icon-theme numix-icon-theme
   numix-icon-theme-circle
   gtk_engines gtk-engine-murrine

   # browsers
   firefox google-chrome

   # Interpreters and environments
   lua luarocks perl python ruby go tcl

   # Disks mount
   udevil
   udisks
   android-udev-rules    
    
    ];  
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = [
       pkgs.anonymousPro
       pkgs.corefonts
       pkgs.freefont_ttf
       pkgs.dejavu_fonts
       pkgs.ttf_bitstream_vera
    ];
  };
services.dbus.packages = [ pkgs.gnome3.gconf ];   

    services.emacs = {
    enable  = true;
    install = true;
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
    services.printing.enable = true;

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.layout = "br";
   services.xserver.xkbVariant = "nodeadkeys";
   services.xserver.xkbOptions = "terminate:ctrl_alt_bksp";

  # Enable the KDE Desktop Environment.
 # services.xserver.displayManager.sddm.theme = "olarun";
 # services.xserver.displayManager.sddm.enable = true;
 # services.xserver.desktopManager.plasma5.enable = true;
 # services.gnome3.gnome-keyring.enable = true;
   services.xserver.displayManager.lightdm.enable = true;
 # services.gnome3.gvfs.enable = true;
   services.xserver.desktopManager.xfce.enable = true;
 # services.xserver.windowManager.openbox.enable = true;
   services.xserver.videoDrivers = [ "nvidia" ];


  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.extraUsers.drakonis = {
     isNormalUser = true;
     uid = 1000;
     createHome = true;
     extraGroups  = [ "wheel" "networkmanager" "docker" ];
   };
  # system.autoUpgrade.enable = true;
  # system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";
  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
