% Calculate E(T) and pair of min a and min E(T) for given network.clc;clear all;close all;pkg load queueing;a = 0.001:0.001:0.999;lambda = 10 .* 10^3;mu1 = (15 .* 10^6) / (128 .* 8);mu2 = (12 .* 10^6) / (128 .* 8);lambda1 = a.*lambda;lambda2 = (1-a).*lambda;[U1, R1, Q1, X1, p01]= qsmm1(lambda1, mu1);[U2, R2, Q2, X2, p02]= qsmm1(lambda2, mu2);Et = (Q1 .+ Q2) ./ lambda;figure(1);plot(a, Et);title("Average waiting time E(T) as a function of probability a of random split");xlabel("Probability a of random split");ylabel("Average waiting time E(T)");[minEt, minA] = min(Et);printf("The minimum value of E(T) is equal to %d when a is equal to %d.\n", minEt, minA .* 0.001 .- a(1));