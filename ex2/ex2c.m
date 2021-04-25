clc;
clear all;
close all;

pkg load queueing;

% TASK: Simulate an M/M/1/4 system.
counter = 1;
l = 5;
mu = 10;

% System with 4 customers at most, therefore 5 states.
states = [0, 1, 2, 3, 4];

% The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

% Define the birth and death rates between the states of the system.
births_B = [l, l/2, l/3, l/4];
deaths_D = [mu, mu, mu, mu];

% (i) Get the transition matrix of the birth-death process.
transition_matrix = ctmcbd(births_B, deaths_D);
printf("The transition matrix of the system is: \n");
disp(transition_matrix);

% (ii) Get the ergodic probabilities of the system and plot the bar for bar chart.
P = ctmc(transition_matrix);
printf("The ergodic probabilities of the system are: \n");
disp(P);

figure(counter++);
bar(states, P, 1);
xlabel ("Number of customers");
ylabel ("Ergodic probability");
title ("Ergodic probabilities as a function of number of customers");

% (iii) Get the average number of customers on stationary state.
average = 0;
for i=1:4;
  average += i*P(i+1);
endfor

printf("The average number of customers on stationary state is: %d. \n", average);

% (iv) Get the blocking probability.
blocking_probability = P(end);
printf("The blocking probability of the system is: %d. \n", blocking_probability);

% (v) Transient probability of all the states until they converge to their ergodic probability. 
% Convergence takes place when Prob and P differ by 0.01.
index = 0;
for T = 0:0.01:50
  index++;
  Prob = ctmc(transition_matrix, T, initial_state);
  Prob1(index) = Prob(1);
  Prob2(index) = Prob(2);
  Prob3(index) = Prob(3);
  Prob4(index) = Prob(4);
  Prob5(index) = Prob(5);
  if Prob - P < 0.01
    break;
  endif
endfor

T = 0:0.01:T;
figure(counter++);
plot(T, Prob1);
figure(counter++);
plot(T, Prob2);
figure(counter++);
plot(T, Prob3);
figure(counter++);
plot(T, Prob4);
figure(counter++);
plot(T, Prob5);

% (vi) Repeat the (v) part with different mu values.
mu_ = [1, 5, 20];

for i=1:3
  mu = mu_(i);
  deaths_D = [mu, mu, mu, mu];
  transition_matrix = ctmcbd(births_B, deaths_D);
  P = ctmc(transition_matrix);
  
  index = 0;
  for T = 0:0.01:50
    index++;
    Prob = ctmc(transition_matrix, T, initial_state);
    Prob1(index) = Prob(1);
    Prob2(index) = Prob(2);
    Prob3(index) = Prob(3);
    Prob4(index) = Prob(4);
    Prob5(index) = Prob(5);
    if Prob - P < 0.01
      break;
    endif
  endfor

  T = 0:0.01:T;
  figure(counter++);
  plot(T, Prob1);
  figure(counter++);
  plot(T, Prob2);
  figure(counter++);
  plot(T, Prob3);
  figure(counter++);
  plot(T, Prob4);
  figure(counter++);
  plot(T, Prob5);
endfor