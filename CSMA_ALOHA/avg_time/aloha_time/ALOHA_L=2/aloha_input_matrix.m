function[number]=aloha_input_matrix(matrix,D,L)
 number=(matrix(1,2)-1)*(L+1)*(D+1);
  number= number+matrix(1,1)*(D+1);
  number= number+matrix(1,3)+1;
end