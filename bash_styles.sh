#!/bin/bash

# Example usage

# echo "${BOLD_RED}This is bold and red.${RESET}"

# COLOR needs to be before UNDERLINE
# echo "${CYAN}${UNDERLINE}This is underlined and cyan.${RESET}"

# COLOR needs to be before background
# echo "${BLACK}${BACKGROUND_GREEN}This is white text on a green background.${RESET}"


# Reset
RESET="\e[0m"

# Regular Colors
BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
MAGENTA="\e[0;35m"
CYAN="\e[0;36m"
WHITE="\e[0;37m"

# Bold
BOLD="\e[1m"
BOLD_BLACK="\e[1;30m"
BOLD_RED="\e[1;31m"
BOLD_GREEN="\e[1;32m"
BOLD_YELLOW="\e[1;33m"
BOLD_BLUE="\e[1;34m"
BOLD_MAGENTA="\e[1;35m"
BOLD_CYAN="\e[1;36m"
BOLD_WHITE="\e[1;37m"

# Underline
UNDERLINE="\e[4m"

# Background
BACKGROUND_BLACK="\e[40m"
BACKGROUND_RED="\e[41m"
BACKGROUND_GREEN="\e[42m"
BACKGROUND_YELLOW="\e[43m"
BACKGROUND_BLUE="\e[44m"
BACKGROUND_MAGENTA="\e[45m"
BACKGROUND_CYAN="\e[46m"
BACKGROUND_WHITE="\e[47m"