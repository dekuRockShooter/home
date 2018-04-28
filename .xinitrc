xrdb ~/.Xresources &
#/home/deku/scripts/deku_BG.sh
mkfontscale ~/.local/share/fonts/
mkfontdir ~/.local/share/fonts/
xset +fp ~/.local/share/fonts/
fc-cache -fv

export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS=@im=uim
uim-xim &

#exec awesome
#sxhkd &
exec bspwm
