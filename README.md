# Welcome to DevOps with Github - HandsonLabs

**Prequisite(Mandate)**
1. Github Personal Account
2. Azure Subscription


Before we Start with Hands on Labs, Lets us do Walkthrough basic Terminology of Workflow. 

**[Reference 1 : Workflow Syntax for Github Actions ](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions)**



**Reference 2 : Connecting to Azure**

Service Principal is used to Authenticate and perform task on Azure subscription.
Here is command line reference to create one service principal for you

az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} --sdk-auth
