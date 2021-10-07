#!/bin/sh -l

echo "Starting upload"

echo "print files $CHANGED_FILES and test var $TEST_VAR"
for file in $CHANGED_FILES; do
  echo "Post $file to OpenQA job group"
  if [[ $file == "Jobgroups/Tumbleweed.yaml" ]]
  then
    GROUPID=2
  elif [[ $file = "Jobgroups/Leap_15.yaml" ]]
  then
    GROUPID=50
  else
    echo "Job group parameters not added in CI scripts/post_yaml"
    exit 1
  fi
  openqa-client --host http://falafel.suse.cz --apikey $APIKEY --apisecret $APISECRET job_templates_scheduling/$GROUPID post --form schema=JobTemplates-01.yaml preview=1 template="$(cat $file)"
  echo "$file posted"
done

