#!/bin/bash

today=$(date +%Y-%m-%d)
tag="ibmgarage/pipeline-android:$today"
docker build . -t "$tag"
docker push "$tag"
