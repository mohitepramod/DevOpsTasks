FROM java
RUN ls
COPY ./run.sh /opt/
RUN . /opt/run.sh
RUN java -cp sample.jar code.main.App
