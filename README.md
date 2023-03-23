# Cleanup Kubernetes resources from Cluster
Clean up all the kubernetes resources from the cluster for given namespace

Even after deleting namespace there are kubernetes components that don't clean up completely. This script cleans up everything in the namespace and later delete the namespace as well.

This script first deletes all resources (including deployments, services, pods, etc.) in the given namespace.

Next, it cleans up any remaining resources (such as persistent volumes, persistent volume claims, config maps, and secrets) that may not have been deleted by the previous command.

Finally, it deletes the namespace itself..

This script ensures that all resources in the namespace are properly cleaned up before deleting the namespace, reducing the risk of resource leaks or other issues in your Kubernetes cluster.
