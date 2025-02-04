#!/bin/bash
set -euo pipefail
trap 'echo "Error: Command failed at line $LINENO." >&2' ERR

CURRENT_DIR=$(pwd)
CURRENT_SHELL=$(echo $SHELL)

log_info() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1" >&2
}

if [[ -f "main.sh" ]]; then
    log_info "Applying chmod to main.sh..."
    if chown "$(whoami):$(whoami)" main.sh; then
        log_info "Ownership successfully changed for main.sh."
    else
        log_error "Failed to change ownership for main.sh."
    fi

    if chmod a+rwx main.sh; then
        log_info "Permissions successfully changed for main.sh."
    else
        log_error "Failed to change permissions for main.sh."
    fi
else
    log_error "main.sh not found."
fi

for file in $CURRENT_DIR/scripts/*.sh; do
    if [[ -f "$file" ]]; then
        log_info "Applying chmod to $file..."
        if chown "$(whoami):$(whoami)" "$file"; then
            log_info "Ownership changed for $file."
        else
            log_error "Failed to change ownership for $file."
        fi

        if chmod a+rwx "$file"; then
            log_info "Permissions changed for $file."
        else
            log_error "Failed to change permissions for $file."
        fi
    else
        log_error "File $file not found."
    fi
done

log_info "All .sh files processed."

log_info "exports environment variables"
log_info "Current shell: $CURRENT_SHELL"

echo "export CURRENT_DIR=${CURRENT_DIR}" >>~/.bashrc
echo "export CURRENT_DIR=${CURRENT_SHELL}" >>~/.zshrc
log_info "Added $CURRENT_DIR to ~/.bashrc"

export CURRENT_DIR=$CURRENT_DIR
echo "suceessfully exported CURRENT_DIR"
echo "Current directory: $CURRENT_DIR"
