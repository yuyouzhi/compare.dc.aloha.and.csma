function[realnumber]=L2_input_matrix(D,matrix,L)
realnumber=matrix(1,1)*D*(D+1);
realnumber=realnumber+(D+1)*matrix(1,2);
realnumber=realnumber+(matrix(1,3)+1);
realnumber=realnumber+(L+1)*(D+1)*D*(matrix(1,4)-1);
end