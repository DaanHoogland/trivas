
echo -e "#### System Information ####"
echo -e "\nO.S. information:"
echo $(uname -a)

echo -e "\nWho am I:"
whoami

echo -e "\nJava Version: "
javac -version

echo -e "\nMaven Version: "
mvn -v

echo -e "\nPython Version: "
python --version

echo -e "\nPip Version: "
pip --version

echo -e "\nDisk Status: "
df

echo -e "\nMemory Status: "
free

echo -e "\nTotal CPUs: "
nproc

echo -e "\nCheck Git status"
git status


echo -e "\nCleaning up stale files in /tmp: "
sudo find /tmp -type f -mtime +2 | grep -v "`sudo lsof | grep /tmp |awk '{print $9}'|sed -e '1 d' |sort |uniq | tr \\n \|`" | xargs sudo rm -vf

echo -e "\nUpdating the system: "
sudo apt-get -y clean
sudo apt-get -y update > /dev/null

sudo apt-get -y install python2

echo -e "\nUpgrading PIP if necessary: "
python2 -m pip install --upgrade pip
python2 -m pip --version

python2 -m pip install --user --upgrade urllib3 lxml paramiko nose texttable ipmisim pyopenssl pycrypto mock flask netaddr pylint pycodestyle six astroid >> /tmp/piplog

echo $(python2 -m pip freeze)
