
github/go cicd template

* goreleaser and docker sandbox

-- stuff

## Notes

Version build:

```sh
go build -ldflags="-X main.Version=42"
```

Docker build:

```sh
# default version
docker build . -t gh-cicd

# given version
docker build . -t gh-cicd --build-arg="APP_VERSION=666"

# test
docker run --rm -it gh-cicd
```