function [job_assignment, job_value] = greedy_sort( m, n, t )
% m --> the number of machine
% n --> the number of jobs
% t --> time of each job
job_assignment = zeros(m,1);
job_value = zeros(m,1);
t = sort(t,'descend');
for i=1:n
  [min_value, min_index] = min(job_value);
  job_value(min_index) = min_value + t(i);
  temp = zeros(m,1);
  temp(min_index) = i;
  job_assignment = [job_assignment, temp];
end
end


