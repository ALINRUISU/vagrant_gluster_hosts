# vagrant_gluster_hosts

# To Do
* Add /dev/sdb - done
* Update bootstrap.sh - done

# Gluster Design 
* 4 Node
* Distributed 2 Replica 

# Test
* Adding additional bricks
* Adding Expanding capacity
* Failover
* Failback

Adding the Server to a TSP
```console
    # gluster peer probe <server>
```

List the gluster pool
```console
    # gluster pool list
```

Check Peer Status
```console
    # gluster peer status
```

Removing a server
```console
   # gluster peer detach <server>
```

Geomaster vs replicated volumes
Replicated Volumes 	Geo-replication
Mirrors data across clusters -vs-	Mirrors data across geographically distributed clusters
Provides high-availability -vs-	Ensures backing up of data for disaster recovery
Synchronous replication (each and every file operation is sent across all the bricks) -vs-	Asynchronous replication (checks for the changes in files periodically and syncs them on detecting differences)


    Geo-replication over LAN
    Geo-replication over WAN
    Geo-replication over the Internet
    Multi-site cascading Geo-replication

