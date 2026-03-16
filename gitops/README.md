.
├── bootstrap/               # THE CONTROL PLANE
│   ├── root-app.yml         # The ArgoCD App of Apps
│   └── ... (ArgoCD pipelines for the folders below)
│
├── infrastructure/          # THE FOUNDATION (Layer 1)
│   ├── storage/             # PVCs, StorageClasses
│   ├── networking/          # Traefik, Cloudflared
│   └── security/            # Cert-Manager, Vault Core
│
├── platform/                # THE DEPENDENCIES (Layer 2 - Formerly 'shared_services')
│   ├── databases/           # Postgres, Redis, pgAdmin
│   └── tooling/             # GitLab, CI/CD Runners
│
└── workloads/               # THE APPLICATIONS (Layer 3 - The New Structure!)
    │
    ├── microservices/       # -> High-frequency CI/CD deployments
    │   ├── auth-service/
    │   ├── esl-service/
    │   └── esl-web/
    │
    ├── third-party/         # -> Low-frequency manual updates (External Tools)
    │   ├── seafile/
    │   ├── vaultwarden/
    │   └── speedtest/
    │
    ├── standalone/          # -> Isolated apps (No incoming web traffic, out-of-band)
    │   └── discord-bots/    # (Your Kustomize base/overlays live here!)
    │
    └── workloads-vault/     # -> The Vault Backend/SA definitions for this entire tier
        ├── kustomization.yml
        └── vault-backend.yml
