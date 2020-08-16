#!/bin/bash

if [[ $1!="current" ]]
then
    for host in hadoop100 hadoop101 hadoop102
    do
     echo ============================================  $host ============================================
        ssh -t $host "sudo date -s $1"
    done
else
    for host in hadoop100 hadoop101 hadoop102
    do
     echo ============================================  $host ============================================
        ssh -t $host "sudo  ntpdate time.nist.gov"
    done

fi

