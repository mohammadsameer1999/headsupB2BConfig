#!/bin/bash

echo "WARNING: This script will remove ALL Docker images on your system."
echo "This includes images that may not be related to your current project."
echo "Make sure you have pushed any important images to a registry before proceeding."
echo ""
read -p "Are you sure you want to continue? (y/N): " confirm

if [[ $confirm != [yY] && $confirm != [yY][eE][sS] ]]; then
    echo "Operation cancelled."
    exit 1
fi

echo ""
echo "Listing all images before removal:"
docker images

echo ""
echo "Removing all Docker images..."

# Remove all images
docker rmi $(docker images -q) -f

if [ $? -eq 0 ]; then
    echo "All Docker images have been successfully removed."
else
    echo "An error occurred while trying to remove the images."
    echo "Some images may still be in use by containers or may require sudo privileges to remove."
fi

echo ""
echo "Current Docker images:"
docker images

echo ""
echo "Script execution completed."