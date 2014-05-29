# to completely remove homebrew (to get a fresh star)
# 1. run the script at https://gist.github.com/mxcl/1173223
# 2. After that, run the following command:
#       rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# verify everything is ok
brew doctor

# python and related stuff
brew install python --with-brewed-openssl

# add homebrew path to your .bash_profile. E.g.
echo 'export PATH=/usr/local/bin:/usr/local/sbin:$PATH' >> ~/.bash_profile

# apply changes to the path
source ~/.bash_profile

# Check you are using the right python
which python
# should get /usr/local/bin/python (or something like that)

# and check python version (just to be sure)
python --version


# upgrade pip and setuptools
pip install --upgrade --no-use-wheel pip
pip install --upgrade --no-use-wheel setuptools

# verify pip is working ok
pip --version


# always useful
pip install virtualenv


# this will install the fortran compiler, that will be needed to install compatible numpy and scipy
brew install gcc

# numpy
pip install numpy

# and scipy
pip install scipy



# prepare for matplotlib
brew install freetype
# seems freetype can't be found on some systems otherwise:
ln -s /usr/local/include/freetype2 /usr/local/include/freetype


brew install imagemagick graphviz
pip install pillow
# install XQuartx from https://xquartz.macosforge.org/landing/
brew install cairo --without-x
brew install py2cairo # this will ask you to download xquartz and install it
brew install qt pyqt

# and finally
pip install matplotlib

# in the previous step, in my case matplotlib was compiled using /opt/X11/include/libpng instead
# of the brewed one, which lead to run time crashing when using matplotlib in "ipython qtconsole".
# to solve the issue, I did "pip uninstall matplotlib" and then followed the instructions at
# http://stackoverflow.com/questions/22898245/libpng-version-incompatibility-in-fresh-installation-of-ipython


# IPython and stuff
brew install zmq
pip install ipython[zmq,qtconsole,notebook,test]
