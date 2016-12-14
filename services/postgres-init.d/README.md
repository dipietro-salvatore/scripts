PostgresSQL bootup Script
=======================

This is a modified version of the Postgres SQL start up script for Kali Linux. In same Kali Linux version, this service has difficulties to start because it is not able to create the log folder. This script checks if the forlder exist, otherwise it will create before do anything else, solving the problem.
Installation:
Download and Replace the postegresql file in /etc/init.d/

cd ~/Downloads

git https://github.com/dipietro-salvatore/postgressql-booupScript.git

cp postegresql  /etc/init.d/postegresql

service postegresql restart
