{ config, pkgs, ... }:
{
    programs.fish.enable = true;
    programs.fish.plugins = [
      { name = pkgs.fishPlugins.tide.name; src = pkgs.fishPlugins.tide.src; }
      { name = pkgs.fishPlugins.fzf-fish.name; src = pkgs.fishPlugins.fzf-fish.src; }
    ];
    programs.fish.shellAbbrs = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      df = "df -hl";
      dirsize = "du -cxh -d 1 | sort -h";
      got = "git";
      hms = "home-manager switch --flake $XDG_CONFIG_HOME/home-manager";
      j = "just --justfile ~/Justfile";
      ls = "ls -h";
      mkdir = "mkdir -p";
      nuke-docker = "docker system prune -a --volumes";
      update = "update-nix-stuff";
      vi = "nvim";
      vim = "nvim";
    };
    programs.fish.shellInit = (builtins.readFile fish/shellInit.fish);
}