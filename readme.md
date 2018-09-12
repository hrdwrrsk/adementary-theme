<img src="https://github.com/hrdwrrsk/tetra-gtk-theme/raw/master/logo.svg" alt="Logo" align="left" /> Tetra
======
### Tetra (formerly or codenamed "Project Beaucoup") is Adwaita-based gtk+ theme with design influence from elementary OS and Vertex gtk+ theme.

-------------------
![Screenshot](Screenshot.png)

# Supported desktop environments
- GNOME 3
- Xfce
- Budgie
- MATE (status: beta)

### Currently not supported desktop :
- Cinnamon (As of 21 August, it's undecided since i'm waiting for Linux Mint/Cinnamon dev are dropping use of old Metacity XML WM theme and use gtk+ WM theme like GNOME shell/Mutter 3.16+ and Metacity since 3.20+)

## Not really supported
- Pantheon (elementary OS) (maybe reconsidered, but it will be a 'completely different' version)
- LXDE
- Window Managers (Openbox, enlightenment...)
- Qt/Non-gtk+ desktops (Plasma 5, LXQt...)

# Typography
*Inter UI* is used as default primary font for this theme, you can get Inter UI at [here](https://rsms.me/inter/). Alternatively, you can use Roboto (it's available at your distribution's package manager)

# Installation
### Dependencies
before you installing this theme, you need this package installed on your system:
- `sassc` for compiling sass css sources
- `gtk` 3.22 (however, it can run on Ubuntu 16.04 LTS if you using gnome3-staging ppa)

#### Required for rendering assets
- `inkscape`
- `optipng`

Then run this command:

```
git clone https://github.com/hrdwrrsk/tetra-gtk-theme.git
cd tetra-gtk-theme

# System-wide install
sudo ./install sh

# Local install
./install.sh -d ~/.themes
```

# Reporting bugs
report it via "Issues" tab, Pull request for bugfixes also accepted.
for suggestion about design add [design] tag, for DEs/gtk+ app theming/etc. support, add [feature request] tag

# Credits
- Adwaita gtk+ theme
- install.sh, parse-sass.sh and render-assets.sh script adapted from materia-theme by nana-4
- some codes derived from Adapta, Arc, plane-gtk-theme, etc.
