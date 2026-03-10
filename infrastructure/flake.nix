{
  description = "Homelab IaC Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # Gói gọn Python và các thư viện cần thiết
      pythonEnv = pkgs.python3.withPackages (ps: [
        ps.pyyaml
        ps.kubernetes
        ps.passlib
        ps.psycopg2
      ]);
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.ansible
          pkgs.kubernetes-helm
          pkgs.kubectl
          pythonEnv
        ];
        
        shellHook = ''
          export ANSIBLE_PYTHON_INTERPRETER="${pythonEnv}/bin/python3"
          echo "Homelab IaC environment is ready!"
        '';
      };
    };
}
