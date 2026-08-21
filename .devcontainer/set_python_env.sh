#!/usr/bin/env bash

# command line arguments, expect environment name and user name to setup in this script
PYTHON_ENV=$1
USERNAME=$2

# create python virtual environment and set path to use
python3 -m venv /opt/$PYTHON_ENV  
export PATH=/opt/$PYTHON_ENV/bin:$PATH

# update root and user bashrc files to correctly setup environment on reboots
# this is run as root, so first update root bashrc environment settings
cat >> /root/.bashrc << EOF

# the virtual environment used for this assignment
PYTHON_ENV=$PYTHON_ENV
EOF

cat >> /root/.bashrc <<'EOF'

# search for nvidia libraries and add to LD_LIBRARY_PATH if
# nvidia / cuda support is installed
# see: https://dev.to/metal3d/how-to-resolve-the-dlopen-problem-with-nvidia-and-pytorch-or-tensorflow-inside-a-virtual-env-181e
LIBS=$(find /opt/$PYTHON_ENV -name "*.so*" | grep nvidia)
if [ -n "$LIBS" ];
then
  export LD_LIBRARY_PATH=$(echo $LIBS | xargs dirname | sort -u | paste -d ":" -s -)
fi

# activate the default virtual environment for assignments
source /opt/$PYTHON_ENV/bin/activate

EOF

# do for the normal user, this is duplicate setup, is there a way to specify a heredoc without repeating like this?
cat >> /home/$USERNAME/.bashrc << EOF

alias ll='ls -alh'
alias smake='snakemake -c 1'

# the virtual environment used for this assignment
PYTHON_ENV=$PYTHON_ENV
EOF

cat >> /home/$USERNAME/.bashrc <<'EOF'

# search for nvidia libraries and add to LD_LIBRARY_PATH if
# nvidia / cuda support is installed
# see: https://dev.to/metal3d/how-to-resolve-the-dlopen-problem-with-nvidia-and-pytorch-or-tensorflow-inside-a-virtual-env-181e
LIBS=$(find /opt/$PYTHON_ENV -name "*.so*" | grep nvidia)
if [ -n "$LIBS" ];
then
  export LD_LIBRARY_PATH=$(echo $LIBS | xargs dirname | sort -u | paste -d ":" -s -)
fi

# activate the default virtual environment for assignments
source /opt/$PYTHON_ENV/bin/activate

EOF


# install all required packages into virtual environment specified in requirements.txt
source /opt/$PYTHON_ENV/bin/activate
pip3 install -q -r ./requirements/requirements.txt

# NOTE: official Tensorflow pip install instructions: https://tensorflow.org/install/pip
# mention for GPU in virtual environment configurations you need to setup symbolic links
# like the following.  This removes need to set the  LD_LIBRARY_PATH as we were doing
# first command should create links to all nvidia so shared libraries in the /opt/base/lib/*/tensorflow
# directory
# NOTE: both of these were having problems on tensorflow 2.21.  These basically work to
# add symbolic links into the /opt/base/lib/python*/site-packages/tensorflow directory, but I find that
# I still need to add that directory to the LD_LIBRARY_PATH, so the above solution to just set the
# library path in the bashrc is currently the cleaner way to go
#pushd $(dirname $(python -c 'print(__import__("tensorflow").__file__)'))
#ln -svf ../nvidia/*/lib*/*.so* .
#ln -svf ../nvidia/*/*/lib*/*.so* .
#popd

# then a symbolic link to the ptxas executable in the virtual environment bin
# directory, which may or may not really be needed in our assignment/project cases
#ln -sf $(find $(dirname $(dirname $(python -c "import nvidia.cuda_nvcc; print(nvidia.cuda_nvcc.__file__)"))/*/bin/) -name ptxas -print -quit) $VIRTUAL_ENV/bin/ptxas
#ln -sf $(find $VIRTUAL_ENV -name ptxas -print) $VIRTUAL_ENV/bin/ptxas

# the following are referenced in the Tensorflow documentation as simple ways to verify Tensorflow cpu and
# gpu setup
# verify tensorflow cpu setup works
#python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 100])))"
# verify tensorflow detects gpu device
#python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
