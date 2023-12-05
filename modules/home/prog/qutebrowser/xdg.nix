{ ... }:

{
  xdg.desktopEntries.qutebrowser = {
    name = "QuteBrowser";
    genericName = "Web Browser";
    comment = "A keyboard-driven, vim-like browser based on Python and Qt";
    icon = "qutebrowser";
    type = "Application";
    categories = [
      "Network"
      "WebBrowser"
    ];
    exec = "qutebrowser --untrusted-args %u";
    terminal = false;
    startupNotify = false;
    mimeType = [
      "text/html"
      "text/xml"
      "application/xhtml+xml"
      "application/xml"
      "application/rdf+xml"
      "image/gif"
      "image/jpeg"
      "image/png"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/qute"
    ];
    actions = {
      new-window = {
        name = "New Window";
        exec = "qutebrowser";
      };
      preferences = {
        name = "Preferences";
        exec = ''qutebrowser "qute://settings"'';
      };
    };
    settings.StartupWMClass = "qutebrowser";
  };

  xdg.mimeApps.associations.added = {
    "x-scheme-handler/http" = "qutebrowser.desktop";
    "x-scheme-handler/https" = "qutebrowser.desktop";
    "x-scheme-handler/qute" = "qutebrowser.desktop";
  };
}