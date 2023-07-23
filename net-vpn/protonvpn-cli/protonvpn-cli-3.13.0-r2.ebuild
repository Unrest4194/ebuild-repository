# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_11 )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="ProtonVPN CLI client"
HOMEPAGE="https://none.com"
SRC_URI="https://github.com/ProtonVPN/linux-cli/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=net-vpn/protonvpn-nm-lib-${PV}
	>=dev-python/pythondialog-3.5.3"
BDEPEND=""

src_unpack() {
	default
	mv $WORKDIR/linux-cli-$PV $S
	assert "Failed to rename unpacked sources directory."
}

src_install() {
	distutils-r1_src_install
	dobin $FILESDIR/protonvpn-cli
}

