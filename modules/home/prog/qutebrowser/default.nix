{ pkgs, config, ... }:

{
  imports = [
    ./xdg.nix
    ./mpv.nix
  ];

  home.file."${config.xdg.configHome}/qutebrowser/catppuccin" = {
    source = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "qutebrowser";
      rev = "78bb72b4c60b421c8ea64dd7c960add6add92f83";
      hash = "sha256-lp7HWYuD4aUyX1nRipldEojZVIvQmsxjYATdyHWph0g=";
    };
  };

  programs.qutebrowser = {
    enable = true;
    package = pkgs.writeShellScriptBin "qutebrowser" ''
      jail ${pkgs.qutebrowser}/bin/qutebrowser $@
    '';
    loadAutoconfig = false;
    extraConfig = ''
      import catppuccin
      catppuccin.setup(c, "mocha")
      c.hints.border = "1px solid #f5c2e7"
      c.colors.hints.bg = "#181825"
      c.colors.hints.fg = "#cdd6f4"
      c.colors.hints.match.fg = "#a6adc8"
    '';
    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
      ddg = "https://duckduckgo.com/?q={}";
      aw = "https://wiki.archlinux.org/?search={}";
      gh = "https://github.com/{}";
      wt = "https://wiktionary.org/wiki/Special:Search?search={}";
      wi = "https://wikipedia.org/wiki/Special:Search?search={}";
      np = "https://search.nixos.org/packages?query={}";
    };
    keyBindings = {
      normal = {
        "cy" = "spawn mpv {url}";
        "<Ctrl-Tab>" = "tab-next";
        "<Ctrl-Shift-Tab>" = "tab-prev";
        "sn" = "config-cycle input.spatial_navigation true false";
      };
    };
    keyMappings = {
      "<Shift-Left>" = "H";
      "<Shift-Down>" = "J";
      "<Shift-Up>" = "K";
      "<Shift-Right>" = "L";
    };
    settings = {
      completion = {
        favorite_paths = [ config.home.homeDirectory ];
        scrollbar.padding = 0;
        scrollbar.width = 0;
        shrink = true;
        use_best_match = true;
      };
      content = {
        cookies = {
          accept = "no-3rdparty";
          store = false;
        };
        default_encoding = "utf-8";
        geolocation = false;
        headers.do_not_track = true;
        javascript.clipboard = "access";
        media = {
          audio_capture = false;
          audio_video_capture = false;
          video_capture = false;
        };
        notifications.presenter = "libnotify";
        persistent_storage = false;
        private_browsing = true;
      };
      downloads = {
        location.directory = config.xdg.userDirs.download;
        location.prompt = false;
        remove_finished = 5000;
      };
      editor.command = [ "wezterm" "nvim" "{file}" "-c" "norm {line}G{column}l" ];
      fileselect = {
        folder.command = [ "wezterm" "lf" "-print-last-dir" ];
        single_file.command = [ "wezterm" "lf" "-print-selection" ];
        multiple_files.command = [ "wezterm" "lf" "-print-selection" ];
      };
      fonts = {
        completion.entry = "bold default_size default_family";
        contextmenu = "default_size default_family";
        default_family = "CaskaydiaCove Nerd Font Mono";
      };
      hints.chars = "crstneiadh";
      scrolling = {
        bar = "never";
        smooth = true;
      };
      tabs = {
        last_close = "close";
        position = "bottom";
        show = "multiple";
      };
    };
  };
}