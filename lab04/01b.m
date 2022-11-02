% Probability of blocking calculation using a custom function based on the iterative Erlang-B formula. 

clc;
clear all;
close all;
pkg load queueing;

function answer = erlangb_iterative(rho, c)
  answer = 1;
  for i = 0:c
    answer = rho*answer/(rho*answer+i);
  endfor
endfunction

printf("Probability of blocking with rho = 100 and c = 20\ncalculated by our custom function:\n");
disp(erlangb_iterative(100,20));
printf("Probability of blocking with rho = 100 and c = 20\ncalculated by the erlangb function from the queueing package:\n");
disp(erlangb(100,20));

printf("Probability of blocking with rho = 200 and c = 50\ncalculated by our custom function:\n");
disp(erlangb_iterative(200,50));
printf("Probability of blocking with rho = 200 and c = 50\ncalculated by the erlangb function from the queueing package:\n");
disp(erlangb(200,50));