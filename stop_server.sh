/usr/bin/byobu -S "/tmp/tmux-minecraft/$USER" kill-window -a -t Minecraft:Server \; send-keys -t Minecraft:Server stop Enter \; wait-for server-exited ||
/usr/bin/byobu -S "/tmp/tmux-minecraft/$USER" kill-session -t Minecraft ||
return 0;
