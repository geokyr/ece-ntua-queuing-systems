% Compare the two custom functions and check if they work for large numbers.

clc;
clear all;
close all;

function answer = erlangb_factorial(rho, c)
  num = (rho^c)/factorial(c);
  denom = 0;
  for i = 0:c
    denom += (rho^i)/factorial(i);
  endfor
  answer = num/denom;
endfunction

function answer = erlangb_iterative(rho, c)
  answer = 1;
  for i = 0:c
    answer = rho*answer/(rho*answer+i);
  endfor
endfunction

printf("Probability of blocking with rho = 1024 and c = 1024\ncalculated by our erlangb_factorial function:\n");
disp(erlangb_factorial(1024,1024));
printf("Probability of blocking with rho = 1024 and c = 1024\ncalculated by our erlangb_iterative function:\n");
disp(erlangb_iterative(1024,1024));