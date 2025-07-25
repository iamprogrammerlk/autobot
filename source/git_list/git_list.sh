#!/bin/bash

clear

# bash debug on
set -euo pipefail

export APP_NAME="GIT List"
export APP_SLUG="git_list"
export APP_VERSION="1.0.0"
export APP_ROOT=$(pwd)
export APP_HOME=$HOME/.config/$APP_SLUG

declare -A app_configuration=(
  ["app_url"]="https://github.com/iamprogrammerlk/autobot"
  ["app_license"]="MIT license"
  ["app_license_url"]="https://github.com/iamprogrammerlk/autobot?tab=MIT-1-ov-file"
  ["app_author"]="I am Programmer"
  ["app_author_url"]="https://iamprogrammer.lk"
)

cd $HOME
if [ ! -d "$APP_HOME" ]; then
  mkdir "$APP_HOME"
fi

if [ ! -f "$APP_ROOT/../library/utility.sh" ]; then
  echo "Runtime Error : '/library/utility.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/../library/utility.sh

if [ ! -f "$APP_ROOT/../library/style.sh" ]; then
  echo "Runtime Error : '/library/style.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/../library/style.sh

if [ ! -f "$APP_ROOT/../library/ui.sh" ]; then
  echo "Runtime Error : '/library/ui.sh' is require to run '$APP_NAME'." >&2
  echo ""
  exit 1
fi
. $APP_ROOT/../library/ui.sh

# show_app_header ------------------------------------------------------------------------------------------------------
show_app_header()
{
  declare -a header_title=(
    "style_foreground_blue"
    "ui_message_box_text_align_center"
    "$APP_NAME v$APP_VERSION"
  )
  ui_message_box "${header_title[@]}"
}

# show_app_footer ------------------------------------------------------------------------------------------------------
show_app_footer()
{
  declare -a footer_title=(
    "style_foreground_blue"
    "ui_message_box_text_align_center"
    "Thank you!"
    "ui_message_box_text_align_left"
    "   Developer : ${app_configuration["app_author"]} [${app_configuration["app_author_url"]}]"
    "     License : ${app_configuration["app_license"]} [${app_configuration["app_license_url"]}]"
    "     Version : $APP_VERSION"
  )
  ui_message_box "${footer_title[@]}"
}

show_app_header
empty_line



show_app_footer
empty_line
