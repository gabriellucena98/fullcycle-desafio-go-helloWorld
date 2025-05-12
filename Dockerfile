FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY main.go .

# Desativa o modo de módulos do Go
ENV GO111MODULE=off

RUN go build -ldflags="-s -w" -o fullcycle

FROM scratch
COPY --from=builder /app/fullcycle /
ENTRYPOINT ["/fullcycle"]
