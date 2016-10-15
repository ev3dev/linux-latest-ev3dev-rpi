#!/bin/bash
#
# Maintainer script for publishing releases.

set -e

source=$(dpkg-parsechangelog -S Source)
version=$(dpkg-parsechangelog -S Version)

OS=raspbian DIST=jessie ARCH=armhf pbuilder-ev3dev build
debsign ~/pbuilder-ev3dev/raspbian/jessie-armhf/${source}_${version}_armhf.changes
dput ev3dev-raspbian ~/pbuilder-ev3dev/raspbian/jessie-armhf/${source}_${version}_armhf.changes

gbp buildpackage --git-tag-only