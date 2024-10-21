final: prev:
{
  libportal = prev.callPackage
    ({ variant ? null }: prev.stdenv.mkDerivation rec {
      pname = "libportal" + prev.lib.optionalString (variant != null) "-${variant}";
      version = "0.8.1";

      outputs = [ "out" "dev" ]
        ++ prev.lib.optional (variant != "qt5") "devdoc";

      src = prev.fetchFromGitHub {
        owner = "flatpak";
        repo = "libportal";
        rev = version;
        sha256 = "sha256-NAkD5pAQpmAtVxsFZt74PwURv+RbGBfqENIwyxEEUSc=";
      };

      depsBuildBuild = [
        prev.pkg-config
      ];

      nativeBuildInputs = [
        prev.meson
        prev.ninja
        prev.pkg-config
        prev.gi-docgen
      ] ++ prev.lib.optionals (variant != "qt5") [
        prev.gobject-introspection
        prev.vala
      ];

      propagatedBuildInputs = [
        prev.glib
      ] ++ prev.lib.optionals (variant == "gtk3") [
        prev.gtk3
      ] ++ prev.lib.optionals (variant == "gtk4") [
        prev.gtk4
      ] ++ prev.lib.optionals (variant == "qt5") [
        prev.libsForQt5.qtbase
        prev.libsForQt5.qtx11extras
      ] ++ prev.lib.optionals (variant == "qt6") [
        prev.qt6Packages.qtbase
      ];

      mesonFlags = [
        (prev.lib.mesonEnable "backend-gtk3" (variant == "gtk3"))
        (prev.lib.mesonEnable "backend-gtk4" (variant == "gtk4"))
        (prev.lib.mesonEnable "backend-qt5" (variant == "qt5"))
        (prev.lib.mesonEnable "backend-qt6" (variant == "qt6"))
        (prev.lib.mesonBool "vapi" (variant != "qt5"))
        (prev.lib.mesonBool "introspection" (variant != "qt5"))
        (prev.lib.mesonBool "docs" (variant != "qt5")) # requires introspection=true
      ];

      postFixup = ''
        # Cannot be in postInstall, otherwise _multioutDocs hook in preFixup will move right back.
        moveToOutput "share/doc" "$devdoc"
      '';

      # we don't have any binaries
      dontWrapQtApps = true;

      meta = with prev.lib; {
        description = "Flatpak portal library";
        homepage = "https://github.com/flatpak/libportal";
        license = licenses.lgpl3Plus;
        maintainers = with maintainers; [ jtojnar ];
        platforms = platforms.unix;
      };
    })
    { };
}
