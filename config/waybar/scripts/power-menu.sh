#!/usr/bin/env bash

selected=$(echo -e "Lock\nLogout\nReboot\nShutdown\n" | rofi -dmenu -p "Power Menu")

case "$selected" in
  "Lock") swaylock ;;
  "Logout") swaymsg exit ;;
  "Reboot") systemctl reboot ;;
  "Shutdown") systemctl poweroff ;;
esac
