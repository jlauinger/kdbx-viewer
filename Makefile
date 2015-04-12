
LIBKX9R_CODE = libcx9r/aes256.c libcx9r/base64.c libcx9r/kdbx.c libcx9r/key_tree.c libcx9r/salsa20.c libcx9r/sha256.c libcx9r/stream.c libcx9r/util.c
DEFINES = -DHAVE_STDINT_H -DGCRYPT_WITH_SHA256 -DGCRYPT_WITH_AES -DBYTEORDER=1234 -DHAVE_EXPAT

#libcx9r.o: $(LIBKX9R_CODE)
#	gcc -c -o libcx9r.o -I./include/ $(DEFINES) $(LIBKX9R_CODE) -lgcrypt -lexpat -lz 

#kdbxviewer: libcx9r.o src/main.c
#	gcc -o kdbxviewer -I./include/ main.c libcx9r.o

kdbxviewer: $(LIBKX9R_CODE) src/main.c src/tui.c src/mainWindow.stfl src/helper.c
	mkdir -p bin
	cp src/mainWindow.stfl bin/mainWindow.stfl
	gcc -g -o bin/kdbxviewer -I./include/ -I./libcx9r/ src/main.c src/helper.c $(DEFINES) $(LIBKX9R_CODE) -lgcrypt -lexpat -lz -lstfl src/tui.c -lncurses -lmenu -Wno-pointer-sign

