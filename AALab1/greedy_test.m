clear;clc
machines_total = 3;
jobs_total = 7;
jobs_time = [1 2 3 4 5 6 7];
[job_assignment, machine_load] = greedy(machines_total, jobs_total, jobs_time);
% job_assignment is a cell structure
% machine_load is a vector

