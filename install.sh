python2 -m pip install --user --upgrade setuptools pycodestyle pylint flask nose
python2 -m pip install virtualenv
cd subdir
DIR=`pwd`
cd
sudo virtualenv -p `which python2` py2
cd py2/
source bin/activate
which python
which python2
python --version
cd $DIR
bash -x runtests.sh
