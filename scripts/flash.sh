#!/bin/bash
DEV=/dev/${1:-sda1}
echo "Boot into Bootloader ..."
while [ ! -e ${DEV} ]; do
	echo "Waiting for ${DEV} to appear ..."
	sleep 5
done
if [ ! -e ./keeb-ce-mount ]; then 
	mkdir ./keeb-ce-mount
fi
sudo mount ${DEV} ./keeb-ce-mount
sudo cp qmk_firmware/.build/keebio_iris_ce_rev1_FirstTry.uf2 ./keeb-ce-mount/
sudo umount ./keeb-ce-mount
