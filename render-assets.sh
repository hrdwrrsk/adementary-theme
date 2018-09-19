#!/bin/bash
set -ueo pipefail

if [[ ! "$(which inkscape 2> /dev/null)" ]]; then
  echo "'inkscape' needs to be installed to generate the PNG."
  exit 1
fi

if [[ ! "$(which optipng 2> /dev/null)" ]]; then
  echo "'optipng' needs to be installed to generate the PNG."
  exit 1
fi

gtk() (
  cd src/gtk-3.0/gtk-common
  ./render-assets.sh
)

gtk2_light() (
  cd src/gtk-2.0
  ./render-assets.sh
  ./render-assets-external.sh
)

gtk2_dark() (
  cd src/gtk-2.0
  ./render-assets-dark.sh
  ./render-assets-external-dark.sh
)

xfwm4() (
  cd src/xfwm4
  ./render-assets.sh
)

xfwm4_dark () (
  cd src/xfwm4-dark
  ./render-assets.sh
)

case "${1:-}" in
  "")
    gtk
    gtk2_light
    gtk2_dark
    xfwm4
    xfwm4_dark
    ;;
  gtk)
    gtk
    ;;
  gtk2-light)
    gtk2_light
    ;;
  gtk2-dark)
    gtk2_dark
    ;;
  xfwm4)
    xfwm4
    ;;
  xfwm4_dark)
    xfwm4_dark
    ;;
  *)
    echo "Unknown argument '$1'"
    echo "Use 'chrome', 'gtk', 'gtk2', 'gtk2-light' or 'gtk2-dark' as an argument."
    exit 1
    ;;
esac
