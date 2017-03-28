#!/bin/bash

echo Dumping schema
pg_dump -h 192.168.1.206 -Umdd --no-owner --no-acl --no-security-labels --schema-only --table=lookupitem --table=lookupset --table=property --table=nodetype --table=property_group --table=nodetype_property --table=store --table=principal --table=principal_group --table=profile --table=container_containee --table=esign_wflow --table=record_node --table=hold_node --table=hold --table=recent_container --table=ftextindex --table=evt_based_notification --table=node_event --table=object_event --table=NODE_REFS --table=nodetype_* edms > create-db.sql

echo Dumping data
pg_dump -h 192.168.1.206 -Umdd --no-owner --no-acl --no-security-labels --data-only --column-inserts --table=lookupitem --table=lookupset --table=property --table=nodetype --table=property_group --table=nodetype_property --table=store --table=principal --table=principal_group --table=profile --table=container_containee --table=esign_wflow --table=record_node --table=hold_node --table=hold --table=recent_container --table=ftextindex --table=evt_based_notification --table=NODE_REFS --table=nodetype_b7bc8b7449614d159ce0869306f04d36 --table=nodetype_c22816ad803c47ed83400bc787d06ed4 edms > insert-data.sql

# Removing SET commands
sed -i -e '/^SET/ d' ./create-db.sql
sed -i -e '/^SET/ d' ./insert-data.sql

# Removing constraints
sed -ie '/^ALTER TABLE/ d' ./create-db.sql
sed -ie 's/^. *ADD CONSTRAINT.*//g' ./create-db.sql
sed -ie '/^CREATE UNIQUE INDEX/ d' ./create-db.sql
sed -ie '/^CREATE INDEX/ d' ./create-db.sql

# Removing 'Using btree'
sed -ie 's/USING btree/ /g' ./create-db.sql

# Remove ::
sed -ie 's/::.*,/,/g' ./create-db.sql

# Remove DEFERRABLE
sed -ie 's/DEFERRABLE;/;/g' ./create-db.sql

# Remove ONLY
sed -ie 's/ALTER TABLE ONLY/ALTER TABLE/g' ./create-db.sql

# Remove long variables
sed -ie 's/\\\\x.{6000}/ /g' ./insert-data.sql

# Add mising types
echo 'CREATE TYPE BYTEA AS VARCHAR(1000000);' | cat - create-db.sql > temp && mv temp create-db.sql
echo 'CREATE TYPE TEXT AS VARCHAR(1000000)' | cat - create-db.sql > temp && mv temp create-db.sql
echo 'SET DATABASE SQL REGULAR NAMES FALSE;' | cat - create-db.sql > temp && mv temp create-db.sql

echo Manual tasks
echo 1: Remove all autoscript column values from insert-data.sql
