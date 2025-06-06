{ config, lib, pkgs, ... }:

let
  cfg = config.local.dock;
  inherit (pkgs) stdenv dockutil;
  inherit (lib) types;

  # User is defined in the parent config
  user = "helder";

in
{
  options = {
    local.dock.enable = lib.mkOption {
      description = "Enable dock";
      type = types.bool;
      default = stdenv.isDarwin;
      example = false;
    };

    local.dock.entries = lib.mkOption {
      description = "Entries on the Dock";
      type = with types; listOf (submodule {
        options = {
          path = lib.mkOption { 
            type = str;
            description = "Path to the application or file";
          };
          section = lib.mkOption {
            type = str;
            default = "apps";
            description = "Dock section (apps, others, etc.)";
          };
          options = lib.mkOption {
            type = str;
            default = "";
            description = "Additional dockutil options";
          };
        };
      });
      default = [];
    };
  };

  config = lib.mkIf cfg.enable {
    # Ensure dockutil is in system packages
    environment.systemPackages = [ dockutil ];
    
    # Use postActivation to ensure this runs after everything else
    system.activationScripts.postActivation.text = ''
      echo >&2 "Configuring Dock..."
      
      # Only proceed if logged in to GUI
      if /usr/bin/pgrep -x "Dock" > /dev/null; then
        echo >&2 "Dock is running, configuring for user ${user}..."
        
        # Run as the target user
        /usr/bin/sudo -u ${user} /bin/bash << 'EOSCRIPT'
        set -e
        
        # Set up PATH
        export PATH="${dockutil}/bin:/usr/bin:/bin"
        
        echo >&2 "Current dock items:"
        ${dockutil}/bin/dockutil --list || true
        
        # Remove all existing items
        echo >&2 "Removing all dock items..."
        ${dockutil}/bin/dockutil --no-restart --remove all || true
        
        # Add our items
        ${lib.concatMapStrings (entry: ''
          echo >&2 "Adding ${entry.path}..."
          if [ -e "${entry.path}" ]; then
            ${dockutil}/bin/dockutil --no-restart --add "${entry.path}" --section ${entry.section} ${entry.options} || echo >&2 "Failed to add ${entry.path}"
          else
            echo >&2 "Warning: ${entry.path} does not exist!"
          fi
        '') cfg.entries}
        
        # Restart the Dock
        echo >&2 "Restarting Dock..."
        /usr/bin/killall Dock || true
        
        echo >&2 "Dock configuration complete!"
        
        # Show final state
        sleep 2
        echo >&2 "Final dock items:"
        ${dockutil}/bin/dockutil --list || true
        
EOSCRIPT
      else
        echo >&2 "Dock not running, skipping configuration"
      fi
    '';
  };
}
