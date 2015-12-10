# ExportCustomActionsAPPD

The `appd_alert.sh` is a helper script that exports the event parameters for easy use in custom actions.
`wrapper.sh` is a sample bash script showing how to use the exporting parameters from `appd_alert.sh`

There are (2) types of events:
  1. Health Rule Violations
  2. Policy Violations
  
*Depending on this type of even is triggered, the number and value of parameters will be different. [See documentation](https://docs.appdynamics.com/display/PRO41/Build+an+Alerting+Extension)

## Talk about versions of appd_alert.sh


-Bryan
