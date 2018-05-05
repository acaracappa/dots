#!/bin/bash

#+---------------------------------+
#|                                 |
#|   acaracappa  ;  2018           |
#|   anthony.caracappa@gmail.com   |
#|   github.com/acaracappa         |
#|   linkedin.com/in/acaracappa    |
#|                                 |
#+---------------------------------+

# hosts_sync.sh - this script syncs any additoins to /etc/hosts to hosts.bk or deploy hosts.bk to /etc/hosts

# Variables

HOST_BAK="hosts.bk"

# Core code.
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

while read line; do
	echo $line >> /etc/hosts
done < $HOST_BAK
			
# Clean up.
exit 0

# End of core code.

# Subroutines
