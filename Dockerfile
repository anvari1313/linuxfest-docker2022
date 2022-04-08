FROM golang:1.18 AS build

WORKDIR /src

COPY go.mod ./

RUN go mod download

COPY main.go ./

RUN go build .

FROM ubuntu:20.04

WORKDIR /app

COPY --from=build /src/linuxfest-docker2022 ./

CMD ["./linuxfest-docker2022"]
