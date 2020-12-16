# Welcome to DevOps with Github - HandsonLabs

**Prequisite(Mandate)**
1. Github Personal Account
2. Azure Subscription


Before Getting on to Hands on Labs, Lets us do Walkthrough Basic Terminology of Workflow. 

**[Reference 1 : Workflow Syntax for Github Actions ](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions)**



**Reference 2 : Connecting to Azure**

Service Principal is used to Authenticate and perform task on Azure subscription.
Here is command line reference to create one service principal for you

**If you already have created Resource group, following this**

az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} --sdk-auth

**Giving access to Complete Subscription**
az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/{subscription-id} --sdk-auth

Output of this will be similar 

  {
    "clientId": "<GUID>",
  
    "clientSecret": "<GUID>",
    
    "subscriptionId": "<GUID>",
    
    "tenantId": "<GUID>",
    
    (...)
    
  }

Copy Complete Parenthesis , This will be our First Github Secret !

