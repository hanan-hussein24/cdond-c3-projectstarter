#!/bin/bash

sudo aws cloudformation list-stacks --stack-status-filter CREATE_FAILED --query "StackSummaries[*].StackName" | perl -ne 's/\s+/\n/g;print'| sort |tail -1 | tr -d '""' > stackname.txt

var=$(cat stackname.txt)

sudo aws cloudformation delete-stack --stack-name $var --profile project3 --region us-east-1

