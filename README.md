Breif Description about what I have done:


1) Using AWS or another cloud provider, create and deploy a running instance of an LDAP server using a configuration management tool.

  Solution: Here I used Digitalocean as cloud provider and setup puppet-master & agent on the servers (I have provided you with two nodes with their respective credentials). For setup details check the how to setup puppet documentation for solutions. For the LDAP, the choice with OpenLDAP, check the OpenLDAP setup document for solution on setup
  
2) In the created instance, add a group named “techops_dba” to /etc/security/access.conf and /etc/sudoers. This may be done before or after the instance starts. 

  solution: “groupadd techops_dba” the command should be executed on the master node of puppet
  
3) What is the NTP stratum of the created host? What is an acceptable load average threshold for the host?

  Solution: It is in the puppet-master-install.sh & puppet-agent-install.sh scripts: sudo ntpdate pool.ntp.org && sudo apt-get update && sudo apt-get -y install ntp
  
4) Instantiate a second host and implement security so that clients are only able to access the first host from the second host. Use SSH for connectivity. This is commonly referred to as a “jump box” configuration. 

 Solution: Basically is to copy the ssh key id of one server to another from master to agent and agent to master, there is the command for example: run this command on master server “ssh-copy-id root@agent-ip”, this will ask for password of agent, you end the password and the ssh id of master is now copied into agent. ssh into agent and do something “ssh-copy-id root@master-ip” this will ask for password of master, you end the password and the ssh id of agent is now copied into master.
 
5)Develop and apply automated tests to verify correctness of the LDAP server of step 1, the configuration of step 2, the results of the NTP findings of step 3, and the security restrictions of step 4. 

 Solution: If you go through the process of setting up LDAP and installation all the packages, you being able to access it means, you deployed it correctly. The results of the NTP findings of step 3, is about keeping the time sync between the puppet-master & puppet-agent. Network Time Protocol (NTP) that’s the function.  If it is not in sync across the nodes, there will be issues with connectivity and sending commands to the agents from master node. Using a tool like bind “BIND is open source software that implements the Domain Name System (DNS) protocols for the Internet.” we can use it to hide the second host (the agent). such that it isn’t available to the public, but from the first one it has an ssh connectivity from first host to second, this is done can specifying on a bind configuration that second can only be accessible from first via ssh connectivity with specific credentials after doing such configuration the second host is only available via to the first host and not to the public this is how you somehow build hidden internal networks of servers that only speak to some particular servers to outside some similar concept to VPN.
