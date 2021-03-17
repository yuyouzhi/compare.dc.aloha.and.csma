function  [avg_time] =csma_avg_time( D,L,pb,pc,n_frame)
%n_frame=10000
%当包可以传输时，会成功占据和包大小相同的时隙个数，一次性传完
success_time= zeros(1,n_frame);
%n_delivery = zeros(1,n_frame); %n_delivery(i,f)=1 if station i deliver a packet in frame/peroid f
for f=1:n_frame
    success_unit=0;
    backoff_time =setBackoffTime(D);
    for t=1:D
        if D-t+1>=L-success_unit
            if  backoff_time ==0
                alphabet=[1,0];
                prob=[pc,1-pc];
                collision=randsrc(1,1,[alphabet;prob]);
                if collision==0
                    success_unit=success_unit+1;
                    if  success_unit==L
                        success_time(1,f)=t;
                        break;
                    end
                else
                    backoff_time =setBackoffTime(D);
                end
            else
                alphabet1=[1,0];
                prob1=[pb,1-pb];
                busy=randsrc(1,1,[ alphabet1;prob1]);
                if busy==0
                    backoff_time =backoff_time -1;
                end
            end
        end
    end
end
success_packet=sum(success_time~=0);
avg_time=sum(success_time)/(success_packet);
end