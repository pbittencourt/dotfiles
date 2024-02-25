from palette import *

config.load_autoconfig()

c.tabs.position = 'top'
c.fonts.default_family = 'JetBrainsMono Nerd Font'

c.colors.tabs.bar.bg = background
c.colors.tabs.even.bg = background
c.colors.tabs.even.fg = foreground
c.colors.tabs.odd.bg = background
c.colors.tabs.odd.fg = foreground
c.colors.tabs.indicator.error = color1
c.colors.tabs.indicator.start = color4
c.colors.tabs.pinned.even.bg = color5
c.colors.tabs.selected.even.bg = color3
c.colors.tabs.selected.even.fg = background
c.colors.tabs.selected.odd.bg = color3
c.colors.tabs.selected.odd.fg = background

c.colors.statusbar.caret.bg = color5
c.colors.statusbar.caret.fg = foreground
c.colors.statusbar.caret.selection.fg = foreground
c.colors.statusbar.command.bg = background
c.colors.statusbar.command.fg = foreground
c.colors.statusbar.command.private.fg = foreground
c.colors.statusbar.insert.bg = color2
c.colors.statusbar.insert.fg = background
c.colors.statusbar.normal.bg = background
c.colors.statusbar.normal.fg = foreground
c.colors.statusbar.private.fg = color5
c.colors.statusbar.progress.bg = color2
c.colors.statusbar.url.error.fg = color1
c.colors.statusbar.url.fg = color3
c.colors.statusbar.url.hover.fg = color4
c.colors.statusbar.url.success.http.fg = color6
c.colors.statusbar.url.success.https.fg = color2
c.colors.statusbar.url.warn.fg = color1

c.colors.webpage.darkmode.algorithm = darkmode_algorithm
c.colors.webpage.darkmode.contrast = darkmode_contrast
c.colors.webpage.darkmode.enabled = darkmode_enabled
c.colors.webpage.darkmode.policy.images = 'smart-simple'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.threshold.foreground = 100
c.colors.webpage.preferred_color_scheme = preferred_color_scheme
#c.content.user_stylesheets = '~/.config/qutebrowser/stylesheets/everdark.css'

c.colors.downloads.bar.bg = background
c.colors.downloads.error.bg = color1
c.colors.downloads.error.fg = background
c.colors.downloads.start.bg = color3
c.colors.downloads.start.fg = background
c.colors.downloads.stop.bg = color2
c.colors.downloads.stop.fg = background

# open links with mpv
config.bind(';m', 'hint links spawn --verbose --detach mpvyt {hint-url}')

# download images
config.bind(';i', 'hint images download')
