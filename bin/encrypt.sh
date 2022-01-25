#!/bin/bash

JAVA=`which java`

if [ "$JAVA" == "" ]; then
        echo "Unable to find Java Runtime in PATH";
        exit -1;
else
	$JAVA -cp dataloader-54.0.0-uber.jar com.salesforce.dataloader.security.EncryptionUtil "$@" | sed 's/^.*) \- //g'
fi
