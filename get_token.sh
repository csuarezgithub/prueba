#!/bin/sh

identity=$1

if [[ $identity == "cloud_admin" ]]; then
	request='{"auth":{"identity":{"methods":["password"],"password":{"user":{"name":"cloud_admin","password":"FusionSphere123","domain":{"id":"default"}}}},"scope":{"project":{"name":"admin","domain":{"id":"default"}}}}}'
elif [[ $identity == "dc1_admin" ]]; then
	request='{"auth":{"identity":{"methods":["password"],"password":{"user":{"name":"dc1_admin","password":"FusionSphere123","domain":{"id":"default"}}}},"scope":{"project":{"name":"dc_system_dc1","domain":{"id":"default"}}}}}'
fi
					


token=$(curl -i -k https://identity.az1.dc1.clarochile.org:443/identity/v3/auth/tokens -X POST --data-binary "$request" -H "Content-Type: application/json" 2>&1 | grep "X-Subject-Token:" | sed 's/Subject/Auth/g' )


echo $token > /root/openstack/token.$identity
echo $token > /etc/logstash/scripts/token.$identity
chown root:root /etc/logstash/scripts/token.$identity
