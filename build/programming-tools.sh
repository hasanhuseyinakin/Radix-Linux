#!/bin/bash
# Programming tools setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/programming-tools" 'cmake-4.1.0.tar.gz' \
    || { echo "programming-tools paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "programming-tools.sh"
