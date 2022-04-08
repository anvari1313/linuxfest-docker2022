FROM golang:1.18

WORKDIR /src

COPY go.mod ./

RUN go mod download

COPY main.go ./

RUN go build . -o app

CMD ["./app"]