# eks-sre-observability

A production-style platform for running the Online Boutique microservices application on Amazon EKS, with infrastructure as code, a DevSecOps delivery pipeline, GitOps deployment, and full-stack observability.

## Application

[Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo) is an e-commerce system of 11 microservices communicating over gRPC, written in Go, Java, C#, Node.js, and Python. Source lives in `src/`, protobuf definitions in `protos/`.

## Target architecture

| Area | Approach |
|---|---|
| Infrastructure | Terraform with layered state (bootstrap, persistent, ephemeral), S3 remote backend |
| Compute | Amazon EKS, access entries, EKS Pod Identity |
| CI/CD | GitHub Actions with OIDC (no long-lived credentials), protected `main`, PR-based changes |
| Security | Gitleaks, Trivy, SonarQube, optional OWASP ZAP |
| Delivery | Helm packaging, Argo CD GitOps, immutable image tags |
| Observability | Prometheus, Grafana, Alertmanager, centralized logging, OpenTelemetry tracing |
| Reliability | SLIs/SLOs, actionable alerting, runbooks, failure testing |

## Repository layout

| Path | Purpose |
|---|---|
| `src/` | Microservices source |
| `protos/` | gRPC definitions |
| `kubernetes-manifests/` | Reference manifests |

Additional directories (`terraform/`, `helm/`, `gitops/`, `.github/workflows/`) are added as each component is delivered.

## Status

| Component | Status |
|---|---|
| Application baseline | Complete |
| Repository workflow and branch protection | Planned |
| Terraform foundation and remote state | Planned |
| GitHub OIDC and secret scanning | Planned |
| VPC and EKS cluster | Planned |
| Application deployment | Planned |
| Helm and GitOps | Planned |
| Observability stack | Planned |

## Optional extensions

- AWS-native backing services for the cart service (for example, ElastiCache for Redis)
- Shopping assistant service (requires an external LLM backend; excluded from the core deployment)