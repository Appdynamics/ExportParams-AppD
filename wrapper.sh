#!/bin/bash

LOGF="/home/bnagallo/Desktop/send_alert.log"
# /opt/AppDynamics/Controller/custom/actions/event2netcool
echo "================ $(date) ===============" >> $LOGF

. ./appd_alert.sh  "$@" >> $LOGF

echo "IS_HRV:${IS_HRV}" >> $LOGF
echo "Appliation: ${APP_NAME}" >> $LOGF
echo "Severity: ${SEVERITY}" >> $LOGF

if [ "${IS_HRV}" -eq 1 ]
then
	echo "IS_HRV = ${IS_HRV}. Process a Health Rule violation." >> $LOGF
	echo >> $LOGF
	echo "SUMMARY_MESSAGE: ${SUMMARY_MESSAGE}" >> $LOGF
	echo "APP_NAME: ${APP_NAME}" >> $LOGF
	echo "APP_ID: ${APP_ID}" >> $LOGF
	echo "PVN_ALERT_TIME: ${PVN_ALERT_TIME}" >> $LOGF
	echo "PRIORITY: ${PRIORITY}" >> $LOGF
	echo "SEVERITY: ${SEVERITY}" >> $LOGF
	echo "TAG: ${TAG}" >> $LOGF
	echo "HEALTH_RULE_NAME: ${HEALTH_RULE_NAME}" >> $LOGF
	echo "HEALTH_RULE_ID: ${HEALTH_RULE_ID}" >> $LOGF
	echo "PVN_TIME_PERIOD_IN_MINUTES: ${PVN_TIME_PERIOD_IN_MINUTES}," >> $LOGF
	echo "AFFECTED_ENTITY_TYPE: ${AFFECTED_ENTITY_TYPE}" >> $LOGF
	echo "AFFECTED_ENTITY_NAME: ${AFFECTED_ENTITY_NAME}" >> $LOGF
	echo "AFFECTED_ENTITY_ID: ${AFFECTED_ENTITY_ID}" >> $LOGF
	echo "SUMMARY_MESSAGE: ${SUMMARY_MESSAGE}" >> $LOGF
	echo "INCIDENT_ID: ${INCIDENT_ID}" >> $LOGF
	echo "DEEP_LINK_URL: ${DEEP_LINK_URL}" >> $LOGF
	echo "ACCOUNT_NAME: ${ACCOUNT_NAME}" >> $LOGF
	echo "ACCOUNT_ID: ${ACCOUNT_ID}" >> $LOGF
	echo "EVENT_DETAIL: $EVENT_DETAIL" >> $LOGF
else
	echo "IS_HRV = ${IS_HRV}. Processing Non-Health rule event." >> $LOGF
	echo >> $LOGF
	echo "SUMMARY_MESSAGE: ${SUMMARY_MESSAGE}" >> $LOGF
	echo "APP_NAME: ${APP_NAME}" >> $LOGF
	echo "APP_ID: ${APP_ID}" >> $LOGF
	echo "EN_TIME: ${EN_TIME}" >> $LOGF
	echo "PRIORITY: ${PRIORITY}" >> $LOGF
	echo "SEVERITY: ${SEVERITY}" >> $LOGF
	echo "TAG: ${TAG}" >> $LOGF
	echo "EN_NAME: ${HEALTH_RULE_NAME}" >> $LOGF
	echo "EN_ID: ${HEALTH_RULE_ID}" >> $LOGF
	echo "EN_INTERVAL_IN_MINUTES: ${PVN_TIME_PERIOD_IN_MINUTES}," >> $LOGF
	echo "DEEP_LINK_URL: ${DEEP_LINK_URL}" >> $LOGF
	echo "ACCOUNT_NAME: ${ACCOUNT_NAME}" >> $LOGF
	echo "ACCOUNT_ID: ${ACCOUNT_ID}" >> $LOGF
	echo "EVENT_DETAIL: $EVENT_DETAIL" >> $LOGF
fi



