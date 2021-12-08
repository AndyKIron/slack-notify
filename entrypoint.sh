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

  icon_url="https://avatars.githubusercontent.com/t/5433436?s=32&v=4"
  if [ -n "${INPUT_ICON}" ]
  then
    icon_url=${INPUT_ICON}
  fi

  icon_emoji=""
  if [ -n "${INPUT_ICON_EMOJI}" ]
  then
    icon_emoji=${INPUT_ICON_EMOJI}
  fi

  status="good"
  if [ -n "${INPUT_STATUS}" ]
  then
    status=${INPUT_STATUS}
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
  attachments="[{'color': '${status}', 'text': '${icon_emoji} ${INPUT_MESSAGE}'}]"
  DATA="{ \
         'channel': '${INPUT_CHANNEL}', \
         'username': '${INPUT_USERNAME}', \
         'icon_url': '${icon_url}', \
         'attachments': ${attachments}
         }"

#  echo $DATA

  echo "Send: $(curl -X POST -H 'Content-type: application/json' --data "$DATA" "${INPUT_SLACK_WEBHOOK}")"
}

main() {
  validate_args
  send_notification
}

main
