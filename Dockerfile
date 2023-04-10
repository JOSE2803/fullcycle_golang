FROM golang AS build

WORKDIR /app

COPY . /app

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=build /app .

ENTRYPOINT ["./main"]