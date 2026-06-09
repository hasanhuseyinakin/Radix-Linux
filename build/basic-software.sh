#!/bin/bash
# Basic system software setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/base-software" 'systemd-257.8.tar.gz' 'sysvinit-3.14.tar.xz' \
    || { echo "base-software paketleri eksik" >&2; exit 1; }
echo "Uyari: hem systemd hem sysvinit var — birini secmeden kurma." >&2
radix_build_not_implemented "basic-software.sh"
