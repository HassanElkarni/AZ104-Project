#!/bin/bash

# Variables
RESOURCE_GROUP_NAME="adan-app-rg"
LOCATION="northeurope"
APP_SERVICE_PLAN_NAME="basic-asp"
WEB_APP_NAME="my-adan-app" # Ensure this is unique across Azure
SKU="F1" # Free tier

# Create a resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create an App Service plan
az appservice plan create --name $APP_SERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME --sku $SKU --is-linux

# Create a web app
az webapp create --name $WEB_APP_NAME --resource-group $RESOURCE_GROUP_NAME --plan $APP_SERVICE_PLAN_NAME --runtime "Php|7.3" --deployment-local-git

# Output the details
echo "Resources created:"
echo "Resource Group: $RESOURCE_GROUP_NAME"
echo "App Service Plan: $APP_SERVICE_PLAN_NAME"
echo "Web App: $WEB_APP_NAME"