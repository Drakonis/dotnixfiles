{
  allowUnfree = true; 
  packageOverrides = pkgs: {
    unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable-small/nixexprs.tar.xz) {
        config = {
           allowUnfree = true;
    };
  };
   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
     inherit pkgs;
   };

};

}
