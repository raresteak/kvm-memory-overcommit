# kvm-memory-overcommit
This bash script quickly allows IT admins to check their memory overcommitment ratio when running on kvm/qemu.   

Most operating systems don't use 100% of their allocated ram all the time so it's optimal to overcommit your KVM's host memory.  

Warning: TEST TEST TEST.  Overcommitment ratios of production kvm's should be lower to allow for changes in workloads throughout the day.  Strike a balance when allocating vm's to hosts, put a mix of heavy usage (e.g. DB servers) vm's with lower usage vm's (e.g. ntp server).   Putting all heavy memory demanding vm's on hosts will crush your kvm host and invoke linux's out of memory killer.  Have sufficent swap space and lots of physical memory in your kvm hosts in production.
