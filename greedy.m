function [job_assignment, machine_loads] = greedy( m, n, t )
% m --> the number of machine
% n --> the number of jobs
% t --> time of each job
job_assignment = cell([1,m]);
machine_loads = zeros(m,1);
for i=1:n
    [min_value, min_index] = min(machine_loads);
    machine_loads(min_index) = min_value + t(i);
    job_assignment{min_index} = [job_assignment{min_index}, i];
end
end


