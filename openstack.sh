#!/bin/sh

#url=https://compute.az1.dc1.clarochile.org:443/v2.1/servers/
#url=https://compute.az1.dc1.clarochile.org:443//v2.1/servers/d81fdd13-ce5d-4033-980b-1a2c6139cc73/diagnostics
url=$1
identity=$2

token=$(</etc/logstash/scripts/token.$identity)    
token=${token//$'\r'/} 

curl --insecure -XGET -H "$token" $url
