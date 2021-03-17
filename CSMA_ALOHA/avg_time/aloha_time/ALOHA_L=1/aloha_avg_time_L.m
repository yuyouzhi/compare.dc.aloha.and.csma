function[  avg_time ] =aloha_avg_time_L( D,n_frame,ps,L)
success_unit=zeros(1,n_frame);
success_time= zeros(1,n_frame);
for f=1:n_frame
    for t=1:D
        alphabet=[1,0];
        prob=[ps,1-ps];
        success_transimit=randsrc(1,1,[alphabet;prob]);
        if success_transimit==1
            success_unit(1,f)= success_unit(1,f)+1;
        end
        if  success_unit(1,f)==L
            success_time(1,f)=t;
            break;
        end
    end
end
success_packet=sum(success_time~=0);
avg_time=sum(success_time)/(success_packet);
end