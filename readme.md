Adementary
======
Adementary is a theme for GNOME/Budgie/Xfce/Cinnamon desktop with elementary-ish aesthetics.

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
> elementary OS is NOT compatible.
**NOTE:** Some of 3rd-party elementary/Granite apps are uses custom stylesheet that requires default elementary Gtk theme to work (except Flatpak-ed version because it enforced to use elementary Gtk theme), so it will broken if you use this theme (also with other 3rd-party theme)

- Downstream patched GNOME session (Ubuntu, Pop! OS)
> However, you can install 'vanilla' GNOME by typing `sudo apt install gnome-session` in terminal

- MATE
- LXDE
- KDE Plasma 5
- Other desktops/WMs

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
sh parse-sass.sh
# System-wide install
sudo ./install.sh

# Local install
./install.sh -d ~/.themes
```

Then apply this theme with GNOME Tweaks or using your desktop's appearance settings

# Flatpak install
```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.gtk.Gtk3theme.Adementary
```
# Reporting bugs/Add suggestions
report it via "Issues" tab, Pull request for bugfixes and features also accepted.
for suggestion about design add [design] tag, for DEs/gtk+ app theming/etc. support, add [feature request] tag

# Credits
- [Adwaita](https://gitlab.gnome.org/GNOME/gtk) GTK theme by GNOME. (this theme are based on Adwaita)
- elementary OS's GTK [theme/stylesheet](https://github.com/elementary/stylesheet) and it's color palette
- [Mint-Y](https://github.com/linuxmint/mint-themes) theme by Linux Mint, for Cinnamon theme basis
- install.sh, parse-sass.sh and render-assets.sh script are based on nana-4's [materia-theme](https://github.com/nana-4/materia-theme)
- some other projects: Adapta, Arc, plane-gtk-theme and more for code fixes, hacks, etc
