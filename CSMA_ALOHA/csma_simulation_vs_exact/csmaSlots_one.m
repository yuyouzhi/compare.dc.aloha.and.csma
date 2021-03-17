 function  [R_station] =csmaSlots_one( D,n_frame,L,pb,pc)
%当包可以传输时，会成功占据和包大小相同的时隙个数，一次性传完

 n_delivery = zeros(1,n_frame); %n_delivery(i,f)=1 if station i deliver a packet in frame/peroid f
for f=1:n_frame
    packet_end=0;
        backoff_time =setBackoffTime(D);         
    for t=1:D  
       if t==packet_end
           alphabet=[1,0];
           prob=[pc,1-pc];       
           collision=randsrc(1,1,[alphabet;prob]);
           if collision==0
            n_delivery (1,f)=1;
            break;
           else                
              backoff_time =setBackoffTime(D-1);  
           end   
       end  
        if  backoff_time ==0
          packet_end=t+L;          
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
R_station= mean( n_delivery,2)/D; 
 end