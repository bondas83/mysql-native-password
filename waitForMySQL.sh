#!/bin/bash
# wait until MySQL is really available
maxcounter=45

counter=1
while true; do
    res=$(mysql --protocol TCP -u"root" 2>&1)
    
    if [[ "$res" == *"Access denied for user"* ]]; then
        exit 0
    fi;
    
    echo "We have been waiting for MySQL $res"
    sleep 1
    counter=`expr $counter + 1`
    if [ $counter -gt $maxcounter ]; then
        >&2 echo "We have been waiting for MySQL too long already; failing."
        exit 1
    fi;
done
