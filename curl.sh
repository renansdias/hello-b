#!/bin/bash

x=0
load_balancer_url=a737eface799e11e682650e055176b25-1905912425.us-east-1.elb.amazonaws.com/

while [[ true ]]; do
       	curl $load_balancer_url
       	printf "\n"

       	if [[ `expr $x % 2` = 0 ]]; then
       		printf "+\n"
       	else
       		printf "*\n"
       	fi

       	x=`expr $x + 1`
       	sleep 0.5
done