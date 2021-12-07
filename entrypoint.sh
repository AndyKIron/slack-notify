#!/bin/sh
set -e

validate_args() {
  if [ -z "${INPUT_CHANNEL}" ]
  then
    echo "Error: Channel is a required argument."
    exit 1
  else
    echo "OOOO ${INPUT_CHANNEL}"
  fi
#
#  if [ -z "${INPUT_GITHUB_TOKEN}" ]
#  then
#    echo "Error: Github token is required. You can head over settings and"
#    echo "under developer, you can create a personal access tokens. The"
#    echo "token requires repo access."
#    exit 1
#  fi
#
#  if [ -z "${INPUT_WORKFLOW_FILE_NAME}" ]
#  then
#    echo "Error: Workflow File Name is required"
#    exit 1
#  fi
#
#  if [ -z "${INPUT_JOB_NAME_SUBSTRING}" ]
#  then
#    echo "Error: Job name substring is a required argument."
#    exit 1
#  fi
#
#  inputs=$(echo '{}' | jq)
#  if [ "${INPUT_INPUTS}" ]
#  then
#    inputs=$(echo "${INPUT_INPUTS}" | jq)
#  fi
#
#  ref="main"
#  if [ "$INPUT_REF" ]
#  then
#    ref="${INPUT_REF}"
#  fi
}

#trigger_workflow() {
#  echo "${GITHUB_API_URL}/repos/${INPUT_OWNER}/${INPUT_REPO}/actions/workflows/${INPUT_WORKFLOW_FILE_NAME}/dispatches"
#  echo "{\"ref\":\"${ref}\",\"inputs\":${inputs}}"
#
#  trigger_workflow=$(curl --fail -X POST "${GITHUB_API_URL}/repos/${INPUT_OWNER}/${INPUT_REPO}/actions/workflows/${INPUT_WORKFLOW_FILE_NAME}/dispatches" \
#    -H "Accept: application/vnd.github.v3+json" \
#    -H "Content-Type: application/json" \
#    -H "Authorization: Bearer ${INPUT_GITHUB_TOKEN}" \
#    --data "{\"ref\":\"${ref}\",\"inputs\":${inputs}}")
#
#  echo "Sleeping for ${wait_interval} seconds"
#  sleep $wait_interval
#}

main() {
  validate_args

  trigger_workflow
}
main
