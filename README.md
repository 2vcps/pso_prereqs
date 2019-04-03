# How to Install the pre-req packages for PSO on PKS

### Before you begin
Make sure you have:
- bosh cli
- PKS up and working
- using the Xenial Stemcell

### How to create a build with iSCSI, Multipath-tools, and NFS-Tools apt packages

Clone the repo

```
git clone https://github.com/2vcps/pso_prereqs.git
```

```
bosh releases
cd pso_prereqs

bosh create-release
bosh upload-release
```

Now edit the runtimepso.yaml to match your release and add or append this to the runtime-config for Pivotal

```
vi runtimepso.yaml
```

Check your current config
```
bosh runtime-config
```
If this in non-empty you will have to add the contents of the file runtimepso.yaml to whatever current runtime.yaml file you used to edit your runtime config.

If the runtime config returns empty run this command:

```
bosh update-runtime-config runtimepso.yaml
```

Now from your Ops Manager you have to Review the Pending Changes and Apply. This will run through the reprovisioning of the changes. If all goes to plan it will return and finish successfully.

### Install Helm
Use the instructions from the PKS and Tiller page here:

<https://docs.pivotal.io/runtimes/pks/1-3/helm.html>

```
helm init --service-account tiller
```

### Install PSO

<https://github.com/purestorage/helm-charts/tree/master/pure-k8s-plugin>

```
helm install -n pso pure/pure-k8s-plugin -f pure.yaml
```

### Notes

* This requires the PKS VM's be on the network that has IP access to the FlashArray or FlashBlade. I have yet to find a way to add a NIC to the PKS stemcell for an unroutable (ip storage only) network.

* I am claiming this method is at least not "unsupported" by PKS. As other third party software uses this to make needed changes to the stem at runtime.

https://docs.portworx.com/portworx-install-with-kubernetes/on-premise/install-pks/#enable-zero-downtime-upgrades-for-portworx-pks-clusters

https://docs.datadoghq.com/integrations/cloud_foundry/
