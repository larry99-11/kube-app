#bin/bash

ZONE=us-east-1a
SIZE=3
VOL_TYPE=gp2

echo "###########################################"
echo "creating EBS volume"
echo "############################################"

aws ec2 create-volume --availability-zone=$ZONE \
--size=$SIZE \
--volume-type=$VOL_TYPE 