#!/bin/bash

UUID=$(python3 -c "import uuid; hexstring=uuid.UUID(\"$1\").hex.upper(); print(' '.join([hexstring[i:i+2] for i in range(0, len(hexstring), 2)]))")
MAJOR=$(printf '%x' $2)
MINOR=$(printf '%x' $3)

# Ensure that the bluetooth adapter is running
if [[ ! $(hciconfig hci0 | grep "UP RUNNING") ]]; then
    hciconfig hci0 up
fi

# Enable non connectable undirected advertising
hciconfig hci0 leadv 3

# Disable scanning
hciconfig hci0 noscan

# Initialise the beacon with the given uuid, major and minor
hcitool -i hci0 cmd 0x08 0x0008 1E 02 01 1A 1A FF 4C 00 02 15 $UUID 00 $MAJOR 00 $MINOR C8 00
