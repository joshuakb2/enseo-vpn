# enseo-vpn

This nix flake provides an executable called `enseo-vpn` that can be used to start openconnect and connect to the Enseo AnyConnect VPN using modern SSO authentication.

The script will open a browser window that asks you to enter your Enseo domain username and password as well as use your 2FA method. Then the browser window will close and openconnect will keep running as long as you are connected.

The browser will only need to ask you to authenticate if there are no valid cookies from a previous authentication, meaning you may get to skip that step altogether if you connected recently. If you want to log out and log back in as someone else, you'd have to delete the cookies and I'm not yet sure how to do that!

# How to use

## Prerequisites

You need to have openconnect installed on your system first. Specifically, "sudo openconnect" should be a valid command. The openconnect-sso package that this flake uses calls it that way and doesn't include openconnect as a dependency, so unless I fork openconnect-sso and fix that, you need to have your own openconnect installed system-wide.

Also, as this is a flake, you need to have flakes enabled. `experimental-features = nix-command flakes`.

## NixOS

Just run the flake: `nix run github:joshuakb2/enseo-vpn`.

## Other Linux

You need to have the nix package manager installed first: https://nixos.org/download/

Then you can just run the flake, but if that doesn't work, it may be a graphics problem. Sometimes, graphical applications from nix struggle to find the graphics drivers on non-NixOS systems, but there's a workaround:

```
nix shell --impure github:nix-community/nixGL
nix-shell github:joshuakb2/enseo-vpn
nixGL enseo-vpn
```

Those 3 commands will allow you to launch my script with nixGL which fixes the graphics driver situation.
