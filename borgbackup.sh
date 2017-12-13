#!/bin/bash

export REPO=''
export BORG_PASSPHRASE=''
export BACKUP_LOCATIONS=''

export BORG_REPO=ssh://borg@nical.ddns.net:993/mnt/borg/$REPO

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting Backup..."

# --exclude '/tmp' for exclusions!
borg create --progress --stats ::{hostname}-{user}-{now:%Y-%m-%dT%H:%M:%S} $BACKUP_LOCATIONS

info "Backup Complete!"
