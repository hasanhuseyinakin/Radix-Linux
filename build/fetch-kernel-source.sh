#!/bin/bash
# Download the kernel source that matches the shipped vmlinuz.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/kernel-linux/linux-6.16.1.tar.xz"
URL="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.16.1.tar.xz"

if [[ -f "$DEST" ]]; then
    echo "Zaten var: $DEST"
    exit 0
fi

mkdir -p "$ROOT/kernel-linux"

if command -v curl >/dev/null 2>&1; then
    curl -fL "$URL" -o "$DEST"
elif command -v wget >/dev/null 2>&1; then
    wget -O "$DEST" "$URL"
else
    echo "curl ya da wget lazim. Elle indir: $URL" >&2
    exit 1
fi

echo "Indirildi: $DEST"
