PREFIX ?= /usr/local

.PHONY: all install-mpv-vh install-vlc-vh install uninstall

all: ;

install-mpv-vh:
	mkdir -p -m 0755 -- "$(DESTDIR)$(PREFIX)/bin"
	mkdir -p -m 0755 -- "$(DESTDIR)$(PREFIX)/share/applications"
	install -D -m 0755 mpv-vh "$(DESTDIR)$(PREFIX)/bin"
	install -D -m 0755 mpv-vh.desktop "$(DESTDIR)$(PREFIX)/share/applications"
	-update-desktop-database

install-vlc-vh:
	mkdir -p -m 0755 -- "$(DESTDIR)$(PREFIX)/bin"
	mkdir -p -m 0755 -- "$(DESTDIR)$(PREFIX)/share/applications"
	install -D -m 0755 vlc-vh "$(DESTDIR)$(PREFIX)/bin"
	install -D -m 0755 vlc-vh.desktop "$(DESTDIR)$(PREFIX)/share/applications"
	-update-desktop-database

install: install-mpv-vh install-vlc-vh

uninstall:
	-rm -f -- "$(DESTDIR)$(PREFIX)/bin/vlc-vh"
	-rm -f -- "$(DESTDIR)$(PREFIX)/share/applications/vlc-vh.desktop"
	-rm -f -- "$(DESTDIR)$(PREFIX)/bin/mpv-vh"
	-rm -f -- "$(DESTDIR)$(PREFIX)/share/applications/mpv-vh.desktop"
	-update-desktop-database
