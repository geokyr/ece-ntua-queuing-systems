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
printf("\nThe ergodic probabilities of the system are: \n");
ergodicP = sprintf("%d  ", P);
printf("%s \n", ergodicP);

figure(counter++);
bar(states, P, 0.5);
xlabel("Number of customers");
ylabel("Ergodic probability");
title("Ergodic probabilities as a function of number of customers");

% (iii) Get the average number of customers on stationary state.
average = 0;
for i=1:4;
  average += i*P(i+1);
endfor

printf("\nThe average number of customers on stationary state is: %d. \n", average);

% (iv) Get the blocking probability.
blocking_probability = P(end);
printf("\nThe blocking probability of the system is: %d. \n", blocking_probability);

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
plot(T, Prob1, T, Prob2, T, Prob3, T, Prob4, T, Prob5);
xlabel("Time scale in seconds");
ylabel("Transient probability");
title(sprintf("Transient probabilities until covergence to ergodic - Service Rate = %d", mu));
legend("State 1 with 0 customers", "State 2 with 1 customers", "State 3 with 2 customers", "State 4 with 3 customers", "State 5 with 4 customers");

% (vi) Repeat the (v) part with different mu values.
mu = [1, 5, 20];

for i=1:columns(mu)
  deaths_D = [mu(i), mu(i), mu(i), mu(i)];
  transition_matrix = ctmcbd(births_B, deaths_D);
  P = ctmc(transition_matrix);
  
  Prob1 = [0];
  Prob2 = [0];
  Prob3 = [0];
  Prob4 = [0];
  Prob5 = [0];
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
  plot(T, Prob1, T, Prob2, T, Prob3, T, Prob4, T, Prob5);
  xlabel("Time scale in seconds");
  ylabel("Transient probability");
  title(sprintf("Transient probabilities until covergence to ergodic - Service Rate = %d", mu(i)));
  legend("State 1 with 0 customers", "State 2 with 1 customers", "State 3 with 2 customers", "State 4 with 3 customers", "State 5 with 4 customers");
endfor