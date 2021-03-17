function[realnumber]=prob_input_matrix(D,matrix)
realnumber=(matrix(1,2)-1)*D*(D+1);
realnumber=realnumber+(D+1)*matrix(1,1);
realnumber=realnumber+matrix(1,3)+1;
end