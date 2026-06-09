#!/bin/bash
# Extended temporary tools setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/temp-tools-extra" 'Python-3.13.7.tar.xz' 'perl-5.42.0.tar.xz' \
    || { echo "temp-tools-extra paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "temp-tools-extra.sh"
