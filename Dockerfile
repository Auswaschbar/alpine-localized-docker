FROM alpine:3.9

# set our environment variable
ENV MUSL_LOCPATH="/usr/share/i18n/locales/musl"

# install libintl
# then install dev dependencies for musl-locales
# clone the sources
# build and install musl-locales
# remove sources and compile artifacts
# lastly remove dev dependencies again
RUN apk --no-cache add libintl && \
	apk --no-cache --virtual .locale_build add cmake make musl-dev gcc gettext-dev git && \
	git clone https://gitlab.com/rilian-la-te/musl-locales && \
	cd musl-locales && cmake -DLOCALE_PROFILE=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install && \
	cd .. && rm -r musl-locales && \
	apk del .locale_build