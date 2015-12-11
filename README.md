# Export Event Parameters for Custom Actions

The `appd_alert.sh` is a helper script that exports the event parameters for easy use in custom actions.
`wrapper.sh` is an example script showing how to use the exported parameters from `appd_alert.sh`

Be default the controller passes these parameters as an array of strings. By calling `appd_alert.sh`, the script parses and organizes the parameters to be used from outside programs.

### How the Parameters are exported

There are (2) types of events:
  1. Health Rule Violations
  2. Policy Event Violations
  
Depending on the type of event that is triggered, the number and value of parameters will be different. [See documentation](https://docs.appdynamics.com/display/PRO41/Build+an+Alerting+Extension)
All Parameters can be referenced by the following names below.

#### Health Rule Violations Parameters

| Health Rule Violation Parameter Name                  | Definition                                                                                                                                                                                                                                                                                           |
|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| APP_NAME                                              | name of the business application                                                                                                                                                                                                                                                                     |
| APP_ID                                                | application ID number                                                                                                                                                                                                                                                                                |
| PVN_ALERT_TIME                                        | alert time, such as: Thu Dec 22 15:03:56 PST 2011                                                                                                                                                                                                                                                    |
| PRIORITY                                              | integer designating how urgently a health rule violation should be fixed, with the lowest number (0) the most urgent                                                                                                                                                                                 |
| SEVERITY                                              | INFO, WARN, or ERROR (In the AppDynamics UI they are called "Info", "Warning", and "Critical").                                                                                                                                                                                                      |
| TAG                                                   | or the empty string if no tag is specified                                                                                                                                                                                                                                                           |
| HEALTH_RULE_NAME                                      | name of the health rule that was violated                                                                                                                                                                                                                                                            |
| HEALTH_RULE_ ID                                       | health rule ID                                                                                                                                                                                                                                                                                       |
| PVN_TIME_PERIOD_IN_MINUTES                            | health rule violation time period in minutes                                                                                                                                                                                                                                                         |
| AFFECTED_ENTITY_TYPE                                  | APPLICATION, APPLICATION_COMPONENT (aka Tier), APPLICATION_COMPONENT_NODE, BUSINESS_TRANSACTION, APPLICATION_DIAGNOSTIC_DATA (aka Error)                                                                                                                                                             |
| AFFECTED_ENTITY_NAME                                  | the affected entity name                                                                                                                                                                                                                                                                             |
| AFFECTED_ENTITY_ID                                    | the affected entity id                                                                                                                                                                                                                                                                               |
| NUMBER_OF_EVALUATION_ENTITIES                         | number of entities (Business Transactions, Applications, Tiers, Nodes, Errors, JMX counters, etc..) violating the health rule conditions                                                                                                                                                             |
| EVALUATION_ENTITY_TYPE                                | APPLICATION, APPLICATION_COMPONENT (aka Tier), APPLICATION_COMPONENT_NODE, BUSINESS_TRANSACTION, APPLICATION_DIAGNOSTIC_DATA (aka Error), JMX                                                                                                                                                        |
| EVALUATION_ENTITY_NAME                                | the evaluation entity name (for JMX it is the counter name)                                                                                                                                                                                                                                          |
| EVALUATION_ENTITY_ID                                  | the evaluation entity id or <NULL> for JMX                                                                                                                                                                                                                                                           |
| NUMBER_OF_TRIGGERED_CONDITIONS_PER_EVALUATION_ENTITY  | number of times to loop through the triggered condition parameters for each evaluation entity; if more than one condition is triggered, the parameters repeat for each triggered condition, where "x" is the position of the condition                                                               |
| SCOPE_TYPE_x                                          | the scope of the parameter, whether the scope is the application, tier, or node:Ę                                                                                                                                                                                                                    |
|                                                       | APPLICATION, APPLICATION_COMPONENT, APPLICATION_COMPONENT_NODE                                                                                                                                                                                                                                       |
| SCOPE_NAME_x                                          | the name of the scope, such as: ACME Book Store Application                                                                                                                                                                                                                                          |
| SCOPE_ID_x                                            | the scope id                                                                                                                                                                                                                                                                                         |
| CONDITION_NAME_x                                      | the health rule condition name                                                                                                                                                                                                                                                                       |
| CONDITION_ID_x                                        | the health rule condition id                                                                                                                                                                                                                                                                         |
| OPERATOR_x                                            | allowed operators: LESS_THAN, LESS_THAN_EQUALS, GREATER_THAN, GREATER_THAN_EQUALS, EQUALS, NOT_EQUALS.                                                                                                                                                                                               |
| CONDITION_UNIT_TYPE_x                                 | the condition for the threshold parameter: ABSOLUTE, BASELINE_STANDARD_DEVIATION, BASELINE_PERCENTAGE, BASELINE_PERCENTILE                                                                                                                                                                           |
| USE_DEFAULT_BASELINE_x                                | a Boolean parameter (true or false) applicable only when the condition unit type is one of the BASELINE_ types                                                                                                                                                                                       |
| BASELINE_NAME_x                                       | applicable only when the condition unit type is one of the BASELINE_ types and the use default baseline parameter is "false"                                                                                                                                                                         |
| BASELINE_ID_x                                         | applicable only when the condition unit type is one of the BASELINE_ types and the use default baseline parameter is "false"                                                                                                                                                                         |
| THRESHOLD_VALUE_x                                     | health rule threshold setting                                                                                                                                                                                                                                                                        |
| OBSERVED_VALUE_x                                      | value that violated the health rule threshold                                                                                                                                                                                                                                                        |
| SUMMARY_MESSAGE                                       | summary of the notification, such as: "Health rules have been violated."                                                                                                                                                                                                                             |
| INCIDENT_ID                                           | The incident identifier number for this health rule violation. Incident ID is unique within the Controller. The field is defined asĘint(11) which means it takes four bytes of space that is 32 bits of space with 2^(31) - 1 = 2147483647 max value and -2147483648 min value. One bit is for sign. |
| DEEP_LINK_URL                                         | Controller deep link URL, such as:                                                                                                                                                                                                                                                                   |
|                                                       | http://<controller-host-url>/#location=APP_INCIDENT_DETAIL&incident=<incident-id>                                                                                                                                                                                                                    |
|                                                       | Append the incident ID to the URL to provide a link to the Controller UI for this policy violation                                                                                                                                                                                                   |
| EVENT_TYPE                                            | POLICY_OPEN_WARNING, POLICY_OPEN_CRITICAL,POLICY_CLOSE_WARNING, POLICY_CLOSE_CRITICAL,POLICY_UPGRADED, POLICY_DOWNGRADED,POLICY_CANCELED_WARNING,POLICY_CANCELED_CRITICAL,ĘPOLICY_CONTINUES_CRITICAL, and POLICY_CONTINUES_WARNING                                                                   |
| ACCOUNT_NAME                                          | name of the account in which the action was triggered                                                                                                                                                                                                                                                |
| ACCOUNT_ID                                            | id of the account in which the action was triggered                                                                                                                                                                                                                                                  |

#### Policy Events

| Event Notification Parameter | Definition                                                                                                                                   |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| APP_NAME                     | name of the business application                                                                                                             |
| APP_ID                       | application ID number                                                                                                                        |
| EN_TIME                      | event notification time, for example: Wed Jan 04 09:36:55 PST 2012                                                                           |
| PRIORITY                     | integer designating how urgently a health rule violation should be fixed, with the lowest number (0) the most urgent                         |
| SEVERITY                     | Allowed values: INFO, WARN, or ERROR (In the AppDynamics UI they are called "Info", "Warning", and "Critical")                               |
| TAG                          | or <NULL> if it was not specified by the user                                                                                                |
| EN_NAME                      | name of the event notification                                                                                                               |
| EN_ID                        | event notification ID number                                                                                                                 |
| EN_INTERVAL_IN_MINUTES       | event notification interval in minutes                                                                                                       |
| NUMBER_OF_EVENT_TYPES        | determines how many times to loop through the event type map parameters                                                                      |
| EVENT_TYPE_x                 | if there is more than one event type, the parameters repeat for each event type, where "x" increments the number representing the event type |
| EVENT_TYPE_NUM_x             | number of events of this type                                                                                                                |
| NUMBER_OF_EVENT_SUMMARIES    | number of event summaries in the notification; determines how many times to loop through the event summary parameters                        |
| EVENT_SUMMARY_ID_x           | event summary ID number                                                                                                                      |
| EVENT_SUMMARY_TIME_x         | event summary time, for example: Wed Jan 04 09:34:13 PST 2012                                                                                |
| EVENT_SUMMARY_TYPE_x         | type of event, such as: APPLICATION_CONFIG_CHANGE, APP_SERVER_RESTART, DIAGNOSTIC_SESSION, STALL                                             |
| EVENT_SUMMARY_SEVERITY_x     | event severity, such as: INFO, WARN, or ERROR (In the AppDynamics UI they are called "Info", "Warning", and "Critical")                      |
| EVENT_SUMMARY_STRING_x       | event summary string, such as: Application Server environment variables changed                                                              |
| DEEP_LINK_URL                | http://<controller-host-url>/#location=APP_EVENT_VIEWER_MODAL&eventSummary=Ę                                                                 |
|                              | Append each event summary IDĘto the URLĘto provide a link to the Controller UI for this event                                                |
| ACCOUNT_NAME                 | name of the account in which the action was triggered                                                                                        |
| ACCOUNT_ID                   | id of the account in which the action was triggered                                                                                          |
|                              |                                                                                                                                              |



### Parameter Export Script

Depending on what version of the controller you are using. Change lines 386-388 accordingly:
  1. For 4.0.6 controller or less: `if is_hrv_event ${@:-1} = $SUCCESS`         
  2. For 4.0.6 or greater:  `if is_hrv_event ${@:(-3):1} = $SUCCESS`    
  
It is highly suggested not to make changes to this file.

### Example Wrapper Script

The wrapper script MUST reference the parameter export script. `. ./appd_alert.sh "$@" >> $LOGF` as seen in Line 4.
Line 5 assigns a log file directory to ouput the parameters. (Change this variable to a directory in your environment)

The wrapper demonstates the different parameters for the (2) types of events. 
  1. Lines 13-35 for Health Rule Violations
  2. Lines 36-53 for Policy Events


For more information on Custom Actions. [See Documentation](https://docs.appdynamics.com/display/PRO40/Custom+Actions)

Contributors:
 1. Kunal Gupta
 2. Bryan Nagallo


