# ExportCustomActionsAPPD

The `appd_alert.sh` is a helper script that exports the event parameters for easy use in custom actions.
`wrapper.sh` is an example script showing how to use the exported parameters from `appd_alert.sh`

There are (2) types of events:
  1. Health Rule Violations
  2. Policy Violations
  
Depending on the type of event that is triggered, the number and value of parameters will be different. [See documentation](https://docs.appdynamics.com/display/PRO41/Build+an+Alerting+Extension)

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


