{ pkgs, config, ... }:

# let
#  githubPublicKey = "ssh-ed25519 AAAA...";
# in
{

  ".ssh/github.pub" = {
    text = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDySJ+KH6CUOxckJgzI1Ii9ue25OVxml3KrdCl31GU2xTG/vUC2Aq//psyHOmw/nCyhnqw2qUPFqgS32uc34vuWy+U2M7YqObHFyNw+kOtvhiL0uTXMpoxdw0pIulDVVSYJNHE4IVXQWwAjeZMuSyAOpoJL9dkhgWEY6TCS84id/W8FIJgWdVab+mIehgukQ1zRkjN8WgRUZ+Ks5YCi7TTVQvqcXJLlmG6YKcp2VTAuFKbiUdr72CrOF3bFGaECH6PyneB16eHdPgaH64SAqr27G8DfdRUZvRgNzDhMFR8d/y5RwEjJfLTbo0p7RvNETFBZkzlu2Fp8o/czHrV6O3he71NctPjCwYdbd4bYLo8sStF2D2+lqt+XDTxgRWxPgRdEv3S6mdegylMaU5yD5GcPntapu7OVBm5jgJWkoVFMuDCFOvs4qqLPp+zNL+MlV5HVlsR4fJ1sEjUzpURawDQCDV7uvsr1Stcrs1i0JXa2VyQ/rkx/TSiCuKMQWLWl8QU= heldergoncalves@192.168.1.21";
  };

  # Initializes Emacs with org-mode so we can tangle the main config
  ".emacs.d/init.el" = {
    text = builtins.readFile ../shared/config/emacs/init.el;
  };
}
