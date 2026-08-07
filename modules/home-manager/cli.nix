{ ... }:

{
  programs.fastfetch.enable = true;
  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
  programs.starship.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--style minimal"
      "--color 16"
      "--layout=reverse"
      "--height 40%"
    ];
    historyWidget.options = [
      "--style minimal"
      "--color 16"
      "--info inline"
      "--no-preview"
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    shellAliases = {
      c = "clear";
      ff = "fastfetch";
      v = "$EDITOR";
      cat = "bat --style=plain";

      l = "eza --icons=always";
      ls = "eza --icons=always";
      la = "eza -al --icons=always";
      ll = "eza -l --icons=always";
      lt = "eza -a --tree --level=2 --icons=always";

      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
      gd = "git diff";

      k = "kubectl";
      kx = "kubectx";
    };

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      MANPAGER = "bat -l man -p";
    };

    initContent = ''
      print -P "\n%F{4}it's %D{%A, %B %d} %F{3}Linux $(uname -r)%f"
    '';
  };
}
