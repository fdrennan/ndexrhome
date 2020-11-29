#! /bin/zsh

cd /home/fdrennan/Programming/R/ndexr-home
/usr/bin/Rscript build.R
/usr/bin/R CMD build .
docker-compose build
