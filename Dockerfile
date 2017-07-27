FROM maven as build
WORKDIR /code
COPY . /code
RUN mvn package

FROM tomcat
WORKDIR /usr/local/tomcat
COPY --from=build /code/target/sysfoo.war webapps/