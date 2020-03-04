FROM mrothy/scalafmt-native:2.3.2 as scalafmt-native

FROM alpine:latest
LABEL "repository"="https://github.com/mattjp/map-scalafmt"
LABEL "homepage"="https://github.com/mattjp/map-scalafmt"
LABEL "maintainer"="Map"

COPY --from=scalafmt-native /app/scalafmt /usr/local/bin/scalafmt
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--diff --list"]