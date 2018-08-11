# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let nixos = import (fetchTarball https://nixos.org/channels/nixos-unstable-small/nixexprs.tar.xz) {
          config = {
              allowUnfree = true;
          };
      };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  #nix.nixPath = [ "nixos=http://nixos.org/channels/nixos-unstable-small/nixexprs.tar.xz"];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
       efiSupport = true;
       device = "nodev";
       useOSProber=true;
    };
  };
#  system.autoUpgrade.enable = true;
#  system.autoUpgrade.channel = https://nixos.org/channels/nixos-unstable-small;
  networking.hostName = "nix"; # Define your hostname.
  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    opengl.driSupport32Bit = true;
  };
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "br-abnt2";
     defaultLocale = "en_US.UTF-8";
   };
  nixpkgs.config = {
   packageOverrides = pkgs: {
     nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
       inherit pkgs;
     };
   };

   allowUnfree = true;
   #allowBroken = true;
  };
  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";
  time.hardwareClockInLocalTime = true; 
  security.sudo.wheelNeedsPassword = false;
 # virtualisation.docker.enable = true;
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
#services.dbus.packages = [ pkgs.gnome3.gconf ];   
services={

flatpak.enable=true;
printing={
  enable = true;
  drivers = [ pkgs.hplip ];
};
xserver={	
  # Enable the X11 windowing system.
   enable = true;
   layout = "br";
#  xkbVariant = "nodeadkeys";
#  xkbOptions = "terminate:ctrl_alt_bksp";

  # Enable the KDE Desktop Environment.
   displayManager={
        sddm={
        theme = "breeze";
        enable = true;
            };
        # lightdm={
        # enable=true;
        #  };
            };
   desktopManager={
      plasma5.enable = true;
      #xfce.enable=true;
     };
 # services.gnome3.gnome-keyring.enable = true;
 # services.xserver.displayManager.lightdm.enable = true;
 # xserver.gnome3.gvfs.enable = true;
 # xserver.desktopManager.xfce.enable = true;
 # xserver.windowManager.openbox.enable = true;
   videoDrivers = [ "nvidia" ];
};
};
   programs.adb.enable = true;

   users.extraUsers.drakonis = {
     isNormalUser = true;
     uid = 1000;
     createHome = true;
     extraGroups  = [ "wheel" "adbusers" ];
   };
  #system.autoUpgrade.enable = true;
  #system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";
  system.stateVersion = "18.09";

}

