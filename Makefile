SERVICE := notes-from-the-future
DESTDIR ?= dist_root
SERVICEDIR ?= /srv/$(SERVICE)

.PHONY: build install

build:
	echo nothing to build

install: build
	mkdir -p $(DESTDIR)$(SERVICEDIR)
	cp -r docker-compose.yml .env $(DESTDIR)$(SERVICEDIR)
	mkdir -p $(DESTDIR)$(SERVICEDIR)/src/app/
	cp src/app/app.py $(DESTDIR)$(SERVICEDIR)/src/app/app.py
	echo "# censored" > $(DESTDIR)$(SERVICEDIR)/src/app/Dockerfile
	mkdir -p $(DESTDIR)/etc/systemd/system/faustctf.target.wants/
	ln -s /etc/systemd/system/docker-compose@.service $(DESTDIR)/etc/systemd/system/faustctf.target.wants/docker-compose@notes-from-the-future.service

