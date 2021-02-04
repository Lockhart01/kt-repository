FROM maven:3.5.2-jdk-7-alpine
RUN apt update && apt -y install fortune
RUN ln -s /usr/games/fortune /usr/bin/fortune
CMD tail -f /dev/null