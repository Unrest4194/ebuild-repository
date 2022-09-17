# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Known bugs: KillSwitch does not work

EAPI=8

DESCRIPTION="Proton VPN Network Manager (NM) library"
HOMEPAGE=""
SRC_URI="https://github.com/ProtonVPN/protonvpn-nm-lib/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
# Minimum versions set to the latest stable version on the gentoo repository at the time of creating the ebuild.
# Chances are it will work with older versions.
RDEPEND="${DEPEND} >=dev-python/pyxdg-0.28 >=net-vpn/networkmanager-openvpn-1.8.18"
BDEPEND=""

PATCHES=(
	${FILESDIR}/${P}-desystemdize-subprocess-wrapper.patch
)

src_compile() {
	:
}

src_install() {
	mkdir -p $D/usr/lib/python3.10/site-packages/
	cp -r $S/protonvpn_nm_lib $D/usr/lib/python3.10/site-packages/
	assert
	mkdir -p $D/usr/bin
	cp $FILESDIR/protonvpn-daemon-reconnector $D/usr/bin/
	assert
}
