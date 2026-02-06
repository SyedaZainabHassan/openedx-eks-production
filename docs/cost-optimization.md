# Cost Optimization Strategy

## Objective

The deployment is designed to demonstrate a production-grade architecture while operating under a limited evaluation budget. Resources are intentionally right-sized for functional validation rather than sustained production traffic.

---

## Kubernetes Cluster

- EKS managed control plane
- Worker nodes:
  - Instance type: t3.large
  - Node count: 2 (minimum for scheduling stability)
- Single Availability Zone deployment

**Rationale:**
- t3.large provides sufficient memory for OpenEdX services and migrations
- Multi-node setup avoids pod scheduling deadlocks
- Single AZ reduces cost while maintaining architectural clarity

---

## Databases and External Services

### MySQL
- Amazon RDS MySQL
- Instance type: db.t3.micro
- Automated backups enabled

### MongoDB
- EC2 t3.micro
- Single-node deployment

### Elasticsearch
- EC2 t3.small
- JVM heap limited to 1GB

### Redis
- Amazon ElastiCache t3.micro
- Single-node deployment

**Rationale:**
- All services meet minimum functional requirements
- Production deployments would use multi-node, multi-AZ configurations

---

## Trade-offs and Production Considerations

The following enhancements would be applied in a real production environment:
- Multi-AZ EKS node groups
- Managed OpenSearch instead of EC2-based Elasticsearch
- MongoDB replica sets
- Redis replication and failover
- Autoscaling node groups
- Increased monitoring retention

These optimizations were intentionally deferred to remain within budget constraints.

