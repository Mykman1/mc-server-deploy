#!/bin/sh

cd /mc/world || return
FILENAME="$(date +"%Y%m%d-%H%M%S")-world.tar.gz"
screen -S mc -X stuff "save-off\n"
tar -czvf "$FILENAME" .
screen -S mc -X stuff "save-on\n"
gcloud storage cp "${FILENAME}" gs://project-secret-minecraft-backup-weekly
rm -f ./*.tar.gz
