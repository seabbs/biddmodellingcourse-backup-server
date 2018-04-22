#!/bin/bash

for ID in $(eval echo {1..$1}) 
do
  user="course-$ID"
  password=$user
  printf "\tCreating user: %s with password: %s\n" $user $password
  useradd -m -s /bin/false $user
  passwd "$user" <<<"$password"$'\n'"$password"
  printf "\tCopying %s directory for %s\n" $2 $user
  cp -R "home/rstudio/$2" "home/$user/$2"
  chown -R $user "home/$user"
done