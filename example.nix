{ nixpkgs  ? import <nixpkgs> { config.allowBroken = true; }
}:
with nixpkgs;
let
  reflexPlatformSrc = fetchGit {
    url = https://github.com/reflex-frp/reflex-platform;
    rev = "d25152d30a76001d8a22ae96ee55f500180dd063";
  };

  reflex-platform = import reflexPlatformSrc {};
in
reflex-platform.project({ pkgs, ... }: {
  packages = {
    reflex-codemirror = ../reflex-codemirror;
  };

  shells = {
    ghcjs = [ "reflex-codemirror"
            ];
  };
})
