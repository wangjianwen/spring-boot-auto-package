#!/bin/bash

if [ x"$JAVA_HOME" == x ]; then
    echo "==================== Failed! ====================="
    echo "======         Please set JAVA_HOME         ======"
    echo "=================================================="
    exit 1
fi


# application directory
cd `dirname $0`
APP_HOME=`pwd`

# Java main class to start this program
APP_MAIN_CLASS=com.youyou.example.Application

# get the full classpath, includes all the jars in lib directory
# especially the conf directory, it will be added to the first of classpath
CLASSPATH=${APP_HOME}/conf/
for i in "$APP_HOME"/lib/*.jar;do
   CLASSPATH="$CLASSPATH":"$i"
done

LOGS_DIR="$APP_HOME/logs"
if [ ! -d $LOGS_DIR ]; then
    mkdir $LOGS_DIR
    #echo "created logs directory: path=$LOGS_DIR"
fi
STDOUT_FILE=$LOGS_DIR/out.log


nohup $JAVA_HOME/bin/java $JAVA_OPTS $JAVA_MEM_OPTS $JAVA_DEBUG_OPTS $PINPOINT_OPTS -classpath $CLASSPATH $APP_MAIN_CLASS >$STDOUT_FILE 2>&1 &
