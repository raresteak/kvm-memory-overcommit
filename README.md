# kvm-memory-overcommit
This bash script quickly allows IT admins to check their memory overcommitment ratio when running on kvm/qemu.   

Most operating systems don't use 100% of their allocated ram all the time so it's optimal to overcommit your KVM's host memory.   Anecdotal discussions with other admins, overcommitment ratios of between 10 and 30 have been overserved.  Ratios over 10 you need to look at if you're allocating too much memory to your vm's, don't do that unless you have large swings in memory demand, e.g. database servers can have large swings in memory demand depending on what its doing.  Also don't reduce guest vm memory so much the vm is going to swap.  Guest swapping kill's IO for the entire host effecting all vm's performance.

Warning: TEST TEST TEST.  Overcommitment ratios of production kvm's should be lower to allow for changes in workloads throughout the day.  Strike a balance when allocating vm's to hosts, put a mix of heavy usage (e.g. DB servers) vm's with lower usage vm's (e.g. ntp server).   Putting all heavy memory demanding vm's on hosts will crush your kvm host and invoke linux's out of memory killer.  Have sufficent swap space and lots of physical memory in your kvm hosts in production.

A few words about overcommiting VCPU's.

DO NOT allocate more VCPU to a _single_ vm than you have physical cpu's.  The ideal vm configurations are all single VCPU machines and only increasing VCPU's to vm's if they are riding at or near 100% and expected performance suffers.  The KVM host can handle many vm's with small VCPU configurations over the hosts physical cpu count.  Again strike a balance between busy vm's with less busy vm's.  
