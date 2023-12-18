#!/bin/bash
mkdir /share/winestorage/ > null
# Check if /share/.env.local.WineStorage exists
if [ ! -f "/share/winestorage/.env.local" ]; then
    # Copy the file from /localshare/.env.local to /share/.env.local.WineStorage
    cp /localshare/.env.local /share/winestorage/.env.local
fi

# Create a symlink if the file exists or has been copied successfully
if [ -f "/share/winestorage/.env.local" ]; then
    ln -sf /share/winestorage/.env.local /var/www/.env.local
fi

# Check if /share/wineapp.db exists
if [ ! -f "/share/winestorage/wineapp.db" ]; then
    # Copy the file from /localshare/app.db and rename it to wineapp.db
    cp /localshare/app.db /share/winestorage/wineapp.db
fi

# Create a symlink from /share/wineapp.db to /var/www/app.db
if [ -f "/share/winestorage/wineapp.db" ]; then
    rm /var/www/var/app.db
    ln -sf /share/winestorage/wineapp.db /var/www/var/app.db
fi
mkdir /share/winestorage/wineimage/ > null
cp /localshare/default.png /share/winestorage/wineimage/default.png > null
ln -sf /share/winestorage/wineimage/ /var/www/public/wineimage
chmod -R 777 /share/winestorage/ 
chmod +x /share/winestorage/wineapp.db