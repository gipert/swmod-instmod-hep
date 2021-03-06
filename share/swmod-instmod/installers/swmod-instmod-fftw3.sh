# Copyright (C) 2015 Oliver Schulz <oliver.schulz@tu-dortmund.de>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.


DEFAULT_BUILD_OPTS="\
--enable-shared \
--enable-threads \
--enable-portable-binary \
"

ARCH=`uname -m`
if [ "${ARCH}" == "x86_64" -o "${ARCH}" == "i686" ] ; then
	DEFAULT_BUILD_OPTS="${DEFAULT_BUILD_OPTS} --enable-sse2"
fi
echo "DEFAULT_BUILD_OPTS=$DEFAULT_BUILD_OPTS"


swi_default_build_opts() {
	echo "${DEFAULT_BUILD_OPTS}"
}

swi_get_download_url () {
	echo "http://www.fftw.org/fftw-${1}.tar.gz"
}

swi_get_version_no() {
	head -n 1 NEWS | grep -o '[0-9.]*'
}

swi_is_version_no() {
	echo "${1}" | grep -q '^[0-9]\+[.][0-9]\+[.][0-9]\+$'
}

