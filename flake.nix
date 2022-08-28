{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";

    qbasic_src.url = "https://www.qbasic.net/dl.php?id=SG1AHdleKmO9U&file=qb11_en";
    qbasic_src.flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, qbasic_src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
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
