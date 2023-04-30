


## Solution Overview
The infrastructure deployed whing the defined configuration can be seen as in the picture below. It is a **bare minimum** 3-Tier Architecture, lot of security/monitoring mechanism can be applied which have not been demonstrated due to the time constraints.

![Arch](https://github.com/dalelashrey/technicalchallenge/blob/main/Challenge1/Untitled.png)

* Tier 1 is the front-end tier whiich are 2 webapps on the same Appservice plan
* Tier 2 is the Business or middleware tier is azure VM and can be accessed through the bastion host.
* Tire 3 is our Data Tier MySQL databases.
* All subnet are secured through NSGs
* Middleware VMs are in availibility zones
* replication can be enabled on Mysql db

* Configuration on all the nodes is managed using Powershell DSC from bastion host on WinRM

&nbsp;
&nbsp;
&nbsp;

