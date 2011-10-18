#!/bin/bash -e
#------------------------------------------------------------------------------
#
# Copyright (c) 2010-2009, Oracle Corporation
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors: 
#
#   Kohsuke Kawaguchi 
# 
#------------------------------------------------------------------------------

if [ -z "$1" ]; then
  echo "Usage: build.sh path/to/hudson.war"
  exit 1
fi

sudo apt-get install -y rpm expect || true

# figure out the version to package
cp "$1" $(dirname $0)/SOURCES/hudson.war
pushd $(dirname $0)
version=$(unzip -p SOURCES/hudson.war META-INF/MANIFEST.MF | grep Implementation-Version | cut -d ' ' -f2 | tr - .)
echo Version is $version

# prepare fresh directories
rm -rf BUILD RPMS SRPMS tmp || true
mkdir -p BUILD RPMS SRPMS

# real action happens here
rpmbuild -ba --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="ver $version" SPECS/hudson.spec
