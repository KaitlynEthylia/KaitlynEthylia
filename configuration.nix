{ pkgs, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    use-xdg-base-directories = true;
  };

  imports = [
    ./modules/hardware-configuration.nix
    ./modules/audio.nix
    ./modules/kmonad
    ./modules/sddm.nix
    ./modules/battery.nix
    ./modules/ssh.nix
  ];

  networking.hostName = "nix";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "uk";

  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
    groups = [ "wheel" ];
    persist = true;
    keepEnv = true;
  }];

  environment.systemPackages = with pkgs; [
    nixVersions.nix_2_19
    (writeScriptBin "sudo" ''exec doas "$@"'')
    git
  ];
  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;

  users.users.kaitlyn = {
    isNormalUser = true;
    description = "kaitlyn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
    shell = pkgs.zsh;
  };

  services.udisks2.enable = true;

  system.stateVersion = "23.05";
}