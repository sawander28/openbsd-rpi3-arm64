#!/bin/sh

# Deploy install.site
cat << EOF >> install.site
echo "Provisioning $(hostname)" >> /var/log/install.log

pkg_add rsync htop vim unbound

rcctl enable sshd
rcctl enable ntpd
rcctl enable dhcpd
rcctl enable unbound
EOF

# Tar rootfs
tar -czphf site78.tgz rootfs install.site
