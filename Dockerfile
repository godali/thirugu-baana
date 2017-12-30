FROM openjdk:8u141-jdk
RUN mkdir -p /app/
ADD *.jar /app/

ENV PATH /app:$PATH

CMD java -Xmx256m -Xms256m -jar /app/*.jar