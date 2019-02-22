# Docker image for android build in IBM DevOps Services Continuous Delivery Pipeline

This image is deployed to [ibmgarage/pipeline-android](https://hub.docker.com/r/ibmgarage/pipeline-android/) on dockerhub.

It includes:

- Oracle Java 8
- Android SDK
- Node 8
- Fastlane

**NOTE:** you must set `JAVA_HOME` to `/usr/lib/jvm/java-8-oracle` in the pipeline stage to use java (the pipeline overrides the variable set in the Dockerfile).

## Example script for react native deploy to play store

```sh
#!/bin/bash -ex

npm/yarn install
npm/yarn test

cd android

fastlane alpha
```
