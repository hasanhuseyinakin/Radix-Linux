#!/bin/bash
# Networking libraries setup stage for Radix Linux.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
radix_require_tarballs "$ROOT/network-libraries" 'curl-8.15.0.tar.gz' \
    || { echo "network-libraries paketleri eksik" >&2; exit 1; }
radix_build_not_implemented "network-libraries.sh"
