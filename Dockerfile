FROM alpine:3.14
RUN apk update && apk upgrade \
    && apk add --no-cache bash \
    && apk update --no-cache curl; 
WORKDIR /datum-keeper
COPY temp-build/cardano-datum-keeper-exe /datum-keeper/
COPY configs/config.dhall /etc/datum-keeper/
EXPOSE 8082
CMD ["/datum-keeper/cardano-datum-keeper-exe", "/etc/datum-keeper/config.dhall"]