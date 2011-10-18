#!/bin/bash -ex
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
#   Kohsuke Kawaguchi, Jamie Whitehouse
# 
#------------------------------------------------------------------------------

if [ -z "$1" ]; then
  echo "Usage: build.sh path/to/hudson.war"
  exit 1
fi

cp "$1" hudson.war

exec debuild -us -uc -B
