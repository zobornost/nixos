final: prev: {
  ashell = prev.rustPlatform.buildRustPackage rec {
    pname = "ashell";
    version = "0.2.0";
    src = prev.fetchFromGitHub {
      owner = "MalpenZibo";
      repo = "ashell";
      rev = "refs/heads/main";
      sha256 = "sha256-oNN4oY9+eM1nRyZfB9LSV/dXYeED324BOEjBYPcGIfM=";
    };
    nativeBuildInputs = [
      prev.pkg-config
    ];
    cargoLock = {
      lockFile = src + "/Cargo.lock";
      outputHashes = {
        "dnd-0.1.0" = "sha256-temNg+RdvquSLAdkwU5b6dtu9vZkXjnDASS/eJo2rz8=";
        "hyprland-0.4.0-beta.1-revision" = "sha256-of/nIfOy+a2ngsZlVXR/mEHopSbxGZN/6cOaushN5cA=";
        "iced_sctk-0.1.0" = "sha256-PnAnmM7PUWyp2p5KjpSIfY8874bucC11Y060jDImbjo=";
        "smithay-client-toolkit-0.18.0" = "sha256-/7twYMt5/LpzxLXAQKTGNnWcfspUkkZsN5hJu7KaANc=";
        "smithay-clipboard-0.8.0" = "sha256-MqzynFCZvzVg9/Ry/zrbH5R6//erlZV+nmQ2St63Wnc=";
      };
    };
  };
}
