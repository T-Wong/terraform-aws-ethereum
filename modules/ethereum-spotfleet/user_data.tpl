#!/bin/bash -xe

# Start mining
/usr/bin/ethminer --farm-recheck 200 -U -S ${pool_host} -O ${wallet_address}
