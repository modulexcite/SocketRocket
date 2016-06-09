#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE-examples file in the root directory of this source tree.
#

VIRTUALENV_PATH=$1
VIRTUALENV_VERSION=15.0.1

if [ -d "$VIRTUALENV_PATH" ]; then 
	echo "Virtual Env already installed"
else
  mkdir $VIRTUALENV_PATH

  pushd $VIRTUALENV_PATH  
  
  curl -L -o virtualenv.tar.gz https://pypi.python.org/packages/source/v/virtualenv/virtualenv-$VIRTUALENV_VERSION.tar.gz
  tar xvfz virtualenv.tar.gz
  
  pushd virtualenv-$VIRTUALENV_VERSION
  python setup.py install --user
  popd
  
  popd

  python $VIRTUALENV_PATH/virtualenv-$VIRTUALENV_VERSION/virtualenv.py $VIRTUALENV_PATH

  source $VIRTUALENV_PATH/bin/activate
  which python
  
  pip install wheel
  pip install setuptools --upgrade
	pip install autobahntestsuite
fi
