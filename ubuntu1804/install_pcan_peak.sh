#!/bin/bash

install_peak_linux_driver(){
	tar -xf /tmp/p_tmp/peak-linux-driver-8.9.2.tar.gz -C /tmp/p_tmp
	cd  /tmp/p_tmp/peak-linux-driver-8.9.2
	make clean
	make NET=NO PCC=NO
	sudo make install
	sudo modprobe pcan 1> /dev/null
}

install_pcan_basic(){
	tar -xf /tmp/p_tmp/PCAN-Basic_Linux-4.3.2.tar.gz -C /tmp/p_tmp
	cd /tmp/p_tmp/PCAN-Basic_Linux-4.3.2/libpcanbasic/pcanbasic
	make clean
	make
	sudo make install
}


install_peak_linux_driver

install_pcan_basic

# rm -r /tmp/driver_tmp/


