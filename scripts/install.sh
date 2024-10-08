#!/usr/bin/env bash
set -eu
export LC_ALL=C

# Step 4: Put the new configuration files in place to be ready to start
function install_config {

    mkdir -p ${PRINTER_CONFIG_PATH}
    
    for dir in parts macros moonraker ; do
        ln -fsn ${CONFIG_PATH}/$dir ${PRINTER_CONFIG_PATH}/$dir
    done

    for config in crowsnest.conf; do
        ln -fsn ${CONFIG_PATH}/$config ${PRINTER_CONFIG_PATH}/$config
    done

    for config in printer.cfg moonraker.conf; do
        cp ${CONFIG_PATH}/$config ${PRINTER_CONFIG_PATH}/$config
    done

    chmod +x ${CONFIG_PATH}/install.sh
}


function restart_klipper {
    echo "[POST-INSTALL] Restarting Klipper..."
    sudo systemctl restart klipper
}
