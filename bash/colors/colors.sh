#!/bin/bash
# {{{ Documentation
# Note: the code values are range based. Each rang maps to a different attribute. 
# Depending on the range the value falls in that attribute is affected.
# Order, therefore, does not matter, only the values and the attribute it impacts does.
#
# Text formatting
# ===============
# 0 - normal
# 1 - bold
# 4 - underline
#
# Forgeground colors
# ==================
# 30 - black
# 31 - red
# 32 - green
# 33 - yellow
# 34 - blue
# 35 - purple
# 36 - cyan
# 37 - white
#
# Background colors
# =================
# 40 - black
# 41 - red
# 42 - green
# 43 - yellow
# 44 - blue
# 45 - purple
# 46 - cyan
# 47 - white
# }}}

export LABEL="yellow(33)foreground on red(41) background with underline(4)"
echo "\\033[33;41;4m\${LABEL}\\033[0m"
echo -e "\\033[33;41;4m${LABEL}\\033[0m"
echo -e "\\033[41;33;4m${LABEL}\\033[0m"
