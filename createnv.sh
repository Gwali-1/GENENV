#! /bin/bash




WORKDIR=$(pwd)



if [ -f "template.txt" ]
then
    echo "template file recognized"
    for package in template.txt
    do
        echo $package
    done
else
    echo "no template file"
fi