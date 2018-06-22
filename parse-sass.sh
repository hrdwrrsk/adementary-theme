#!/bin/bash
set -ueo pipefail

if [[ ! "$(which sassc 2> /dev/null)" ]]; then
  echo "'sassc' needs to be installed to generate the CSS."
  exit 1
fi

SASSC_OPT=('-M' '-t' 'expanded')

_COLOR_VARIANTS=('' '-dark')
_SIZE_VARIANTS=('' '-compact')

if [[ ! -z "${COLOR_VARIANTS:-}" ]]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [[ ! -z "${SIZE_VARIANTS:-}" ]]; then
  IFS=', ' read -r -a _SIZE_VARIANTS <<< "${SIZE_VARIANTS:-}"
fi

echo "== Generating the CSS..."

for color in "${_COLOR_VARIANTS[@]}"; do
  sassc "${SASSC_OPT[@]}" "src/gtk-3.0/gtk-contained$color."{scss,css}
	sassc "${SASSC_OPT[@]}" "src/gnome-shell/gnome-shell."{scss,css}
done
