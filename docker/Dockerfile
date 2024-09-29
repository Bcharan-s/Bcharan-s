FROM golang:1.23



WORKDIR /app


COPY . .

RUN go build -o docker .

EXPOSE 8080

CMD ["./docker" ]