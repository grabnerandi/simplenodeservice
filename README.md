# Sample application Simplenodeservice

This sample app is a modified version of the Node.js sample app from the [AWS Elastic Beanstalk Tutorial](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/nodejs-getstarted.html)

I mainly use it to demonstrate continuous delivery, automated quality gates and self-healing of the Open Source project [Keptn](www.keptn.sh) as well as the monitoring capabilities of [Dynatrace](www.dynatrace.com)

## Extended Feature Set
I've modified and extended it with a couple of additional API calls such as:
* echo a string
* invoke a server-side URL and return the byte size
* "login" with a username
* get the currently running version

![](/images/simplenodesersviceui.png)

## 4 Builds with different behavior

I've also built-in an option to slow down server-side code execution or to simulate failed requests.
The app also comes with 4 built-in "build number" behaviors - meaning - if you launch the app and tell it to run as Build 1, 2, 3 or 4 it shows slightly different behavior. You can also launch the application in Production or Non-Production Mode:

| Build | Behavior |
| ----- | --------- |
| 1 | Everything good |
|2|50% Failure Rate of /api/invoke|
|3|Everything good|
|4|20% Failure Rate of /api/invoke and twice as slow when running in production mode|

Every build shows the build number and has its own color:
![](/images/4buildoverview.png)

## How to run it

There are different options on how to run / deploy that app

| Run where | How |
| --------- | --- |
| Local     | npm start |
| Docker    | docker run grabnerandi/simplenodeservice:1.0.0 |
| k8s       | https://github.com/grabnerandi/keptn-qualitygate-examples |

## Build it yourself

You can build the app yourself and also use the buildpush.sh for building the container and pushing it to your own container registry!

## OpenFeature Support

This demo uses OpenFeature + flagd to retrieve the background colour of the app.

This will work in the following configurations:

- `npm run dev_linux` or `npm run dev_windows` (choose depending on your OS) will directly read `flags.json` from disk. No additional flagd instance required. This is the recommended (and easiet)
- A standalone instance of flagd (`set FLAGD_RESOLVER=rpc` and `set FLAGD_ 
- The [OpenFeature Operator](https://github.com/open-feature/open-feature-operator/tree/main/docs), a standalone instance of [flagd](https://flagd.dev).

The app will default to looking for flagd on `127.0.0.1` on port `8013` but this can be configured by setting environment variables: `FEATURE_FLAG_HOST` and `FEATURE_FLAG_PORT` respectively.

When using the Operator on k8s, flagd will be available as a sidecar on `localhost:8013` so no environment variables should be necessary.