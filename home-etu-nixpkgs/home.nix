{ pkgs, ... }:

{
  # Emacs config
  home.file.".emacs".source = ./dotfiles/emacs/emacs.el;
  home.file.".config/emacs/config.org".source = ./dotfiles/emacs/config.org;

  # Fish config
  home.file.".config/fish/config.fish".source = ./dotfiles/fish/config.fish;
  home.file.".config/fish/functions/ltime.fish".source = ./dotfiles/fish/functions/ltime.fish;
  home.file.".config/fish/functions/isfind.fish".source = ./dotfiles/fish/functions/isfind.fish;
  home.file.".config/fish/functions/weather.fish".source = ./dotfiles/fish/functions/weather.fish;
  home.file.".config/fish/functions/256colors.fish".source = ./dotfiles/fish/functions/256colors.fish;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./dotfiles/fish/functions/fish_prompt.fish;
  home.file.".config/fish/functions/fish_right_prompt.fish".source = ./dotfiles/fish/functions/fish_right_prompt.fish;

  home.packages = [
    pkgs.bc          # Dependency for some fish functions
    pkgs.mpv
    pkgs.tmux
    pkgs.ncdu
    pkgs.pass
    pkgs.stow
    pkgs.sshfs-fuse
    pkgs.youtube-dl
    pkgs.kdeconnect
  ];

  programs.firefox = {
    enable = true;
    enableAdobeFlash = false;
  };

  programs.browserpass.enable = true;

  programs.git = {
    enable = true;
    userName = "Elis Axelsson";
    userEmail = "elis.axelsson@gmail.com";
    signing.key = "67FE98F28C44CF221828E12FD57EFA625C9A925F";
    extraConfig = ''
    [push]
    default = simple

    [color]
    diff = auto
    status = auto
    branch = auto

    [core]
    excludesfile = ~/.gitignore_global
    '';
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs._0blayout
      epkgs.anzu
      epkgs.column-enforce-mode
      epkgs.company
      epkgs.company-flx
      epkgs.company-go
      epkgs.company-php
      epkgs.company-restclient
      epkgs.company-statistics
      epkgs.diff-hl
      epkgs.eyebrowse
      epkgs.fish-mode
      epkgs.flycheck
      epkgs.geben
      epkgs.gnuplot
      epkgs.go-mode
      epkgs.guide-key
      epkgs.helm
      epkgs.helm-fuzzier
      epkgs.helm-projectile
      epkgs.htmlize
      epkgs.magit
      epkgs.markdown-mode
      epkgs.nix-mode
      epkgs.nyan-mode
      epkgs.php-mode
      epkgs.restclient
      epkgs.scss-mode
      epkgs.smooth-scrolling
      epkgs.web-mode
      epkgs.webpaste
      epkgs.yaml-mode
      epkgs.yasnippet
      epkgs.zerodark-theme
      pkgs.emacs-all-the-icons-fonts
    ];
  };

  manual.manpages.enable = false;
}
