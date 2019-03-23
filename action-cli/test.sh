#!/bin/sh -l

echo '--- sysctl ---'
sysctl --all

echo '--- lscpu ---'
lscpu

echo '--- meminfo ---'
cat /proc/meminfo

echo '--- DOING DF ---'
df
