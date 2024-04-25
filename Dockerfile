FROM golang:1.22.2-alpine as builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN go build -o server

FROM alpine:3.19.1
WORKDIR /app
COPY --from=builder /app/server ./
ENTRYPOINT ["./server"]