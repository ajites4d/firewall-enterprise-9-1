# Firewall Enterprise 9.1 - Backend Dockerfile
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY src/go.mod src/go.sum ./
RUN go mod download

COPY src/ .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o firewall-enterprise main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /app/firewall-enterprise .
COPY config/firewall-config.yaml.example ./config/firewall-config.yaml

EXPOSE 8080
CMD ["./firewall-enterprise", "--config", "config/firewall-config.yaml"]
