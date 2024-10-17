FROM golang:1.21 AS build

WORKDIR /app

COPY main.go .

ENV GO111MODULE=off

RUN go build -o main .

FROM alpine:latest

COPY --from=build /app/main .

EXPOSE 8080

CMD ["./main"]