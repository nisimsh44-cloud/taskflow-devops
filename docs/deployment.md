# Kubernetes Deployment

## Overview

TaskFlow is deployed on Kubernetes using a production-style deployment model.

The deployment includes:

- Namespace isolation
- Kubernetes Deployment
- Multiple replicas
- Service-based traffic routing
- Health monitoring
- Resource management

## Kubernetes Resources

Namespace : taskflow

Deployment: taskflow-app

Replicas  : 2

Service   : taskflow-service

## Traffic Flow
User
 |
 v
AWS EC2 Instance
 |
 v
NodePort Service :31338
 |
 v
Kubernetes Service
 |
 v
TaskFlow Pods (2 replicas)
 |
 v
Container Port 5000
 |
 v
Flask Application


The Service routes traffic to Pods using the label selector: app=taskflow-app

## Health Monitoring

Kubernetes monitors application availability using HTTP health probes:

### Readiness Probe

Endpoint: /health

Purpose:

- Determines when a Pod is ready to receive traffic.

### Liveness Probe

Endpoint: /health

Purpose:

- Detects unhealthy containers and allows Kubernetes to restart them automatically.

## Deployment Strategy

The application uses RollingUpdate deployment strategy:
maxUnavailable: 0
maxSurge: 1

This allows updates with minimal downtime by creating new Pods before removing old ones.

## Resource Management

Each Pod defines:

Requests:
CPU: 100m
Memory: 128Mi

Limits:
CPU: 250m
Memory: 256Mi

This ensures predictable resource usage inside the Kubernetes cluster.




