#!/bin/bash
# General libraries setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/general-libraries" 'libarchive-3.8.1.tar.xz' \
    || { echo "general-libraries paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "general-libraries.sh"
