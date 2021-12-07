#!/bin/sh
set -e

validate_args() {
  if [ -z "${INPUT_CHANNEL}" ]
  then
    echo "Error: Channel is a required argument."
    exit 1
  fi

  if [ -z "${INPUT_USERNAME}" ]
  then
    echo "Error: User is required."
    exit 1
  fi

  if [ -z "${INPUT_ICON}" ]
  then
    echo "Error: Icon is required."
    exit 1
  fi

  if [ -z "${INPUT_MESSAGE}" ]
  then
    echo "Error: Message is required."
    exit 1
  fi

  if [ -z "${INPUT_SLACK_WEBHOOK}" ]
  then
    echo "Error: Slack webhook is required."
    exit 1
  fi
}

send_notification() {
  DATA="{'text':'<!channel> ${INPUT_MESSAGE}', 'channel': '${INPUT_CHANNEL}', 'username': '${INPUT_USERNAME}', 'icon_emoji': '${INPUT_ICON}'}"
  echo $DATA

  echo $(curl -X POST -H 'Content-type: application/json' --data "$DATA" "${INPUT_SLACK_WEBHOOK}")
}

main() {
  validate_args
  send_notification
}

main
