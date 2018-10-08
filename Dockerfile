FROM openjdk:11-jdk
RUN mkdir -p /app/
COPY *.jar /app/

ENV PATH /app:$PATH

CMD java -Xmx256m -Xms256m -jar /app/*.jar