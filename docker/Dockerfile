FROM golang:1.23 AS Builder

WORKDIR /app

COPY . .

RUN go build -o myapp .

FROM alpine:latest 

WORKDIR /main/

COPY --from=Builder /app/myapp .

EXPOSE 8081

CMD ["./myapp" ]