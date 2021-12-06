# Welcome to DevOps with Github - HandsonLabs

## *Github Actions workflows for each Labs are in their branches, Please use Branchlink*


## Lab 1 : Create Express App using NodeJs
[BranchLink : EXPRESSJS](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/EXPRESSJS)

## Lab 2 : Create Webapp for FastFood Restaurant using ASP.NET MVC APP
[BranchLink : ASP.NET MVC](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/ASPNETMVC)

## Lab 3 : Creake AKS Cluster and Deploy App using Helm
[BranchLink : AKS](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/AKS)

## Lab 4 : Create SailJs App on Azure using Node and Javascript
[BranchLink : SailJs using Node and Javascript ](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/SAILJS)

## Lab 5 : Create PHP App on Azure using PHP and CSS
[BranchLink : PHP and CSS](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/PHP)

## Lab 6 : Azure SQL Database and update database as code
[BranchLink : AzureSQLDatabase](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/AzureSQLDatabase)

## Lab 7 : Azure MYSQL Database and update database as code
[BranchLink : AzureMYSQL](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/AzureMYSQLDatabase)

## Lab 8 : Azure Postgres Database and update database as code
[BranchLink : AzurePostgresDatabase](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/AzurePostgresDatabase)

## Lab 9  : Create Online Polls using Django App and PostgreSQL DB
[BranchLink : Django App and PostgreSQL DB](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/DjangoPostgresdb)

## Lab 10 : Create Webapp for Car Rental Vendor using Java and MySQL
[BranchLink : Java and MySQL DB ](https://github.com/jethanivijay/DevopsWithGithub-Hands-on-Labs/tree/JavaMySQLdb)


##  Instructions to Get Started on this Labs

**Prequisite(Mandate)**
### 1. Github Personal Account

![GithubAccount](/GithubPersonalAccount.JPG)

### 2. Azure Subscription

![AzureFreeAccount](/AzureFreeAccount.JPG)

## Step by Step Guides to help you get started ! 

[**Reference 1 : Github Actions Syntax**](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions)


[**Reference 2 : Connecting to Azure using Service principal**](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli)

Service Principal is used to Authenticate and perform task on Azure subscription.
Here is command line reference to create one service principal for you

- **Giving Service Principal access to Complete Subscription**

    az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/{subscription-id} --sdk-auth

- **If you want scope of service principal retricted to resource Group follow command below**

    az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} --sdk-auth

    Output of this will be similar 


      {

        "clientId": "<GUID>",

        "clientSecret": "<GUID>",

        "subscriptionId": "<GUID>",

        "tenantId": "<GUID>",

        (...)

      }

Copy Complete Parenthesis and create Github Secret , This will be our First Github Secret !




## Code Branches for this Hands on Lab

![**Reference 3 : Code Branches for this Hands on Lab**](Codebranches.JPG)
