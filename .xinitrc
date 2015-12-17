xrdb ~/.Xresources &
/home/deku/scripts/deku_BG.sh
mkfontscale /home/deku/.local/share/fonts/
mkfontdir /home/deku/.local/share/fonts/
xset +fp /home/deku/.local/share/fonts/
fc-cache -fv

#exec awesome
#sxhkd &
exec bspwm
