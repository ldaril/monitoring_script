#!/bin/bash

# Load 
source ./simple_curses.sh
source ./bash_styles.sh

function get_os_info() {
    echo -e "  Hostname: $(hostname)"
    echo -e "  Distribution: $(lsb_release -s -d)"
    echo -e "  Architecture: $(uname -m)"
    echo -e "  Kernel: $(uname -r)"
}

function get_system_info() {
    echo "System Load: $(awk '{printf "%.1f\n", $1}' /proc/loadavg)"
    echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5 " of " $2}')"
    echo "Memory Usage: $(free | awk '/Mem:/ {printf "%.0f%%\n", ($3-$6-$7)/$2 * 100}')"
    echo "Processes: $(ps -e | wc -l)"
    echo "Users logged in: $(who | wc -l)"
}

function get_available_updates() {
    if type apt >/dev/null 2>&1; then
        echo "$(apt list --upgradable 2>/dev/null)"
    else
        echo "Update system not detected."
    fi
}

function get_network_info() {
    # Check internet connectivity
    INTERNET_CONNECTION="Internet connection"
    ping -c 1 google.com &> /dev/null && echo -e "  ${BOLD}$INTERNET_CONNECTION${RESET}:" "${BOLD_GREEN}Connected${RESET}" || echo -e "  ${BOLD}$INTERNET_CONNECTION${RESET}:" "${BOLD_RED}Disconnected${RESET}"
    echo -e "  ${BOLD}Public IP${RESET}: $(curl -s ipecho.net/plain;echo)"
    echo ""

    # Interfaces & IP addresses
    echo -e "  ${BOLD_YELLOW}Interfaces${RESET}"
    # Loop through each line of ip command output
    # There is one line by interface
    ip -brief addr | while read -r line; 
    do
        # Extract interface name and IP address from the line
        interface=$(echo "$line" | awk '{print $1}')
        ip=$(echo "$line" | awk '{print $3}')
        echo -e "  $interface: $ip"
    done
}


main() {
    # General information
    window "  :: Monitoring script :: $(date '+%d-%m-%Y %H:%M:%S') ::  " "yellow"
    endwin

    window "OS Information" "yellow" "50%"
    append "$(get_os_info)" "left"
    endwin

    col_right
    window "Network" "yellow" "50%"
    append "$(get_network_info)" "left"
    endwin

    move_up 
    window "System Information" "yellow" "100%"
    append "$(get_system_info)" "left"
    endwin

    window "Available Updates" "yellow" "100%"
    append "$(get_available_updates)" "left"
    endwin


}

# Start the main loop, update every second
main_loop -t 1