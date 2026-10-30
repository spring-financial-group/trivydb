FROM ubuntu:26.04 as builder
WORKDIR /source
COPY ./download_trivydbv2.sh .
RUN apt-get -o Acquire::Retries=3 update && apt-get install -y --no-install-recommends curl ca-certificates && bash download_trivydbv2.sh


FROM alpine:3.24
WORKDIR /trivydb/
COPY --from=builder /source/db  ./db
COPY --from=builder /source/java-db  ./java-db
CMD ["sh"]
