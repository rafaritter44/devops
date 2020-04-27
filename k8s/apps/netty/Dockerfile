FROM openjdk:8 AS builder
COPY . /usr/local/src/app/
WORKDIR /usr/local/src/app/
RUN ./gradlew clean build

FROM openjdk:8
WORKDIR /usr/local/bin/
COPY --from=builder /usr/local/src/app/build/libs/netty.jar .
ENTRYPOINT ["java", "-jar", "netty.jar"]