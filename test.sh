sudo docker build -t nsjail-gradle .
sudo docker run --privileged nsjail-gradle bash -c "cd /minimal-gradle; NSJAIL=nsjail ./nsjail.sh ./gradlew tasks"
