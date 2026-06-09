#!/bin/bash
# Temporary tools setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/temp-tools" 'coreutils-9.7.tar.xz' 'bash-5.3.tar.gz' \
    || { echo "temp-tools paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "temp-tools.sh"
