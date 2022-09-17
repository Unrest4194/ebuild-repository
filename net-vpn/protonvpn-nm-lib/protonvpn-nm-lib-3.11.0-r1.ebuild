# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Known bugs: 
#	- Reconnection daemon does not reconnect after resuming from sleep (there's a log saying virtual device proton0 is being monitored, but querying status yields no connection)
#	- KillSwitch does not work

EAPI=8

PYTHON_COMPAT=( python3_10 )

inherit distutils-r1

DESCRIPTION="Proton VPN Network Manager (NM) library"
HOMEPAGE=""
SRC_URI="https://github.com/ProtonVPN/protonvpn-nm-lib/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
# Minimum versions set to the latest stable version on the gentoo repository at the time of creating the ebuild.
# Chances are it will work with older versions.
RDEPEND="${DEPEND}
	>=dev-python/pyxdg-0.28
	>=net-vpn/networkmanager-openvpn-1.8.18"
BDEPEND=""

src_install() {
	distutils-r1_src_install
	exeinto /usr/bin/${PN}
	doexe $FILESDIR/systemctl
}
