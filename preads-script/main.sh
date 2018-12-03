#!/bin/bash
    set -e
    set -u
    set -o pipefail

# Now run bandp once for each species.

./bandp.pl -query="MudSkipper_Kit_Plus_Opsins" -subject=TORN_Pool_9_S9 > preads.1.log.txt
./bandp.pl -query="MudSkipper_Kit_Plus_Opsins" -subject=TORN_Pool_10_S10 > preads.1.log.txt
