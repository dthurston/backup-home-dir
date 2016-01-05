#!/bin/bash
cd
rsync -av --exclude 'Downloads' --exclude '.cache' --delete /home/dthursto /run/media/dthursto/Backup/
