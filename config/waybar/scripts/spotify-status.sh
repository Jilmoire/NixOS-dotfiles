#!/usr/bin/env bash

if playerctl --player=spotify status >/dev/null 2>&1; then
    # Get the current song and artist
    song=$(playerctl --player=spotify metadata title)
    artist=$(playerctl --player=spotify metadata artist)
    echo "$song - $artist"
else
    echo "No song playing"
fi
