#!/bin/bash
# Graphics libraries setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/graphic-libraries" 'freetype-2.13.3.tar.xz' \
    || { echo "graphic-libraries paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "graphic-libraries.sh"
