FROM golang:1.22.2-bullseye as builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN go build -o server

FROM alpine:3.16.2
WORKDIR /app
COPY --from=builder /app/server ./
ENTRYPOINT ["./server"]