{ pkgs, ... }:
with import <nixpkgs> {};
with builtins;
with lib;
{
  programs.home-manager = {
  enable = true;
  path = https://github.com/rycee/home-manager/archive/master.tar.gz;
  };
  home.packages = with pkgs; [
     gitkraken
#     erlangR21 
#     beamPackages.elixir_1_7
     
     ark kate okular
     wineWowPackages.staging
     libreoffice-fresh
     bash-completion
     nix-bash-completions
     keepassxc 
     weechat
     hexchat
     firefox     
     steam     
     gzdoom     
     quakespasm
#     rclone
     redshift-plasma-applet
   # system utils
   htop
   wget
   tree
   emacs
   # images
   gimp

   vim neovim tig git git-crypt gnumake cmake autoconf automake gcc
   unzip unrar   gnutls   libxml2   jq   bind
   lua luarocks perl python ruby go tcl
   android-udev-rules
    ];
  programs.git = {
    enable = true;
    userName = "Drakonis";
    userEmail = "khronosforce@gmail.com";
  };
# programs.emacs = {
#    enable = true;
#    extraPackages = epkgs: [
#      epkgs.nix-mode
#      epkgs.magit
#    ];
#  };
#  ".emacs.d" = {
#     source = fetchFromGitHub {
#       owner = "syl20bnr";
#       repo = "spacemacs";
#       rev = "v0.200.13";
#       sha256 = "1x0s5xlwhajgnlnb9mk0mnabhvhsf97xk05x79rdcxwmf041h3fd";
#     };
#     recursive = true;
#};
  programs.firefox = {
    enable = true;
  };
  services.redshift = {
   enable = true;
   provider = "geoclue2";
 };
}
