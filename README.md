# vmware-player-boshrelease

BOSH Release for vmware-player

## Requirements

* Valid license for VMware Player
* Existing bosh-deployment with CPI and IaaS that supports nested-virtualization ([vSphere](https://github.com/cloudfoundry/bosh-vsphere-cpi-release) or [VMware Workstation/Fusion/Player](https://github.com/micahyoung/bosh-vmrun-cpi-release))
* Compatible stemcell:
  * [vSphere Ubuntu Xenial 97.16](https://bosh.io/d/stemcells/bosh-vsphere-esxi-ubuntu-xenial-go_agent?v=97.16)

## Usage

* `git clone <this repo url>`
* Download [`VMware-Player-14.1.1-7528167.x86_64.bundle`](https://download3.vmware.com/software/player/file/VMware-Player-14.1.1-7528167.x86_64.bundle) to `blobs/`
* Download [`VMware-VIX-1.17.0-6661328.x86_64.bundle`](https://download3.vmware.com/software/player/file/VMware-VIX-1.17.0-6661328.x86_64.bundle) to `blobs/`
* `bosh create-release --version 0.0.1 --force`
* `bosh upload-release -e my-director`
* `bosh upload-stemcell -e my-director https://bosh.io/d/stemcells/bosh-vsphere-esxi-ubuntu-xenial-go_agent?v=97.16`
* `bosh deploy -e my-director -d vmware-player manifests/vmware-player.yml`

See [manifests/vmware-player.yml](manifests/vmware-player.yml) for deployment example.
