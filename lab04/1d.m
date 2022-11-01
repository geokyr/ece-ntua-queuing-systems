% Call center simulation with 200 workers and 23 minutes per hour max load by the most demanding worker.

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

rho = 200*23/60;

for i = 1:200
  pblocking(i) = erlangb_iterative(rho, i);
endfor

figure(1);
hold on;
title("Blocking Probability per amount of phone lines");
xlabel("Amount of phone lines");
ylabel("Blocking Probability");
plot(pblocking);
grid on;

printf("The minimum amount of phone lines needed in order\nto have a blocking probability less than 0.01 is:\n");
disp(min_lines = find(pblocking < 0.01)(1))