{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        qbasic_src = pkgs.fetchurl {
          url = "https://qbasic.net/dl.php?file=qb11_en";
          curlOptsList = [ "-e" "https://qbasic.net/" ];
          hash = "sha256-RWtEpf5SnWZBovBS8R1uiN0m5H4zJtJJAbLCFvFsslU=";
        };
      in {
        packages = rec {
          default = grumbel-qbasic;

          grumbel-qbasic = pkgs.stdenv.mkDerivation rec {
            pname = "grumbel-qbasic";
            version = "1.0";

            src = ./.;

            postPatch = ''
              substituteInPlace run.py \
                --replace '"whiptail"' '"${pkgs.newt}/bin/whiptail"' \
                --replace '"dosbox"' '"${pkgs.dosbox}/bin/dosbox"' \
                --replace '"src/' '"'$out'/share/${pname}/src' \
                --replace '"mount c c:"' "\"mount c $out/share/${pname}/c:\"" \
                --replace 'c:/QBASIC.EXE' "$out/share/${pname}/c:/QBASIC.EXE"
            '';

            buildPhase = ''
              cd c:
              ${pkgs.unzip}/bin/unzip ${qbasic_src}
              cd ..
            '';

            installPhase = ''
              mkdir -p $out/bin
              mkdir -p $out/share/${pname}
              cp -vr src $out/share/${pname}/
              cp -vr c: $out/share/${pname}/
              install run.py $out/bin/grumbel-qbasic
            '';

            buildInputs = with pkgs; [
              dosbox
            ];
          };
        };
      }
    );
}
