#!/bin/bash
# Kernel stage: verify shipped vmlinuz and require matching source.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VMLINUZ="$ROOT/kernel-linux/vmlinuz-6.16.1-radix"
CHECKSUM="$ROOT/kernel-linux/vmlinuz-6.16.1-radix.sha256"
SOURCE="$ROOT/kernel-linux/linux-6.16.1.tar.xz"

if [[ ! -f "$VMLINUZ" ]]; then
    echo "vmlinuz bulunamadi: $VMLINUZ" >&2
    exit 1
fi

if [[ ! -f "$CHECKSUM" ]]; then
    echo "checksum dosyasi yok, binary'ye kör güven olmaz" >&2
    exit 1
fi

if command -v sha256sum >/dev/null 2>&1; then
    (cd "$ROOT/kernel-linux" && sha256sum -c "vmlinuz-6.16.1-radix.sha256")
elif command -v shasum >/dev/null 2>&1; then
    read -r expected _ < "$CHECKSUM"
    actual="$(shasum -a 256 "$VMLINUZ" | awk '{print $1}')"
    if [[ "$expected" != "$actual" ]]; then
        echo "vmlinuz hash tutmuyor, birisi binary ile oynamis olabilir" >&2
        exit 1
    fi
else
    echo "sha256sum/shasum yok, checksum dogrulanamadi" >&2
    exit 1
fi

if [[ ! -f "$SOURCE" ]]; then
    echo "Binary dogru ama kernel kaynagi yok — GPL tarafi eksik." >&2
    echo "Calistir: ./build/fetch-kernel-source.sh" >&2
    exit 2
fi

echo "vmlinuz checksum OK, kernel kaynagi da yerinde. Derleme otomasyonu hala geliyor."
