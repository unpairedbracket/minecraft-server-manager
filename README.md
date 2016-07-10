Scripts and systemd unit file for running a minecraft server as a persistent process within a byobu tmux server.
Creates and manages its own tmux server socket in `/tmp/tmux-minecraft/$USER` and runs `~/servers/current/forge.jar` in a window named "Server".
Also creates an extra window running your user's shell for convenience of management.
Attach with `tmux -S "/tmp/tmux-minecraft/$USER attach` (or with byobu instead of tmux).
Byobu executable lines in minecraft-server.service can be replaced with plain tmux if you prefer.

**Installation**

To install, place `minecraft-server.service` in `~/.config/systemd/user` or `~/.local/share/systemd/user` and `stop-server.sh` in `~/bin`
You should also create the directory `~/servers/current`, which is recommended to be a symlink to a more descriptive name in `~/servers`. 
By changing the symlink target you can make one of several server instances "live" at any given point, back up current live server instances, and so on.
The directory acting as `~/servers/current` should contain the server instance you wish to run, with the executable forge server jar named `forge.jar`.

**Running The Server**

To run the server, run `systemctl --user start minecraft-server` as the user who has the files installed.
Stopping the server (and exiting from the utility shell window in tmux) should be noticed by systemd, which will respond by restarting the server for you.
If you wish to stop the server and not have it restarted, either:
* Stop the server but do not exit from the utility shell in tmux.
* Run the command `systemctl --user stop minecraft-server` as the server user.

