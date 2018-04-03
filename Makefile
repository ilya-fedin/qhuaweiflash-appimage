all:
	git clone --depth 1 https://github.com/forth32/qhuaweiflash.git
	sh -c 'cd qhuaweiflash; qmake'
	make -C qhuaweiflash
	cp -r skeleton appdir
	cp qhuaweiflash/qhuaweiflash appdir/usr/bin
	wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
	chmod a+x linuxdeployqt-continuous-x86_64.AppImage
	./linuxdeployqt-continuous-x86_64.AppImage appdir/usr/share/applications/*.desktop -bundle-non-qt-libs
	./linuxdeployqt-continuous-x86_64.AppImage appdir/usr/share/applications/*.desktop -appimage

dep:
	apt-get install build-essential git qtbase5-dev qt5-default zlib1g-dev wget fuse file

clean:
	rm -rf qhuaweiflash appdir linuxdeployqt-continuous-x86_64.AppImage
