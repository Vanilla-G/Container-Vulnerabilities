# Container-Vulnerabilities
Vulnerabilities we may find in a docker container

1. Misconfigured Containers

a container running in "privileged" mode will have access to the host operating system -   removing the layers of isolation.

2. Vulnerable Images

popular Docker images being backdoored to perform malicious actions

3. Network Connectivity	

A container that is not correctly networked can be exposed to the internet. For example,   a database container for a web application should only be accessible to the web            application container - not the internet.

Additionally, containers can serve to become a method of lateral movement. Once an     attacker has access to a container, they may be able to interact with other containers on the host that are not exposed to the network.


Summary:

You might wonder why containers sometimes operate with privileges that effectively bypass Docker's built-in security mechanisms. While this is not a recommended practice, certain use cases necessitate such configurations. For instance, scenarios like running Docker within Docker, applications that require interaction with the host's iptables (e.g., firewalls), or managing attached devices may demand elevated privileges.

Additionally, there is often a tendency to opt for the "path of least resistance" when determining the permissions to assign to a container. Although Docker has made significant strides in hardening security—such as enabling the use of specific capabilities through an allowlist—it's not uncommon for individuals to grant excessive privileges to ensure functionality without fully understanding the broader security implications.

