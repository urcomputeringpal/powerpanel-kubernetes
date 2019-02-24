# powerpanel-kubernetes

A Docker image and Kustomize base for running [PowerPanel for Linux](https://www.cyberpowersystems.com/product/software/powerpanel-for-linux/). Useful if you have a CyberPower UPS attached to a Kubernetes node.

# Features

* Logs the status of the UPS every 30s
* Runs the included shell scripts when the UPS loses power or when the battery is low

## Usage

* Label any node that has a UPS attached to it:

```
kubectl label node <node> ups=cyberpower
```

* Clone this repo or download a release
* `kustomize build . | kubectl apply -f -`

## Roadmap

* Use [Prometheus' pushgateway](https://github.com/prometheus/pushgateway#command-line) to generate metrics about power usage / battery state / etc
