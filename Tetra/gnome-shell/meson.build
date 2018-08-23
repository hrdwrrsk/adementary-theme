shell_dir = join_paths(theme_dir, 'gnome-shell')

# generated .css files from .scss
theme_files = [
    'gnome-shell',
]
# theme sources .scss files
theme_sources = [
  '_colors.scss',
  '_common.scss',
  '_extensions.scss',
  '_drawing.scss',
]

shell_asset_dir = join_paths(shell_dir, 'assets')

# static files to copy
data_sources = [
  'pad-osd.css',
]

assets_sources = [
  'assets/calendar-arrow-left.svg',
  'assets/calendar-arrow-right.svg',
  'assets/calendar-today.svg',
  'assets/checkbox-focused.svg',
  'assets/checkbox-off-focused.svg',
  'assets/checkbox-off.svg',
  'assets/checkbox.svg',
  'assets/close.svg',
  'assets/close-window-active.svg',
  'assets/close-window-hover.svg',
  'assets/close-window.svg',
  'assets/corner-ripple-ltr.png',
  'assets/corner-ripple-rtl.png',
  'assets/dash-placeholder.svg',
  'assets/filter-selected-ltr.svg',
  'assets/filter-selected-rtl.svg',
  'assets/key-enter.svg',
  'assets/key-hide.svg',
  'assets/key-layout.svg',
  'assets/key-shift.svg',
  'assets/key-shift-latched-uppercase.svg',
  'assets/key-shift-uppercase.svg',
  'assets/logged-in-indicator.svg',
  'assets/message-indicator-symbolic.svg',
  'assets/no-events.svg',
  'assets/noise-texture.png',
  'assets/no-notifications.svg',
  'assets/page-indicator-active.svg',
  'assets/page-indicator-checked.svg',
  'assets/page-indicator-hover.svg',
  'assets/page-indicator-inactive.svg',
  'assets/process-working.svg',
  'assets/running-indicator.svg',
  'assets/source-button-border.svg',
  'assets/summary-counter.svg',
  'assets/toggle-off.svg',
  'assets/toggle-on.svg',
  'assets/ws-switch-arrow-down.png',
  'assets/ws-switch-arrow-up.png',
]

# destination directory
install_dir = shell_dir

# generate .css files
foreach f : theme_files
    theme_sources += [f + '.scss']
endforeach
theme_sources = files(theme_sources)
foreach f : theme_files
    custom_target('generate_' + f,
        input: f + '.scss',
        output: f + '.css',
        depend_files: theme_sources,
        command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
        build_by_default: true,
        install: true,
        install_dir: install_dir,
    )
endforeach

# install static data files
install_data(data_sources, install_dir: install_dir)
install_data(assets_sources, install_dir: shell_asset_dir)
