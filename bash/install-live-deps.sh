echo "---[ Installing required system libraries ]---"

sudo yum install -y wget man zeromq3 zeromq3-devel python-zmq gcc gcc-c++ git diffutils blas-devel lapack-devel mysql mysql-server mysql-devel libxml2 libxml2-devel libxslt libxslt-devel mongodb-org python-virtualenv python-zmq memcached


echo "---[ Starting DB servers ]---"

sudo service mongod start
sudo service mysqld start


echo "---[ Make sure MySQL starts at boot time ]---"

sudo chkconfig mysqld on


echo "---[ Create MySQL databases ]---"

/usr/bin/mysql -uroot -e "create database live; grant all on live.* to live@localhost;"
/usr/bin/mysql -uroot -e "create database i3omdb_unittest; grant all on i3omdb_unittest.* to live@localhost;"
/usr/bin/mysql -uroot -e "create database I3OmDb_test; grant all on I3OmDb_test.* to live@localhost;"


echo "---[ Turning off firewall for good ]---"

sudo service iptables stop
sudo chkconfig iptables off


echo "---[ Setting up virtual environment/python modules ]---"

su vagrant <<'EOF'
virtualenv ~/env --system-site-packages
source ~/env/bin/activate
echo "source ~/env/bin/activate" >> ~/.bashrc
pip install Django==1.4 MySQL-python South argparse colorama fabric lxml nose numpy ordereddict pep8==0.6.1 pyephem pycrypto pymongo python-twitter simplejson conttest textile toolz python-memcached scipy
EOF
