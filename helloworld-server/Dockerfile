# Stage 1 - Build
FROM golang:1.22-alpine as builder
WORKDIR /myapp
COPY main.go go.mod ./
RUN go mod download
RUN go build -o /myapp/helloworld .

# Stage 2 - Minimal final image
FROM alpine:latest
WORKDIR /myapp
COPY --from=builder /myapp/helloworld .
ENV LISTEN_PORT=8080
ENTRYPOINT ["/myapp/helloworld"]
