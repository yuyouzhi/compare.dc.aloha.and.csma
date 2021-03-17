function  [r] =csmaSlots_simulation(N,D,n_frame,L)
n_delivery = zeros(N, n_frame); %n_delivery(i,f)=1 if station i deliver a packet in frame/peroid f
for f=1:n_frame
    backoff_time=zeros(N,1);
    has_packet = ones(N,1);
    packet_succed=zeros(N,1);
    back0=0;
    for i=1:N
        backoff_time(i,1)=setBackoffTime(D);
    end
    for t=1:D
        for i=1:N
            if ( packet_succed(i,1)==L || ( L-packet_succed(i,1) > D-t+1))      %check
                has_packet(i,1)=0;
            end
            if has_packet(i,1)==1
                if  backoff_time(i,1)==0
                    back0=back0+1;
                end
            end
        end
        linear=find(has_packet);
        if   back0==0
            backoff_time(linear)= backoff_time(linear)-1;
        elseif back0==1       %     problem
           % linear_index1=find( backoff_time(linear)==0);
           
           for i=1:N
               if has_packet(i,1)==1&& backoff_time(i,1)==0
            linear_index1=i;
               end
           end
           if backoff_time( linear_index1)==0
                packet_succed( linear_index1)=packet_succed( linear_index1)+1;
                 back0=0;
                if   packet_succed(  linear_index1)==L
                    linear_idx3=linear_index1+N*(f-1);
                    n_delivery(linear_idx3) = 1;
                    has_packet(linear_index1)=0;
                     back0=0;
                end
            else
                backoff_time( linear_index1)=backoff_time( linear_index1)-1;
            end
        else
            for i=1:N
                if  has_packet(i,1)==1
                    if  backoff_time(i,1)==0
                        backoff_time(i)=setBackoffTime(D);
                         back0=0;
                    end
                end
            end
        end
    end
end
R_station= mean( n_delivery,2)/D;
R_system = sum(R_station,1);
r=R_system/N;
