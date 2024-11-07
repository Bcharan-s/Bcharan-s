FROM ubuntu:22.04 AS builder 

RUN apt-get update && apt-get install -y \
    golang-go \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY go.mod ./

COPY . .

RUN go build -o myapp .

FROM gcr.io/distroless/base

WORKDIR /main/

COPY --from=builder /app/myapp .

EXPOSE 8010

CMD ["./myapp" ]