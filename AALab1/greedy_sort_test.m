clear;clc
machines_total = 3;
jobs_total = 5;
jobs_time = [2 4 6 7 5];
[job_assignment, machine_load] = greedy_sort(machines_total, jobs_total, jobs_time);
% job_assignment is a cell structure
% machine_load is a vector

