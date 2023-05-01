# Solution - Techinical Challenge
# CodeChallenge


### Challenge #1
---

A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources on a cloud environment (Azure/AWS/GCP).  
 
 ### Solution -
 
Solution for this challenge is in the readme of Challenge1 folder
 
 
### Challenge #2
---

We need to write code that will query the meta data of an instance within AWS or Azure or GCP and provide a json formatted output.
The code allows for a particular data key to be retrieved individually

 ### Solution -
 
  Download Challenge2.ps1 and run it with powershell, prompts will guide you through the steps. Inputs VM name/RG/subcriptionid/data key(optional)
  
```
  #With data key 
  Enter Subscription ID: 291bba3f-e0a5-47bc-a099-3bdcb2a50a05
  Enter the name of the VM: rhel-host
  Enter the data key to retrieve (or press enter to skip): network

  #With data key 
  Enter Subscription ID: 291bba3f-e0a5-47bc-a099-3bdcb2a50a05
  Enter the name of the VM: rhel-host
  Enter the data key to retrieve (or press enter to skip): 
```
 
### Challenge #3
---

We have a nested object. We would like a function where you pass in the object and a key and get back the value.

Example Inputs
object = {“a”:{“b”:{“c”:”d”}}}
key = a/b/c
object = {“x”:{“y”:{“z”:”a”}}}
key = x/y/z
value = a

 ### Solution -

Download Challenge3.ps1 and run it with powershell.


# Example usage
>        $obj1 = @{a = @{b = @{c = 'd'}}}
>        $key1 = 'a/c/c'
>        
>        $obj2 = @{x = @{y = @{z = 'a'}}}
>        $key2 = 'x/y/z'
>        
>        $value1 = Get-Value -object $obj1 -key $key1
>        $value2 = Get-Value -object $obj2 -key $key2
>        
>        Write-Output "Value 1: $value1"
>        Write-Output "Value 2: $value2"

