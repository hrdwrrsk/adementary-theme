# Tetra

![Screenshot](Screenshot.png)

### Tetra (formerly or codenamed "Project Beaucoup") is Adwaita-based gtk+ theme with design influence from elementary OS and Vertex gtk+ theme.


# Supported desktop environments
- GNOME 3
- Xfce
- Budgie

### maybe it's coming through, if I have a time (Currently not supported list) :
- Cinnamon/MATE (As of 21 August, it's undecided since i'm waiting for Linux Mint/Cinnamon dev are dropping use of old Metacity XML WM theme and use gtk+ WM theme like GNOME shell/Mutter 3.16+ and Metacity since 3.20+)

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
- `meson` build system
- `sassc` for compiling sass css sources
- `inkscape` for rendering png assets
- `optipng`

Then run this command:

```
git clone https://github.com/hrdwrrsk/tetra-gtk-theme.git
cd tetra-gtk-theme

meson build --prefix=/usr
sudo ninja -C build install
```

# Reporting bugs
report it via "Issues" tab, Pull request for bugfixes also accepted.
for suggestion about design add [design] tag, for DEs/gtk+ app theming/etc. support, add [feature request] tag

# Credits
- Adwaita gtk+ theme
- meson install script + license from gnome-theme-starter by godlyranchdressing
- some codes derived from Adapta, Arc, plane-gtk-theme, etc.
