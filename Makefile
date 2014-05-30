# Generated automatically from Makefile.in by configure.

# To build for Trinux, add '-static' to LDFLAGS
# and 'strip *sic' after they compile

PREFIX  = /usr/local
CC	= gcc
DEFS	=  -DHAVE_LIBNET=1 -DSTDC_HEADERS=1 -Din_addr_t=u_int32_t  `libnet-config --defines`
CFLAGS	= -g -O2 `libnet-config --cflags`
LIBS	= -lnet  `libnet-config --libs`
LDFLAGS	= 

INSTALL	= /usr/bin/install -c

VERSION = 0.07
DEFS   += -DVERSION=\"$(VERSION)\"

BINS	= isic tcpsic udpsic icmpsic esic multisic isic6 tcpsic6 udpsic6 icmpsic6
MAN	= isic.1

all: $(BINS)

isic:	isic.c isic.h
	$(CC) -o isic isic.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

tcpsic:	tcpsic.c isic.h
	$(CC) -o tcpsic tcpsic.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

udpsic:	udpsic.c isic.h
	$(CC) -o udpsic udpsic.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

icmpsic: icmpsic.c isic.h
	$(CC) -o icmpsic icmpsic.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

esic:	esic.c isic.h
	$(CC) -o esic esic.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

multisic:	multisic.c isic.h
	$(CC) -o multisic multisic.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

isic6:	isic6.c isic.h
	$(CC) -o isic6 isic6.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

tcpsic6: tcpsic6.c isic.h
	$(CC) -o tcpsic6 tcpsic6.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

udpsic6: udpsic6.c isic.h
	$(CC) -o udpsic6 udpsic6.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

icmpsic6: icmpsic6.c isic.h
	$(CC) -o icmpsic6 icmpsic6.c -Wall -W $(CFLAGS) $(DEFS) $(LIBS) $(LDFLAGS)

realclean: distclean
distclean: clean
	rm -f config.cache config.log config.status

clean:
	rm -f $(BINS)

package: distclean
	rm -f Makefile
	chmod 755 configure
	( cd .. ; rm -f isic-$(VERSION).tgz ; \
	  tar -czvf isic-$(VERSION).tgz ./isic-$(VERSION)/* )

install: $(BINS) $(MAN)
	$(INSTALL) -m 0755 -d $(PREFIX)/bin
	$(INSTALL) -m 0755 -c $(BINS) $(PREFIX)/bin
	$(INSTALL) -m 0755 -d $(PREFIX)/man/man1
	${INSTALL} -m 0755 -c $(MAN) $(PREFIX)/man/man1
