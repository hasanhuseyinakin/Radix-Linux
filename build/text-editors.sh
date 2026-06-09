#!/bin/bash
# Text editors setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/text-editors" 'nano-8.7.1.tar.xz' 'vim-9.1.1629.tar.gz' \
    || { echo "text-editors paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "text-editors.sh"
