Adementary
======
Adementary (formerly or codenamed "Project Beaucoup" and "Tetra") is a GTK theme based on Adwaita, blended with elementary OS visual design.

-------------------
![Screenshot](/data/Screenshot.png)
![Screenshot](/data/Screenshot-dark.png)
-------------------
This theme has come with **3 variants**

**Variants** | **Description** | **Preview**
:-: | :-: | :-:
**Default** | Light variant with dark panel | ![Default](/data/variant-default.svg)
**Dark** | Dark variant | ![Dark](/data/variant-dark.svg)
**Light** | Light variant with light panel (and GNOME shell/Cinnamon theme) | ![Light](/data/variant-light.svg)

# Supported desktop environments
- GNOME 3
- Xfce
- Budgie
- Cinnamon (> 4.0)

### Not supported desktops
- Pantheon
> Elementary OS is NOT compatible.

- Downstream patched GNOME session (Ubuntu, Pop! OS....)
> However, you can install 'vanilla' GNOME by typing `sudo apt install gnome-session` in terminal

- MATE
- LXDE
- Window Managers (Openbox, enlightenment...)
- Qt/Non-gtk+ desktops (Plasma 5, LXQt, Deepin...)


### Nautilus 3.30 on Ubuntu 18.10
> By default, Ubuntu 18.10 ships with Nautilus version 3.26 because new version doesn't have desktop icons feature

Nautilus 3.30 is available for Ubuntu 18.10 on [gnome3-team/gnome3-staging ppa](https://launchpad.net/~gnome3-team/+archive/ubuntu/gnome3-staging?field.series_filter=cosmic), so it's **important** to use Nautilus 3.30 to have a better experience on Ubuntu 18.10 **(it will lose desktop icons feature, but you can use desktop icons extension for GNOME shell to restore desktop icon feature)**.
Ubuntu 19.04 and later versions ships with latest Nautilus with Desktop icons Shell extension

# (GNOME Shell) Typography
**Noto Sans** is used as default primary font for GNOME shell theme, Cantarell is used as fallback.

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
cd adementary-theme

# System-wide install
sudo ./install.sh

# Local install
./install.sh -d ~/.themes
```

Then apply this theme with GNOME Tweaks or using your desktop's appearance settings

# Reporting bugs/Add suggestions
report it via "Issues" tab, Pull request for bugfixes and features also accepted.
for suggestion about design add [design] tag, for DEs/gtk+ app theming/etc. support, add [feature request] tag

# Credits
- Adwaita Gtk theme by GNOME, for Gtk theme basis
- elementary OS visual design as main inspiration (also color palette.)
- Mint-Y theme by Linux Mint, for Cinnamon theme basis
- install.sh, parse-sass.sh and render-assets.sh script are from nana-4's materia-theme
- some other projects: Adapta, Arc, plane-gtk-theme and more for code fixes, hacks, etc
