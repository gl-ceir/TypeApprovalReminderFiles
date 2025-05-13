#!/bin/bash

. /root/.bash_profile
build_path="/u01/ceirapp/TypeApprovalReminder/"
build="type_approval_reminder.jar"
cd $build_path

VAR=""
status=`ps -ef | grep $build | grep java`
if [ "$status" != "$VAR" ]
then
 echo "Process Already Running"
else
 echo "Starting Process"
java -Dlogging.config=./log4j2.xml -Dspring.config.location=file:./application.properties,file:${APP_HOME}/configuration/configuration.properties  -jar $build  >> ${DATA_HOME}/logs/TypeApprovalReminder/log.log 2>> ${DATA_HOME}/logs/TypeApprovalReminder/error.log &
echo "Process Started"
fi
