%SetBackoffTime函数功能：根据退避次数生成退避时间
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ret =  setBackoffTime(D)
 
n =  D;                                                    %生成退避时间的上限值
int_n=round(n);
t = randperm(int_n)-1 ;      %-1                                                  %在退避时间的上限值范围内生成退避时间序列

backoff_time = t(1) ;                                                        %随机找一个作为退避时间
ret = backoff_time;                                                         %返回随机退避时间
end
 

                                                                                          