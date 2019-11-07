#!/bin/bash
# Calculate KVM memory overcommitment ratio
# Script ideas, email output throughout the day
# or use this as part of a larger script to alert when overcommitment rater exceeds a threshold.
# Enjoy
totalmem=$(virsh -c qemu:///system nodememstats | grep total | awk {'print $3'})
virsh -c qemu:///system domstats --list-active --balloon | grep balloon.current | awk -F= {'print $2'} > /tmp/.active_alloc_mem
total=0
for indvVM in $(cat /tmp/.active_alloc_mem); do
  total=$((total+indvVM))
done
overcommitratio=$(echo "scale=2;${total}/${totalmem}" | bc -l)
echo "Total host memory: $totalmem"
echo "Total allocated to active vm: $total"
echo "Overcommitment ratio $overcommitratio"