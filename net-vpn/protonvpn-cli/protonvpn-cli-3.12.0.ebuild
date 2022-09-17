# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )

inherit distutils-r1

DESCRIPTION="ProtonVPN CLI client"
HOMEPAGE="https://none.com"
SRC_URI="https://github.com/ProtonVPN/linux-cli/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
# Minimum versions set to the latest stable version on the gentoo repository at the time of creating the ebuild.
# Chances are it will work with older versions.
RDEPEND="${DEPEND}
	>=net-vpn/protonvpn-nm-lib-3.11.0
	>=app-misc/proton-python-client-0.7.1"
BDEPEND=">=dev-python/pythondialog-3.5.3"

src_unpack() {
	default
	mv $WORKDIR/linux-cli-$PV $S
	assert "Failed to rename unpacked sources directory."
}

src_install() {
	distutils-r1_src_install
	dobin $FILESDIR/protonvpn-cli
}

