FROM	alpine:latest

LABEL	maintainer="KATOH Yasufumi <karma@jazz.email.ne.jp>"

ENV	VERSION="1.0.4"
ENV	STRESS_URL="http://deb.debian.org/debian/pool/main/s/stress/stress_${VERSION}.orig.tar.gz"

RUN wget ${STRESS_URL} && \
    apk add --no-cache build-base && \
    tar xvf stress_${VERSION}.orig.tar.gz && \
    cd stress-${VERSION} && \
    ./configure && \
    make install && \
    cd .. && \
    rm -rf stress-${VERSION} && \
    apk del --purge build-base

ENTRYPOINT ["stress"]
CMD ["--help"]