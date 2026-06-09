#!/bin/bash
# Bootloader installation stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/bootloader" 'grub-2.12.tar.xz' \
    || { echo "bootloader paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "bootloader.sh"
