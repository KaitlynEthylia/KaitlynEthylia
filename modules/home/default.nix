{ config, ... }:

{
  imports = [
    ./shell
    ./wayland
    ./lang
    ./prog
    ./scripts
    ./files.nix
  ];

  nix.enable = true;
  nix.settings.use-xdg-base-directories = true;

  nixpkgs.config.allowUnfree = true;

  home.username = "kaitlyn";
  home.homeDirectory = "/home/kaitlyn";

  xdg = {
    enable = true;
    dataHome = /. + "${config.home.homeDirectory}/.local/share";
    stateHome = /. + "${config.home.homeDirectory}/.local/state";
    cacheHome = /. + "${config.home.homeDirectory}/.local/cache";
    configHome = /. + "${config.home.homeDirectory}/.config";
    mimeApps.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Kaitlyn~Ethylia";
    userEmail = "kaitlyyn.ethylia@proton.me";
    extraConfig = {
      init.defaultBranch = "mistress";
      core = {
        autocrlf = false;
        eol = "lf";
      };
    };
  };
  home.file.".local/share/ssh/known_hosts.d/github.com".text = ''
    github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
  '';

  home.sessionVariables = {
    VISUAL = "nvim";
    EDITOR = "nvim";
    PAGER = "bat";
    MANPAGER = "bat -l man";
    OPENER = "xdg-open";

    LOCAL = "$HOME/.local";

    TEMPEDIT_LIST = "$LOCAL/tempedit";
  };

  home.sessionPath = [
    "$XDG_STATE_HOME/nix/profile/bin"
    "$XDG_BIN_HOME"
    "${config.home.homeDirectory}/Scripts"
  ];

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}