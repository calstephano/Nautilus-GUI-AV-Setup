# Nautilus GUI & AV Simulator Setup

This guide provides instructions for setting up a graphical user interface (GUI) environment on Nautilus with an autonomous vehicle (AV) simulator of your choice. Designed for use at [Professor Gilpin's AIEA lab at UCSC](https://aiea-lab.github.io/), it assumes you have already installed Kubernetes and got added to the AIEA Namespace

This project builds on modifications of [this Nautilus GUI setup tutorial](https://github.com/richard-dao/Nautilus-GUI), and [this CARLA setup tutorial](https://github.com/cruz-control/nautilus/blob/main/sample-nautilus-desktop-gui/carla_setup.sh).

**Note:** Nautilus updates frequently, so this may be outdated. Please check when this was last updated and compare with the Nautilus GitLab.

**Last updated: 11/17/2024**

## Quick Setup
**Note:** The pod automatically closes every 6 hours and you will need to redo steps 2 and 3 every time it closes.

### 1. Replace Placeholder Names
Open all the files and replace all instances of `INITIALS` to your initials. In the (`gui_setup.sh`) file, you can edit the default password `1234` as well.

### 2. Run the GUI Setup Script
Next, in your local terminal, run the provided script, `gui_setup.sh`.

If successful, you should see an output that looks like this: `Forwarding from 127.0.0.1:8080 -> 8080`. Then, copy and paste `127.0.0.1:8080` into your web browser. Input "ubuntu" for the username. Input your password.

### 3. Run the AV Setup Script of Your Choice
Once the desktop is running, you can download the autonomous vehicle (AV) simulator of your choice. For CARLA, run `carla_setup.sh`. For VISTA, run `vista_setup.sh`. You can also research and manually download any other AV simulator of your choice.
