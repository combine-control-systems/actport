clear all;
close all;
clear classes;
rehash;
clc;
p = fullfile('C:', 'Users', 'Stefan Larsson', 'Projects', ...
    'ActPort', 'target', 'scala-2.12', ...
    'actport-assembly-0.1-SNAPSHOT.jar');

javarmpath(p);
javaaddpath(p);
clear p;
