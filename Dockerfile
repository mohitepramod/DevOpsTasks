FROM java
RUN ls
COPY ./run.sh /opt/
RUN . /opt/run.sh
