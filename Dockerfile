FROM ubuntu:21.04 as builder
WORKDIR /source
COPY ./downloader.sh .
RUN apt update && apt install -y wget curl && bash downloader.sh


FROM alpine:3.15.0
WORKDIR /trivydb/
COPY --from=builder /source/trivy.db .
COPY --from=builder /source/metadata.json .
CMD ["sh"]
