{ pkgs, ... }:
{
  # Packages for Podman and Lando
  packages = with pkgs; [
    podman          # Container runtime
    podman-compose  # For Docker Compose compatibility
    nodejs_20       # Lando requires Node.js
    curl
    git
  ];

  # Environment variables for Podman and Lando
  env = {
    DOCKER_HOST = "unix:///run/user/$UID/podman/podman.sock";
    LANDO_NO_DOCKER = "false";
  };

  # Ensure Podman socket starts
  scripts.setup-podman.exec = ''
    systemctl --user start podman.socket
    systemctl --user enable podman.socket
  '';
}
