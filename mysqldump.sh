#!/bin/bash
date=$(date +%Y%m%d)
passwd="******"
echo ${date}
mysqldump -u root -p${passwd} zfdb>zfdb${date}.sql
mysqldump -u root -p${passwd} zfdbstat>zfdbstat${date}.sql