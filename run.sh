"#!/bin/bash

wget http://192.168.56.104:8081/repository/maven-snapshots/Sample/sample/maven-metadata.xml -O baseVersion.xml

TEMP_VERSION=`grep \<version\> ./baseVersion.xml `
echo "\$TEMP_VERSION"

BASE_VERSION=$(echo "\${TEMP_VERSION}" | sed -e 's/<version>\(.*\)<\/version>/\1/' | sed -e 's/ //g')
echo "$BASE_VERSION"

#echo "${BASE_VERSION##*$'\n'}"
BASE_VER=$(echo "\${BASE_VERSION}" | tail -n1)

echo "\$BASE_VER"

wget 'http://192.168.56.104:8081/repository/maven-snapshots/Sample/sample/'\${BASE_VER}'/maven-metadata.xml' -O artifactVersion.xml

TEMP_VERSION=`grep -m 1 \<value\> ./artifactVersion.xml`
echo "\$TEMP_VERSION"

FINAL_VERSION=$(echo "\${TEMP_VERSION}" | sed -e 's/<value>\(.*\)<\/value>/\1/' | sed -e 's/ //g')
echo "\$FINAL_VERSION"

wget 'http://192.168.56.104:8081/repository/maven-snapshots/Sample/sample/'\${BASE_VER}'/sample-'\${FINAL_VERSION}'.jar' -O  sample.jar"
