FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o app .

FROM alpine:3.13.6

WORKDIR /app

COPY --from=builder /app/app ./

RUN chown -R 1000:1000 /app

EXPOSE 8080

CMD ["./app"]
