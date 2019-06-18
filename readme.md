Adementary
======
Adementary (formerly or codenamed "Project Beaucoup" and "Tetra") is a GTK theme based on Adwaita, blended with elementary OS visual design.

This fork is purely for adding a "darker" version of standard adementary-theme.
-------------------

-------------------
This theme has come with **3 variants**

**Variants** | **Description**
:-: | :-:
**Darker** | Light variant with dark accents from Dark variant and dark panel
**Dark** | Dark variant
**Light** | Light variant with light panel (and GNOME shell/Cinnamon theme)

# Supported desktop environments
- Budgie

# Installation
### Dependencies
before you installing this theme, you need this package installed on your system:
- `sassc` for compiling sass css sources
- `gtk` 3.22
- [Ubuntu 16.04 users read this](https://github.com/hrdwrrsk/tetra-gtk-theme/wiki/Ubuntu-16.04-users-read-this)
- `bc` (required before running `install.sh` script)

#### Required for rendering assets
- `inkscape`
- `optipng`

Then run this command:

```
git clone https://github.com/hrdwrrsk/adementary-theme.git
cd adementary-darker-theme

# Local install RECOMMENDED!!!
./install.sh -d ~/.themes
```

If you already have main theme installed system wide this fork will override the main theme but easily removable without interfering with original.

# Reporting bugs/Add suggestions
report it via "Issues" tab, Pull request for bugfixes and features also accepted.
for suggestion about design add [design] tag, for DEs/gtk+ app theming/etc. support, add [feature request] tag
ONLY "Darker" is made by me, as such Light and Dark modes issues are to be reported to main developer, hrdwrrsk,

# Credits
- Adwaita Gtk theme by GNOME, for Gtk theme basis
- elementary OS visual design as main inspiration (also color palette.)
- Mint-Y theme by Linux Mint, for Cinnamon theme basis
- install.sh, parse-sass.sh and render-assets.sh script are from nana-4's materia-theme
- some other projects: Adapta, Arc, plane-gtk-theme and more for code fixes, hacks, etc
