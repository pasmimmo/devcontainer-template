echo "p.p - Let's build maven project"
mvn clean install
echo "@.@ - Time to build distroless image"
docker build -t myorg/mydistrolessapp .
echo "o.o - Time to clean stuff"
mvn clean
echo "^.^ - ok, let's run image now"
docker run -p 8080:8080 myorg/mydistrolessapp
