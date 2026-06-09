#!/bin/bash
# Toolchain setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/toolchain-tools" \
    'binutils-2.45.tar.xz' 'gcc-15.2.0.tar.xz' 'glibc-2.42.tar.xz' \
    || { echo "toolchain paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "toolchain.sh"
