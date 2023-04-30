
 
## Problem Statement
---


A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources. Please remember we will not be judged on the outcome but more focusing on the approach, style and reproducibility.

&nbsp;
&nbsp;
&nbsp;

---

## Solution Overview
The infrastructure deployed whing the defined configuration can be seen as in the picture below. It is a **bare minimum** 3-Tier Architecture

![Arch](https://github.com/ShreyDalela/CodeChallenge/blob/2dbf5b1574bf0eec97815413b3a789acf9e9bfcc/Challenge-1/Tire.png)

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
