#!/bin/bash
# Shared helpers for Radix Linux build scripts.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

radix_build_not_implemented() {
    local script_name="${1:-${0##*/}}"
    cat >&2 <<EOF
${script_name} henuz yazilmadi.

Upstream paketler repoda duruyor ama otomasyon yok. ISO icin:
  https://github.com/VFL-DEEP/Radix-Linux/releases

Kod yazacaksan PR at, bos scriptle build olmaz zaten.
EOF
    exit 1
}

radix_require_tarballs() {
    local dir="$1"
    shift
    local missing=0
    for name in "$@"; do
        if ! compgen -G "${dir}/${name}" > /dev/null; then
            echo "eksik paket: ${dir}/${name}" >&2
            missing=1
        fi
    done
    return "$missing"
}
