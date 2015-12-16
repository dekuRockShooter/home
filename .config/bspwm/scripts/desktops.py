# Parses a report event message from bspwm. The message has the form
# WSPM:f1:o2:O3:...:LT, which is then converted to 123...T. The relevant fields 
# are those that start with an o (occupied, ie, has at least one window), 
# u (urgent, ie, has a window waiting to be viewed), or a capital letter (the
# current desktop). Depending on the letter, a color is assigned to it.
# We ignore everything that starts with 'f' because such desktops are empty.
# The current desktop is colored red, urgent desktops are yellow, and
# unfocused occupied desktops are normal.

# Variables:
#   desktops: A list of desktops. Desktops consists of a letter followed by
#     a number. The letter is the name of the desktop, and the letter is its
#     state.
#   layout: The layout of the current desktop. This is the last element
#     in desktops.
#   desktop_panel: The string that will be sent to dzen.
import sys

if len(sys.argv) !=  2:
    sys.exit()

desktops = sys.argv[1].split(':')
layout = desktops[-1]
# the first element is irrelevant to the task, so ignore it.
desktops = desktops[1:-1]
desktop_panel = ''
for desktop in desktops:
    if 'f' not in desktop:
        if desktop[0].isupper():
            desktop_panel = desktop_panel + '^fg(red)' + desktop[1] + '^fg()'
        elif desktop[0] == 'u':
            desktop_panel = desktop_panel + '^fg(yellow)' + desktop[1] + '^fg()'
        else:
            desktop_panel = desktop_panel + desktop[1]
print(desktop_panel)
