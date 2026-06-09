#!/bin/bash
# File management tools setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/file-management" 'fuse-3.17.4.tar.gz' 'LVM2.2.03.34.tgz' \
    || { echo "file-management paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "file-management.sh"
