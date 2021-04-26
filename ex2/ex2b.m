clc;
clear all;
close all;

pkg load queueing;

% TASK: Plot the charts of utilization, response time, average number of 
% customers and throughput for the allowed mu's.

counter = 1;

l = 5;
mu = 5.1:0.1:10;

for i=1:columns(mu)
  [util(i), resp(i), numb(i), through(i)] = qsmm1(l,mu(i));
endfor

figure(counter++);
plot(mu, util);
xlabel("Service Rate (mu)");
ylabel("Utilization of server");
title("Utilization of server as a function of service rate");

figure(counter++);
plot(mu, resp);
xlabel("Service Rate (mu)");
ylabel("Response time of server");
title("Response time of server as a function of service rate");

figure(counter++);
plot(mu, numb);
xlabel("Service Rate (mu)");
ylabel("Average number of requests on server");
title("Average number of requests on server as a function of service rate");

figure(counter++);
plot(mu, through);
xlabel("Service Rate (mu)");
ylabel("Throughput of server");
title("Throughput of server as a function of service rate");