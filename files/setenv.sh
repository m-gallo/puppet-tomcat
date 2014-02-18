#!/bin/sh

export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxPermSize=512m -Xms256m -Xmx1024m"
export JAVA_OPTS="$JAVA_OPTS -Dspring.profiles.active=test"
echo "Using CATALINA_OPTS: $CATALINA_OPTS"
echo "Using JAVA_OPTS: $JAVA_OPTS"
