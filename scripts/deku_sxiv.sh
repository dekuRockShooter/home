#! /bin/bash

~/Downloads/sxiv-master/sxiv  $(ls -1 $(pwd) | grep .*\.png$ | tr '\n' '\ ') 
