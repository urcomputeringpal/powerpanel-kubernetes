FROM alpine as build
RUN apk --no-cache add wget
WORKDIR /tmp
RUN wget https://dl4jz3rbrsfum.cloudfront.net/software/powerpanel-132-x86_64.tar.gz
RUN tar xzvf powerpanel-132-x86_64.tar.gz

FROM alpine
WORKDIR /
RUN apk --no-cache add libc6-compat
COPY --from=build /tmp/powerpanel-1.3.2/bin/* /usr/local/sbin/
COPY --from=build /tmp/powerpanel-1.3.2/script/* /etc/
COPY --from=build /tmp/powerpanel-1.3.2/conf/* /etc/
RUN chmod a+x /usr/local/sbin/* /etc/*.sh
