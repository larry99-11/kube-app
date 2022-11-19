#bin/bash

DNS_NAME=kubevpro.thedevopsprojects.co.uk
S3_BUCKET=s3://vprofile-kops-state-test-dev
NODE_COUNT=2
NODE_SLAVE_SIZE=t2.micro
NODE_MASTER_SIZE=t2.medium

echo "###########################################"
echo "checking for name space:$DNS_NAME"
echo "############################################"
nslookup -type=ns $DNS_NAME

echo "###########################################"
echo "creating your kubernetes cluster via kops"
echo "############################################"

kops create cluster --name=$DNS_NAME \
--state=$S3_BUCKET \
--zones=us-east-1a,us-east-1b \
--node-count=$NODE_COUNT \
--node-size=$NODE_SLAVE_SIZE \
--master-size=$NODE_MASTER_SIZE \
--dns-zone=$DNS_NAME

echo "###########################################"
echo "launching your kubernetes cluster via kops"
echo "############################################"

kops update cluster --name $DNS_NAME \
--state=$S3_BUCKET --yes --admin

kops export kubecfg $DNS_NAME --admin

echo "###########################################"
echo "validating your kubernetes cluster via kops"
echo "############################################"

kops validate cluster --wait 10m --name $DNS_NAME \
--state=$S3_BUCKET