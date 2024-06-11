# bootc

RHEL image mode via bootc
[RHEL image mode quick start guide](https://www.redhat.com/en/blog/image-mode-red-hat-enterprise-linux-quick-start-guide)

Steps:
Build an image:

```bash
podman build -f Containerfile -t quay.io/ktordeur/bootc:latest
```

Test the image:

```bash
podman run -d --rm --name lamp -p 8080:80 quay.io/ktordeur/bootc:latest /sbin/init
```

Push to registry:

```bash
podman push quay.io/ktordeur/bootc:latest
```

Create image:

```bash
$ sudo podman run --rm -it --privileged \
-v .:/output \
-v $(pwd)/config.jsoßn:/config.json \
--pull newer \
registry.redhat.io/rhel9/bootc-image-builder:9.4 \
--type qcow2 \
--config /config.json \
quay.io/[my_account]/lamp-bootc:latest
```

Deploy via virt-install for KVM/qemu/libvirt:

```bash
virt-install \
 --name lamp-bootc \
 --memory 4096 \
 --vcpus 2 \
 --disk qcow2/disk.qcow2 \
 --import \
 --os-variant rhel9.4
```

Pushing an update
A key aspect of this story is that the install or deploy is a one-time task. A lot of the value of this model happens on “day 2” when changes can be done via pushing images to the registry. Automatic updates are on by default! This is, of course, simple to configure for maintenance windows or can be disabled completely. To try it out, make a change to your Containerfile and repeat the build & push steps to make the new image available on your registry.  **The default timer for the systemd unit will kick in after an hour of uptime, but you can also `bootc upgrade` earlier than that to grab the update.**