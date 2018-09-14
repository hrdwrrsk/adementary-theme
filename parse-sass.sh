#!/bin/bash
set -ueo pipefail

if [[ ! "$(which sassc 2> /dev/null)" ]]; then
  echo "'sassc' needs to be installed to generate the CSS."
  exit 1
fi

SASSC_OPT=('-M' '-t' 'expanded')

_COLOR_VARIANTS=('' '-dark')
_SIZE_VARIANTS=('' '-compact')

GS_VERSIONS=('3.20' '3.22' '3.24' '3.26' '3.28' '3.30')


if [[ ! -z "${COLOR_VARIANTS:-}" ]]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

echo "== Generating the CSS..."

for color in "${_COLOR_VARIANTS[@]}"; do
  sassc "${SASSC_OPT[@]}" "src/gtk-3.0/3.22/gtk$color."{scss,css}
  sassc "${SASSC_OPT[@]}" "src/gtk-3.0/3.24/gtk$color."{scss,css}

  for version in "${GS_VERSIONS[@]}"; do
    sassc "${SASSC_OPT[@]}" "src/gnome-shell/$version/gnome-shell$color."{scss,css}
  done
done
