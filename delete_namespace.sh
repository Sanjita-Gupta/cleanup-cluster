#!/bin/bash
#
echo $1
# NS is namespace
export NS=$1

oc delete --ignore-not-found=true --now=true  job,cluster,deployments,daemonset,replicaset,pod,statefulset,pod,configmap,secret,ingress,service,serviceaccount,role,rolebinding,persistentvolumeclaim,poddisruptionbudget,horizontalpodautoscaler,networkpolicies,cronjobs --all -n $NS;
oc delete --ignore-not-found=true --now=true  certificate,ClusterServiceVersion,CommonService,event,InstallPlan,Issuer,Lease,OperandRequest,operatorgroup,Subscription,WatsonAssistantDvt,ZenService,nss --all -n $NS;

# Delete namespace when finalizer is an issue
oc get ns $NS -o json > $NS.json;vi $NS.json;
oc replace --raw /api/v1/namespaces/$NS/finalize -f ./$NS.json;
oc delete project $NS;

echo "Namespace $1 deleted"
