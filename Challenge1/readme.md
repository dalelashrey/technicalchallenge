


## Solution Overview
The infrastructure deployed whing the defined configuration can be seen as in the picture below. It is a **bare minimum** 3-Tier Architecture

![Arch](https://github.com/dalelashrey/technicalchallenge/blob/main/Challenge1/Untitled.png)

* Tier 1 is the front-end tier installed with IIS.
* Tier 2 is the Business or middleware tier.
* Tire 3 is our Data Tier containing databases.
* We have and additional Management containing a Azure Bastion host connected to a VM to manage configurations on the VM on each tier.
* Standard load balancers have been configured between each layer.
* Only Front-End load balancer and the Bastion Host are exposed to the internet using public IP.
* By placing VMs across zones, the application becomes resilient to failures within a zone.
* SQL Server in the data tier is in Always on Availability Group.
* NSGs have been configured on each layer with minimum exposer to only the services that too present on the Load balancer backend pool.
* Probes have been configured on the LBs for their respective services.
* Configuration on all the nodes is managed using Powershell DSC from bastion host on WinRM

&nbsp;
&nbsp;
&nbsp;

## 
Apart from the scope of the challance to deploy a basic 3-Tier solution, we can also for more fuller and complex architectural approach like below.
## Global N-tire Application Architecture
![Regional](https://github.com/ShreyDalela/CodeChallenge/blob/e3417878ece5f20a4bd90312ecd6e924fb0be6a9/Challenge-1/Regional.png)
