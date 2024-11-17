# Nautilus GUI & AV Simulator Setup

This guide provides instructions for setting up a graphical user interface (GUI) environment on Nautilus with an autonomous vehicle (AV) simulator of your choice. Designed for use at [Professor Gilpin's AIEA lab at UCSC](https://aiea-lab.github.io/), it assumes you have already installed Kubernetes and got added to the AIEA Namespace

This project builds on modifications of [this Nautilus GUI setup tutorial](https://github.com/richard-dao/Nautilus-GUI), and [this CARLA setup tutorial](https://github.com/cruz-control/nautilus/blob/main/sample-nautilus-desktop-gui/carla_setup.sh).

**Note:** Nautilus updates frequently, so this may be outdated. Please check when this was last updated and compare with the Nautilus GitLab.

**Last updated: 11/17/2024**

## Quick Setup

Simply open all the files in the main directory and replace all instances of `INITIALS` to your initials. In the (`gui_setup.sh`) file, you can edit the default password `1234` as well.

Next, in your local terminal, run the provided script, `gui_setup.sh`.

If successful, you should see an output that looks like this: `Forwarding from 127.0.0.1:8080 -> 8080`. Then, copy and paste `127.0.0.1:8080` into your web browser. Input "ubuntu" for the username. Input your password.

Once the desktop is running, download the autonomous vehicle (AV) simulator of your choice. For CARLA, run `carla_setup.sh`. For VISTA, run `vista_setup.sh`. You can also research and manually download any other AV simulator of your choice.


## Manual GUI Setup

### 1. Create the Persistent Volume Claims (PVC)

First, edit the cache file (`xgl-cache.yml`) to set your custom cache PVC name (defaulted as `INITIALS-cache`). Then, edit the storage file (`rook-storage.yaml`) to set your custom storage PVC name (defaulted as `INITIALS-storage`).

To create the PVC, run the following commands:

`kubectl create -f xgl-cache.yaml`

`kubectl create -f rook-storage.yaml`

### 2. Create the Secret

To set your secret name, password name, and actual password, run the following command with your desired custom names:

`kubectl create secret generic [secret-name] --from-literal=[password-name]=[actual-password]`

### 3. Create the Pod

Edit the base pod file (`xgl.yaml`). Set a custom pod name (defaulted as `INITIALS-desktop`). Then, match the following to the custom names you selected in step 1 and 2: the PVC names (defaulted as `INITIALS-cache` and `INITIALS-storage`), the secret name (defaulted as `INITIALS-secret`), and the password name (defaulted as `INITIALS-password`).

Finally, create the pod by running the command:

`kubectl create -f xgl.yaml`

### 4. Run the Pod

Run the command:

`kubectl port-forward pod/cls-desktop 8080:8080`

If successful, you should see an output that looks like this: `Forwarding from 127.0.0.1:8080 -> 8080`. Then, copy and paste `127.0.0.1:8080` into your web browser.

The page should prompt you to enter the username ("ubuntu") and the password set in step 2.

If faced with error, check pod status to troubleshoot:

`kubectl get pods`

`kubectl describe pod [pod-name]`