echo "---[ Adding mongodb repository ]---"

cat > /etc/yum.repos.d/mongodb-org-3.0.repo << EOF
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
EOF
