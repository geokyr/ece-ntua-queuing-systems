pkg load queueing;

clc;
clear all;
close all;

% TASK: Plot the charts of utilization, response time, average number of 
% customers and throughput for the allowed mu's.

l = [5, 5, 5, 5, 5];
mu = [6, 7, 8, 9, 10];

for i=0:4
  [util, resp, numb, through] = qsmm1(l,mu);
endfor

figure(1);
plot(mu, util);
xlabel ("Service Rate (mu)");
ylabel ("Utilization of server");
title ("Utilization of server as a function of service rate");

figure(2);
plot(mu, resp);
xlabel ("Service Rate (mu)");
ylabel ("Response time of server");
title ("Response time of server as a function of service rate");

figure(3);
plot(mu, numb);
xlabel ("Service Rate (mu)");
ylabel ("Average number of requests on server");
title ("Average number of requests on server as a function of service rate");

figure(4);
plot(mu, through);
xlabel ("Service Rate (mu)");
ylabel ("Throughput of server");
title ("Throughput of server as a function of service rate");