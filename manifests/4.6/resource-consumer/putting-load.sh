#! /bin/bash

# Get the NodePort of the resource-consumer
RC_PORT=`kubectl get svc resource-consumer -ojsonpath='{.spec.ports[0].nodePort}'` || {
    echo "resource-consumer may not have been deployed.";
    exit 1;
}

# Consume 2000 MB of memory for 3 minutes.
curl http://localhost:${RC_PORT}/ConsumeMem --data "megabytes=2000&durationSec=180"

# Consume 1000 millicores (1 core) of CPU for 5 minutes.
curl http://localhost:${RC_PORT}/ConsumeCPU --data "millicores=1000&durationSec=300"
