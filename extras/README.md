Adementary extras
======
Additional extras for Adementary theme, it includes:

# Budgie 'dock-mode' styling hack
This hack are used to style budgie-desktop 'dock-mode' (currently only affects bottom panel/dock position)

### How to use
======
- Create bottom panel in Budgie desktop settings with 3 panel items (2 spacer in start/end region, 1 icon tasklist in center region), then enable "Dock Mode" in that panel
- Set panel spacer to 0
- Move `Adementary-budgie-dock` to `~/.config/gtk-3.0`
- create `gtk.css`, then edit it with your favorite text editor, add:

```
# light mode
@import url("Adementary-budgie-dock/light.css");

# dark mode
@import url("Adementary-budgie-dock/light.css");
```

- Restart budgie-panel (not recommended if you using terminal, use tool something like `xfce4-appfinder`)

`budgie-panel --replace`

If you want to reset it to default, just remove `gtk.css` in `~/.config/gtk-3.0`

======
More extras maybe coming, but priority is currently low.
