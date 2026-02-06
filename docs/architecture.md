# OpenEdX on AWS EKS – Architecture Overview

## High-Level Architecture

The platform is deployed on AWS EKS following a layered, production-oriented architecture:

**Security Layer**
- AWS WAF
- AWS CloudFront (CDN)

**Web Layer**
- AWS Application Load Balancer
- Nginx Ingress Controller (HTTP/2 + TLS termination)

**Application Layer (EKS)**
- OpenEdX LMS
- OpenEdX CMS (Studio)
- Background workers
- Kubernetes-native autoscaling (HPA)

**Data Layer (External to Kubernetes)**
- Amazon RDS MySQL (application data)
- MongoDB on EC2 (course and user documents)
- Elasticsearch on EC2 (search and analytics)
- Amazon ElastiCache Redis (cache and message broker)

**Storage Layer**
- Amazon EBS (via CSI driver) for persistent volumes

---

## Design Principles

- All stateful data services are external to Kubernetes
- Stateless application workloads run on EKS
- Clear separation of concerns between layers
- Cost-aware sizing for evaluation purposes
- Security-first networking with controlled ingress and egress

---

## Namespace Isolation

The cluster uses dedicated namespaces:
- `openedx` – application workloads
- `ingress-nginx` – traffic management
- `monitoring` – observability stack

---

## Traffic Flow

1. Client requests hit AWS CloudFront
2. Requests are filtered by AWS WAF
3. Traffic is forwarded to the ALB
4. ALB routes traffic to Nginx Ingress
5. Nginx proxies requests to LMS or CMS services
6. Application pods communicate with external databases over private networking

