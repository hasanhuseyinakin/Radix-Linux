#!/bin/bash
# Security layer: validate archive contents before anyone claims hardening.
# Copyright (C) 2025 Radix Linux contributors
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SECURITY_DIR="$ROOT/security"
errors=0

check_tarball() {
    local pattern="$1"
    if ! compgen -G "${SECURITY_DIR}/${pattern}" > /dev/null; then
        echo "eksik: security/${pattern}" >&2
        errors=1
    fi
}

for pkg in cracklib-2.10.3.tar.xz cryptsetup-2.8.1.tar.xz libcap-2.76.tar.xz \
           make-ca-1.16.1.tar.gz p11-kit-0.25.5.tar.xz; do
    check_tarball "$pkg"
done

missing_tools=(sudo pam openssh iptables nftables audit polkit apparmor selinux)
for tool in "${missing_tools[@]}"; do
    if ! git -C "$ROOT" ls-files | grep -qi "$tool"; then
        echo "uyari: repoda ${tool} kaynagi yok — guvenlik katmani yarim" >&2
    fi
done

if [[ "$errors" -ne 0 ]]; then
    echo "security/ dizini eksik paketlerle dolu degil, once onu halledelim" >&2
    exit 1
fi

echo "security/ tarball'lari tamam. Kurulum/hardening script'i hala yazilacak."
exit 2
