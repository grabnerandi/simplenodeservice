# Input for Dynatrace Keptn integration
# Need a ""


# Create Management Zone per Keptn Project
{
  "name": "Keptn <KEPTN_PROJECT>",
  "rules": [
    {
      "type": "SERVICE",
      "enabled": true,
      "propagationTypes": [
        "SERVICE_TO_PROCESS_GROUP_LIKE",
        "SERVICE_TO_HOST_LIKE"
      ],
      "conditions": [
        {
          "key": {
            "attribute": "SERVICE_TAGS"
          },
          "comparisonInfo": {
            "type": "TAG",
            "operator": "EQUALS",
            "value": {
              "context": "CONTEXTLESS",
              "key": "project",
              "value": "<KEPTN_PROJECT>"
            },
            "negate": false
          }
        }
      ]
    }
  ]
}


# query response time for a specific test step
curl -X GET "https://hci34192.live.dynatrace.com/api/v2/metrics/series/calc%3Aservice.teststepresponsetime%3Afilter(eq(Test%20Step%2Chomepage))?from=now-7d&scope=tag(service%3Asimplenode)%2Ctag(%5BEnvironment%5Dapplication%3Akeptn05eks)%2Ctag(environment%3Akeptn05eks-staging)"

# queyy with specific timeframe & avg/max
curl -X GET "https://hci34192.live.dynatrace.com/api/v2/metrics/series/calc%3Aservice.teststepresponsetime%3Afilter(eq(Test%20Step%2Chomepage))%3A(avg%2Cmax)?resolution=m&from=2019-11-06T08%3A45%3A00&to=2019-11-06T10%3A10%3A00&scope=tag(service%3Asimplenode)%2Ctag(%5BEnvironment%5Dapplication%3Akeptn05eks)%2Ctag(environment%3Akeptn05eks-staging)"


# Create Request Attributes for Load Testing Integration
