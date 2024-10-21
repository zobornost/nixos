final: prev: {

  mcman = prev.rustPlatform.buildRustPackage rec {
    pname = "mcman";
    version = "0.4.5";

    src = prev.fetchFromGitHub {
      owner = "ParadigmMC";
      repo = pname;
      rev = version;
      sha256 = "/WIm2MFj2++QVCATDkYz2h4Jm+0RzxzVFIYrZubEgIQ=";
    };

    cargoLock = {
      lockFile = prev.fetchurl {
        url = "https://raw.githubusercontent.com/ParadigmMC/mcman/${version}/Cargo.lock";
        sha256 = "1wFoD0XQnT/ANq1yxcAGBm7y3s6tGk5EJAM18C6B7Fk=";
      };
      outputHashes = {
        "mcapi-0.2.0" = "wHXA+4DQVQpfSCfJLFuc9kUSwyqo6T4o0PypYdhpp5s=";
        "pathdiff-0.2.1" = "+X1afTOLIVk1AOopQwnjdobKw6P8BXEXkdZOieHW5Os=";
        "rpackwiz-0.1.0" = "pOotNPIZS/BXiJWZVECXzP1lkb/o9J1tu6G2OqyEnI8=";
      };
    };

    meta = {
      description = "A fast line-oriented regex search tool, similar to ag and ack";
      homepage = "https://github.com/BurntSushi/ripgrep";
      license = prev.lib.licenses.unlicense;
      maintainers = [ ];
    };
  };
}
