pkg load statistics

clc;
clear all;
close all;

% TASK: Create 100 consecutive Poisson processes wiith exprnd() and draw the stairs function
% of one Poisson counting process with lambda = 5.

lambda = 5;
samples = exprnd(1/lambda, 1, 100);
arrival_time = cumsum(samples);
stairs(arrival_time, 1:100);

title("Poisson Counting Process");
xlabel("Time");
ylabel("Number of events");
legend("lambda=5");
hold off;

% TASK: Find mean number of events per second for a window DT = t1 - t2 of 100 consecutive
% events. Repeat for 200, 300, 500, 1000, 10000 consecutive events.

end_time = arrival_time(end);
mean = 100/end_time;
deviation = abs(lambda-mean);
display("For 100 samples: ");
display(mean);
display(deviation);

n_samples = [200, 300, 500, 1000, 10000];
display("For 200, 300, 500, 1000, 10000 samples respectively: ");

for i=1:5
  samples = exprnd(1/lambda, 1, n_samples(i));
  arrival_time = cumsum(samples);
  end_time = arrival_time(end);
  mean = n_samples(i)/end_time;
  deviation = abs(lambda-mean);
  display(mean);
  display(deviation);
endfor