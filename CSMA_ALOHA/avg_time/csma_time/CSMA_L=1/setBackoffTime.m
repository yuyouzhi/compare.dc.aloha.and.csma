%SetBackoffTime�������ܣ������˱ܴ��������˱�ʱ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ret =  setBackoffTime(D)
 
n =  D;                                                    %�����˱�ʱ�������ֵ
int_n=round(n);
t = randperm(int_n)-1 ;      %-1                                                  %���˱�ʱ�������ֵ��Χ�������˱�ʱ������

backoff_time = t(1) ;                                                        %�����һ����Ϊ�˱�ʱ��
ret = backoff_time;                                                         %��������˱�ʱ��
end
 

                                                                                          