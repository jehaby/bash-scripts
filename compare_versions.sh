#!/usr/bin/env bash

# 1 2 > -1
# 1.10 2 > -1
# 2.5 2 > 0
# 1.10 1.7 > 1 

compare_versions() {
    local v1=$1 v2=$2
    read mainv_1 restv_1 <<< $(echo $v1 | sed -r 's|([0-9]+)\.?(.*)|\1 \2 |')
    read mainv_2 restv_2 <<< $(echo $v2 | sed -r 's|([0-9]+)\.?(.*)|\1 \2 |')
    
    if [ -z $mainv_1 ] || [ -z $mainv_2 ]; then
 	echo 0
 	return 0
    fi

    if [ $mainv_1 -gt $mainv_2 ]; then	
	echo '1'
    elif [ $mainv_1 -lt $mainv_2 ] ; then
	echo '-1'
    else
	if [ -z $restv_1 ] || [ -z $restv_1 ]; then 
	    echo 0
	    return 0	
	fi
	echo $(compare_versions $restv_1 $restv_2)
    fi
}

