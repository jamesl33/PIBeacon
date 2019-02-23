.PHONY: install

install:
	install -D PIBeacon.sh /bin/PIBeacon
	install -D PIBeacon.service /etc/systemd/system/
	systemctl enable --now PIBeacon.service
