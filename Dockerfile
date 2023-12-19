FROM alpine:3.19

# set our environment variable
ENV MUSL_LOCPATH="/usr/share/i18n/locales/musl"

RUN apk --no-cache add libintl musl-locales
