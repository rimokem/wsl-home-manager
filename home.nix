{ config, pkgs, ... }:

{
  # Basic configuration
  home.username = "imo";
  home.homeDirectory = "/home/imo";
  home.stateVersion = "25.05";

  # Package management
  home.packages = with pkgs; [
    # Development tools
    bun
    deno
    uv
    gh
    neovim
    just

    # Terminal utilities
    zellij
    ripgrep
    fd
    bat
    eza
    tlrc
    yt-dlp

    # File handling
    zip
    unzip

    # Document processing
    typst

    # Fonts
    noto-fonts-cjk-sans
  ];

  # Dotfile management
  home.file = {
    # Example configurations (commented out)
    # ".screenrc".source = dotfiles/screenrc;
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # System configuration
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  # Nix configuration
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than-7d";
  };

  # Program configuration
  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "imo";
      userEmail = "115140645+rimokem@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        push.default = "simple";
        pull.rebase = true;
      };
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    starship = {
      enable = true;
    };

    claude-code = {
      enable = true;
    };

    nix-search-tv = {
      enable = true;
    };
  };
}
