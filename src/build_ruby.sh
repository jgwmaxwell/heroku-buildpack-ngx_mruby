#!/bin/bash

set -e pipefail

echo "Installing ruby-build for building ruby"
git clone https://github.com/sstephenson/ruby-build.git
cd ruby-build
PREFIX=/app/rbuild ./install.sh
cd -

echo "Installing Ruby"
CONFIGURE_OPTS="--disable-install-rdoc" /app/rbuild/bin/ruby-build -v 2.2.2 /app/ruby

echo "Exporting variables"
export PATH=/app/ruby/bin:$PATH
export GEM_HOME=/app/gems

echo "Installing rake"
gem install rake

export PATH=/app/gems/bin:$PATH
