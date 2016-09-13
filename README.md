# mongodb-repset
Create a 4 members mongodb replica set. A primary, 2 secondary and an arbiter. The primary will be primary always that is present.

The entry point is the repset.sh script
Need to have installed docker and docker compose
Script must be run with root user
mongodb is the hostname for primary instance
slave1, slave2 and slave3 are the hostnames for secondarys
arbiter is the hostname for the arbiter 
slave3 is intended for backups since it has the lower priority to become primary
