#!/bin/bash -eu
DIRECTORY_TO_OBSERVE="$1"      # Directory passed as an argument

function build {
  # Your command
  #go install ./...
  #Processname = "YOur_PROCESS_NAME"
  # Commands...
}

inotifywait \
    --event create --event delete \
    --event modify --event move \
    --format "%e %w%f" \
    --monitor \
    --syslog --quiet --recursive \
    $DIRECTORY_TO_OBSERVE |
while read CHANGED;
do
    echo "$CHANGED"
    if [ "$(pidof $ProcessName)" ]; then
      killall -q -w -9 $ProcessName # To kill running process 
    fi
    build & # Runs in background  
done

