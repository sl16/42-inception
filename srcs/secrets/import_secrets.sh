#!/bin/bash

docker secret create db_rootpass db_rootpass.txt
docker secret create db_pass db_pass.txt
docker secret create wp_adminpass wp_adminpass.txt
docker secret create wp_userpass wp_userpass.txt