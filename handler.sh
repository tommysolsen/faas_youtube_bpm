#!/bin/sh

read URL
youtube-dl -x -q --restrict-filenames --no-warnings --audio-format wav --exec "sox {} -V1 -t raw -r 44100 -e float -c 1 - | /app/bpm > bpm.log && rm {}" "$URL"
cat bpm.log
exit 0
