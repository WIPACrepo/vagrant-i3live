echo "---[ Installing required system libraries ]---"

sudo yum install -y wget man zeromq3 zeromq3-devel python-zmq gcc gcc-c++ git diffutils blas-devel lapack-devel mysql mysql-server mysql-devel libxml2 libxml2-devel libxslt libxslt-devel mongodb-org python-virtualenv python-zmq memcached redis


echo "---[ Starting DB/cache servers ]---"

sudo service mongod start
sudo service mysqld start
sudo service redis start


echo "---[ Make sure redis starts at boot time ]---"

sudo chkconfig redis on


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
pip install Django==1.6.11 MySQL-python South argparse colorama fabric lxml nose numpy==1.9.2 ordereddict pep8==0.6.1 pyephem pycrypto pymongo==2.7.2 python-twitter conttest toolz python-memcached scipy==0.14.0 django_redis==3.8
EOF
