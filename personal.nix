{ config, pkgs, lib, rustPlatform, pkgsUnstable, ... }:
let
  mcfly = pkgs.rustPlatform.buildRustPackage rec {
    pname = "mcfly";
    version = "v0.8.4";

    src = pkgs.fetchFromGitHub {
      owner = "cantino";
      repo = pname;
      rev = version;
      sha256 = "sha256-beoXLTy3XikdZBS0Lh3cugHflNJ51PbqsCE3xtCHpj0=";
    };

    cargoSha256 = "sha256-DywlkQoQoWspqm/5LxJj4XK/HZsgAPYvNpLfy0kqlBc=";
  };
in
{
  home.packages = [
    pkgs.ansible
    pkgs.awscli2
    pkgs.black
    pkgs.coursier
    pkgs.cyberduck
    pkgs.ddosify
    pkgs.ffmpeg
    pkgs.flyctl
    pkgs.go
    pkgs.gnupg
    pkgs.jetbrains.phpstorm
    pkgs.k6
    pkgs.k9s
    pkgs.kind
    mcfly
    pkgs.nixos-rebuild
    pkgs.nmap
    pkgs.nodejs_20
    pkgs.openssh
    pkgs.php82
    pkgs.php82Packages.composer
    pkgs.python3
    pkgs.rubocop
    pkgsUnstable.ruby
    pkgs.sbt
    pkgs.terraform
    pkgs.temurin-bin-17
    pkgs.vscode
    pkgs.yt-dlp
    pkgs.yq-go
    pkgs.yubikey-manager
    pkgs.yubikey-personalization

    (pkgs.writeShellScriptBin "phpstorm-url-handler"
      (builtins.readFile bin/phpstorm-url-handler.sh))

    (pkgs.writeShellScriptBin "pstorm" ''
      "${pkgs.jetbrains.phpstorm}/bin/phpstorm.sh" "$@"
    '')
  ];
  programs.zsh.initExtra = ''
    eval "$(mcfly init zsh)"
    export PROMPT="%(?:$emoji[smiling_face_with_sunglasses]:$emoji[fire])  $PROMPT"
  '';
}
