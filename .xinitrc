#!/bin/sh


### Merge in defaults and keymaps
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

### steven's modifications
userresources=$HOME/X11/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

usermodmap=$HOME/.Xmodmap
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

### Start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Input configurations - move this somewhere else?
#moved these to awesome/script.sh
# Graphical utilities
nitrogen --restore &
picom &
redshift &





# Systray apps
udiskie --tray &
keepassxc &
blueman-applet &







## awesome 
exec awesome

