# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )

inherit distutils-r1

DESCRIPTION="Proton Python Client"
HOMEPAGE=""
SRC_URI="https://github.com/ProtonMail/proton-python-client/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
# Minimum versions set to the latest stable version on the gentoo repository at the time of creating the ebuild.
# Chances are it will work with older versions.
RDEPEND="${DEPEND}
	>=dev-python/requests-2.16.0
	>=dev-python/python-gnupg-0.4.9
	>=dev-python/pyopenssl-22.0.0
	>=dev-python/bcrypt-3.2.2
	>=dev-python/distro-1.7.0
	>=dev-python/dnspython-2.2.1-r1"
BDEPEND=""

