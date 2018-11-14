#!/bin/bash
    set -e
    set -u
    set -o pipefail

# First, download and unzip the files from http://eagle.fish.washington.edu.

curl http://eagle.fish.washington.edu/fish546/calder/preads/preads-data.zip > preads-data.zip
unzip preads-data.zip

# Now run bandp once for each species.

./bandp.pl -query="MudSkipper_Kit_Plus_Opsins" -subject=TORN_Pool_9_S9 > preads.1.log.txt
./bandp.pl -query="MudSkipper_Kit_Plus_Opsins" -subject=TORN_Pool_10_S10 > preads.1.log.txt