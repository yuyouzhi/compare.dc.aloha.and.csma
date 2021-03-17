function [ R_system, R_station ] = aloha_L_1_lei(D, N, p_vec, n_frame )
%aloha Simulate the Aloha protocol 
%   Inputs:
%       D: integer scalar, delay (which is also the frame length)
%       N: integer scalar, number of stations   
%       p_vec: a row vector of size(1, length(p_vec), transmit/re-transmit probablity
%       n_frame: integer scalar, number of periods/frames to simulate
%   Outputs:
%       R_system: vector of size (1, length(p_vec)), R_system(j) is the empirical system timely throughput under re-transmission probability p_vec(j)
%       R_station: real vector of size (N,length(p_vec)) where R_station(i, j) is the timely throughput of station i under re-transmission probability p_vec(j)

if(length(D) ~= 1)
    error('D is not scalar');
end


if(length(N) ~= 1)
    error('N is not scalar');
end

if(size(p_vec,1) ~= 1)
    error('p is not a row vector');
end


if(length(n_frame) ~= 1)
    error('n_frame is not scalar');
end

rng('shuffle'); %seeds the random number generator based on the current time

%I have vectorized the algorithm such that it can hand an array of re-transmission probablity, lei@20180314

n_delivery = zeros(N, length(p_vec), n_frame); %n_delivery(i,f, j)=1 if station i deliver a packet in frame/peroid f under re-transmission probability p_vec(j)

for f=1:n_frame
    has_packet = ones(N,length(p_vec));
    for t=1:D
        %transmit if rand < p and has a packet, do_transmit is of size (N,length(p_vec)
        do_transmit = has_packet.*(rand(N,length(p_vec)) <= repmat(p_vec,N,1));
        
        %find those prob-systems with exactly one transmit
        one_transmit_idx = find(sum(do_transmit, 1) == 1);
        [idx, ~] = find(do_transmit(:,one_transmit_idx));
        
        linear_idx = sub2ind(size(has_packet), idx', one_transmit_idx);
        
        %sanity check
        if(has_packet(linear_idx) ~= 1)
            error('something wrong!');
        end
        
        has_packet(linear_idx) = 0;
        
        linear_idx2 = sub2ind(size(n_delivery), idx', one_transmit_idx, f*ones(size(one_transmit_idx)));
        n_delivery(linear_idx2) = 1;
    end
end
R_station = mean(n_delivery,3)/D; %R_station(i, j) is the empirical (per-slot) timely throughput of station i under re-transmission probability p_vec(j)
R_system = sum(R_station,1); %R_system(j) is the empirical system (per-slot) timely throughput, which is also equal to sum(R_station) under re-transmission probability p_vec(j)

end
