for i in 38 39 40 ; do 
	ssh n10$i 'sudo yum remove -y nvmesh-management mongodb-org* nodejs nodesource-release python-pymongo ; sudo rm -rf /etc/yum.repos.d/mongodb-org-4.2.repo /var/lib/mongo/'  
done
