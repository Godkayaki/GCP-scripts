#!/bin/bash

bucket=""gs://testing-export-rui-v1""

gsutil ls -L $bucket | while read -r object; do
    for line in $object; do

        #filter lines by bucket name to get the name        
        if [[ $line == gs://* ]] ; then
            new_object=$(echo $line)
        fi

        #if Update time, format output to get last modified date
        if [[ $line == "Up"* ]] ; then
            echo "Object: $new_object | Last modified: $(echo $object | grep -o -P 'Update time:.{0,80}')"
        fi
    done
done