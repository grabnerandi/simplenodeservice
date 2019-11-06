#!/bin/bash
echo "Adding resource files to our repo"

#keptn create project keptnsample shipyard.yaml
#sleep 10
#keptn onboard service --project=keptnsample --values=values.yaml

# adding resources for staging
keptn add-resource --project=keptn05eks --service=simplenode --stage=staging --resource=jmeter/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
keptn add-resource --project=keptn05eks --service=simplenode --stage=staging --resource=jmeter/load.jmx --resourceUri=jmeter/load.jmx
keptn add-resource --project=keptn05eks --service=simplenode --stage=staging --resource=qualitygates/service-indicators.yaml --resourceUri=service-indicators.yaml
keptn add-resource --project=keptn05eks --service=simplenode --stage=staging --resource=qualitygates/service-objectives.yaml --resourceUri=service-objectives.yaml

# adding resources for production
keptn add-resource --project=keptn05eks --service=simplenode --stage=prod --resource=jmeter/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
keptn add-resource --project=keptn05eks --service=simplenode --stage=prod --resource=jmeter/load.jmx --resourceUri=jmeter/load.jmx
keptn add-resource --project=keptn05eks --service=simplenode --stage=prod --resource=qualitygates/service-indicators.yaml --resourceUri=service-indicators.yaml
keptn add-resource --project=keptn05eks --service=simplenode --stage=prod --resource=qualitygates/service-objectives.yaml --resourceUri=service-objectives.yaml