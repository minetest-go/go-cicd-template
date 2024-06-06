FROM golang:1.22.4 as app
ARG APP_VERSION=docker-dev
COPY . /data
WORKDIR /data
RUN go test ./... && \
	CGO_ENABLED=0 go build -ldflags="-X main.Version=${APP_VERSION}"

FROM alpine:3.20.0
COPY --from=app /data/gh-cicd /
EXPOSE 8080

CMD ["/gh-cicd"]
