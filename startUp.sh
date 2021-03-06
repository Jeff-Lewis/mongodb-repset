#!/bin/bash
set -x
MONGO_LOG="/var/log/mongodb/mongod.log"
MONGO="/usr/bin/mongo"
MONGOD="/usr/bin/mongod"
#--setParameter authenticationMechanisms=MONGODB-CR --auth
$MONGOD --fork --replSet fame --noprealloc --smallfiles --logpath $MONGO_LOG --setParameter authenticationMechanisms=MONGODB-CR
sleep 30
 
checkSlaveStatus(){
SLAVE=$1
$MONGO --host $SLAVE --eval db
while [ "$?" -ne 0 ]
do
echo "Waiting for slave to come up..."
sleep 15
$MONGO --host $SLAVE --eval db
done
}
 
if [ "$ROLE" == "master" ]
then
$MONGO --eval "rs.initiate()"
checkSlaveStatus $SLAVE1
$MONGO --eval "rs.add(\"${SLAVE1}:27017\")"
checkSlaveStatus $SLAVE2
$MONGO --eval "rs.add(\"${SLAVE2}:27017\")"
checkSlaveStatus $SLAVE3
$MONGO --eval "rs.add(\"${SLAVE3}:27017\")"
checkSlaveStatus $SLAVE4
$MONGO --eval "rs.addArb(\"${SLAVE4}:27017\")"
$MONGO /root/priorities.js
fi
tailf /dev/null
