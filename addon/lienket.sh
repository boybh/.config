sudo rm /sys/fs/cgroup/cpuacct
sudo rm /sys/fs/cgroup/cpu
sudo rm /sys/fs/cgroup/net_cls
sudo rm /sys/fs/cgroup/net_prio
sudo ln -s /sys/fs/cgroup/cpu,cpuacct /sys/fs/cgroup/cpuacct
sudo ln -s /sys/fs/cgroup/cpu,cpuacct /sys/fs/cgroup/cpu
sudo ln -s /sys/fs/cgroup/net_cls,net_prio /sys/fs/cgroup/net_cls
sudo ln -s /sys/fs/cgroup/net_cls,net_prio /sys/fs/cgroup/net_prio
sudo systemctl daemon-reload
sudo systemctl restart systemd-logind
