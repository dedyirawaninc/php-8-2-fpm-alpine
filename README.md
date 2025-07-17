# php-8-2-fpm-alpine

Base image from php:8.2-fpm-alpine

## Create docker hub token for password and username

sudo nano ./docker/token/password.txt
sudo nano ./docker/token/username.txt

## Login into docker hub

./docker/login.sh

## Build to execute and upload

./docker/build/execute.sh
./docker/build/uplaod.sh
