#!/bin/bash
set -ueo pipefail
#set -x

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$REPO_DIR/src"

DEST_DIR="/usr/share/themes"
THEME_NAME="Tetra"
COLOR_VARIANTS=('' '-dark' '-light')

GTK_VERSIONS=('3.22' '3.24')
GS_VERSIONS=('3.20' '3.22' '3.24' '3.26' '3.28' '3.30' '3.32')
LATEST_GS_VERSION="${GS_VERSIONS[-1]}"

# Set a proper gnome-shell theme version
if [[ "$(which gnome-shell 2> /dev/null)" ]]; then
  CURRENT_GS_VERSION="$(gnome-shell --version | cut -d ' ' -f 3 | cut -d . -f -2)"
  for version in "${GS_VERSIONS[@]}"; do
    if (( "$(bc <<< "$CURRENT_GS_VERSION <= $version")" )); then
      GS_VERSION="$version"
      break
    elif (( "$(bc <<< "$CURRENT_GS_VERSION > $LATEST_GS_VERSION")" )); then
      GS_VERSION="$LATEST_GS_VERSION"
      break
    fi
  done
else
  GS_VERSION="$LATEST_GS_VERSION"
fi

usage() {
  cat << EOF
Usage: $0 [OPTION]...

OPTIONS:
  -d, --dest DIR          Specify theme destination directory (Default: $DEST_DIR)
  -n, --name NAME         Specify theme name (Default: $THEME_NAME)
  -c, --color VARIANT...  Specify theme color variant(s) [standard|dark] (Default: All variants)
  -h, --help              Show this help

INSTALLATION EXAMPLES:
Install all theme variants into ~/.themes
  $0 --dest ~/.themes
Install standard theme variant only
  $0 --color standard
Install specific theme variants with different name into ~/.themes
  $0 --dest ~/.themes --name MyTheme --color light dark
EOF
}

install() {
	local dest="$1"
	local name="$2"
	local color="$3"

	[[ "$color" == '-dark' ]] && local ELSE_DARK="$color"

	local THEME_DIR="$dest/$name$color"

	# FIXME: install shell theme only in light variant
	# local SHELL_THEME_DIR="$dest/$name"

  	# SC2115: Protect /.
  	[[ -d "$THEME_DIR" ]] && rm -rf "${THEME_DIR:?}"

	echo "Installing theme..."

	mkdir -p									"$THEME_DIR"
	cp -r "$SRC_DIR/index$color.theme"						"$THEME_DIR/index.theme"

  mkdir -p                  "$THEME_DIR/cinnamon"
  cp -r "$SRC_DIR/cinnamon/assets$color"            "$THEME_DIR/cinnamon/assets"
  cp -r "$SRC_DIR/cinnamon/cinnamon$color.css"      "$THEME_DIR/cinnamon/cinnamon.css"
  cp -r "$SRC_DIR/cinnamon/thumbnail$color.png"     "$THEME_DIR/cinnamon/thumbnail.png"

	mkdir -p									"$THEME_DIR/gnome-shell"
	cp -r "$SRC_DIR/gnome-shell/assets$color"					"$THEME_DIR/gnome-shell/assets"
	cp -r "$SRC_DIR/gnome-shell/pad-osd.css"					"$THEME_DIR/gnome-shell"
	cp -r "$SRC_DIR/gnome-shell/$GS_VERSION/gnome-shell$color.css"			"$THEME_DIR/gnome-shell/gnome-shell.css"

	mkdir -p									"$THEME_DIR/gtk-2.0"
	cp -r "$SRC_DIR/gtk-2.0/"{apps.rc,hacks.rc,main.rc}				"$THEME_DIR/gtk-2.0"
	cp -r "$SRC_DIR/gtk-2.0/assets${ELSE_DARK:-}"					"$THEME_DIR/gtk-2.0/assets"
	cp -r "$SRC_DIR/gtk-2.0/gtkrc$color"						"$THEME_DIR/gtk-2.0/gtkrc"

	cp -r "$SRC_DIR/gtk-3.0/gtk-common"						"$THEME_DIR/gtk-common"

	for version in "${GTK_VERSIONS[@]}"; do
		if [[ "$version" == "3.22" ]]; then
			mkdir -p							"$THEME_DIR/gtk-3.0"
			cp -r "$SRC_DIR/gtk-3.0/$version/assets"			"$THEME_DIR/gtk-3.0/assets"
			cp -r "$SRC_DIR/gtk-3.0/$version/gtk$color.css"			"$THEME_DIR/gtk-3.0/gtk.css"
			[[ "$color" != '-dark' ]] && \
			cp -r "$SRC_DIR/gtk-3.0/$version/gtk-dark.css"			"$THEME_DIR/gtk-3.0/gtk-dark.css"
      cp -r "$SRC_DIR/gtk-3.0/thumbnail$color.png"        "$THEME_DIR/gtk-3.0/thumbnail.png"
		else
			mkdir -p							"$THEME_DIR/gtk-$version"
			cp -r "$SRC_DIR/gtk-3.0/$version/assets"			"$THEME_DIR/gtk-$version/assets"
			cp -r "$SRC_DIR/gtk-3.0/$version/gtk$color.css"			"$THEME_DIR/gtk-$version/gtk.css"
			[[ "$color" != '-dark' ]] && \
			cp -r "$SRC_DIR/gtk-3.0/$version/gtk-dark.css"			"$THEME_DIR/gtk-$version/gtk-dark.css"
		fi
	done

	mkdir -p									"$THEME_DIR/metacity-1"
	cp -r "$SRC_DIR/metacity-1/metacity-theme-3.xml"	"$THEME_DIR/metacity-1"
  cp -r "$SRC_DIR/metacity-1/assets"                "$THEME_DIR/metacity-1/assets"

	mkdir -p									"$THEME_DIR/plank"
	cp -r "$SRC_DIR/plank/dock$color.theme"						"$THEME_DIR/plank/dock.theme"

  mkdir -p                  "$THEME_DIR/xfce-notify-4.0"
  cp -r "$SRC_DIR/xfce-notify-4.0/gtk$color.css"    "$THEME_DIR/xfce-notify-4.0/gtk.css"

	mkdir -p									"$THEME_DIR/xfwm4"
	cp -r "$SRC_DIR/xfwm4${ELSE_DARK:-}/"{*.png,*.xpm,themerc}			"$THEME_DIR/xfwm4"
}

while [[ "$#" -gt 0 ]]; do
  case "${1:-}" in
    -d|--dest)
      dest="$2"
      if [[ ! -d "$dest" ]]; then
        echo "ERROR: Destination directory does not exist."
        exit 1
      fi
      shift 2
      ;;
    -n|--name)
      _name="$2"
      shift 2
      ;;
    -g|--gdm)
      gdm='true'
      shift 1
      ;;
    -c|--color)
      shift
      for variant in "$@"; do
        case "$variant" in
          standard)
            colors+=("${COLOR_VARIANTS[0]}")
            shift
            ;;
          dark)
            colors+=("${COLOR_VARIANTS[1]}")
            shift
            ;;
          light)
            colors+=("${COLOR_VARIANTS[2]}")
            shift
            ;;
          -*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized color variant '$1'."
            echo "Try '$0 --help' for more information."
            exit 1
            ;;
        esac
      done
      ;;
    -s|--size)
      shift
      for variant in "$@"; do
        case "$variant" in
          standard)
            sizes+=("${SIZE_VARIANTS[0]}")
            shift
            ;;
          compact)
            sizes+=("${SIZE_VARIANTS[1]}")
            shift
            ;;
          -*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized size variant '${1:-}'."
            echo "Try '$0 --help' for more information."
            exit 1
            ;;
        esac
      done
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "ERROR: Unrecognized installation option '${1:-}'."
      echo "Try '$0 --help' for more information."
      exit 1
      ;;
  esac
done

if [[ ! -w "${dest:-$DEST_DIR}" ]]; then
  echo "Please run as root."
  exit 1
fi

for color in "${colors[@]:-${COLOR_VARIANTS[@]}}"; do
	install "${dest:-$DEST_DIR}" "${_name:-$THEME_NAME}" "$color"
done

echo
echo "Installation complete."
