self: super: with super; {

  pythonPackages = {
    packaging = super.python3Packages.callPackage (builtins.fetchGit {
      url = "https://github.com/pypa/packaging.git";
      rev = "refs/tags/21.3";  # Specify the version you want
    }) {};
  };
}
