{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Python with necessary packages
    (python3.withPackages (ps: with ps; [
      pip
      virtualenv
      setuptools
      wheel
      packaging  # Required dependency that was missing
    ]))
    
    # Other potential dependencies
    git
    openssl
  ];
  
  shellHook = ''
    # Create a virtual environment if it doesn't exist
    if [ ! -d .venv ]; then
      echo "Creating virtual environment..."
      python -m venv .venv
    fi
    
    # Activate the virtual environment
    source .venv/bin/activate
    
    # Install EB CLI in the virtual environment
    if ! command -v eb &> /dev/null; then
      echo "Installing EB CLI..."
      pip install awsebcli
    fi
    
    # Make the virtual environment's bin directory come first in PATH
    export PATH=$PWD/.venv/bin:$PATH
  '';
}
