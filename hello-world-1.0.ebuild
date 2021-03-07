# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hello World"
HOMEPAGE="http://1.2.3.4/"
SRC_URI="http://1.2.3.4/hello-world-1.0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
        dobin hello-world
}

