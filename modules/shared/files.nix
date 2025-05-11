{ pkgs, config, ... }:

let
 githubPublicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb7QqCypqXzLbzFkNME+xQjm2C2Z3rt+ArXazetH+NGjwOkTr1SKgSTKHcbIcxzW0Fv30hkQEoCddVT9f4ROkMTnjUw954Bpw8thtEKoXBujZ7sYRdQmitfML5h/ixu3F0EMgaVvtJEqk8qCzK/M7tcSmxXgSlK5/O5lQWgXn3a0kJqPV5zwZpIX8s9kC5vk1YmAR8x1yXKye8H0aTNy0QQkwCZst+TbUEyfXo68gE8v3xhfPKltZs/ysFkxr+KYy4I89kEO+e8LFtKCVyj1g68KEVI4sdR6V0kY2aOvUbUjMJ/L1c+yOlMZDvxbPtFhSxsBo03IUwG9H+voKhX4q1wFywXBMIUM+v/nzfDZPZLDCCehaPL5s13Ixjb4khsfxzQp+zdhM4Ee+oPtC8+MsOpwm8EU/2Y7yd6bfUoA1cMN9Nl/fpzcb0YO8UBI+tqkiiHPp/3Im9GujSgrTAcHCKAeQd62Ij+tuH6WGK/4r9coT3Rl0L35THT1+gnQYprQc= heldergoncalves@192.168.1.49";
in
{

  ".ssh/github.pub" = {
    text = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb7QqCypqXzLbzFkNME+xQjm2C2Z3rt+ArXazetH+NGjwOkTr1SKgSTKHcbIcxzW0Fv30hkQEoCddVT9f4ROkMTnjUw954Bpw8thtEKoXBujZ7sYRdQmitfML5h/ixu3F0EMgaVvtJEqk8qCzK/M7tcSmxXgSlK5/O5lQWgXn3a0kJqPV5zwZpIX8s9kC5vk1YmAR8x1yXKye8H0aTNy0QQkwCZst+TbUEyfXo68gE8v3xhfPKltZs/ysFkxr+KYy4I89kEO+e8LFtKCVyj1g68KEVI4sdR6V0kY2aOvUbUjMJ/L1c+yOlMZDvxbPtFhSxsBo03IUwG9H+voKhX4q1wFywXBMIUM+v/nzfDZPZLDCCehaPL5s13Ixjb4khsfxzQp+zdhM4Ee+oPtC8+MsOpwm8EU/2Y7yd6bfUoA1cMN9Nl/fpzcb0YO8UBI+tqkiiHPp/3Im9GujSgrTAcHCKAeQd62Ij+tuH6WGK/4r9coT3Rl0L35THT1+gnQYprQc= heldergoncalves@192.168.1.49";
  };

  # Initializes Emacs with org-mode so we can tangle the main config
  ".emacs.d/init.el" = {
    text = builtins.readFile ../shared/config/emacs/init.el;
  };
}
