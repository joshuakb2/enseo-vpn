{
  description = "A script for connecting to Enseo's AnyConnect VPN";

  inputs = {
    openconnect-sso.url = "github:ThinkChaos/openconnect-sso/fix/nix-flake";
  };

  outputs =
    { self, openconnect-sso }:
    {
      packages.x86_64-linux = {
        enseo-vpn = openconnect-sso.inputs.nixpkgs.legacyPackages.x86_64-linux.callPackage ./default.nix {
          openconnect-sso = openconnect-sso.packages.x86_64-linux.default;
        };
        default = self.packages.x86_64-linux.enseo-vpn;
      };
    };
}
