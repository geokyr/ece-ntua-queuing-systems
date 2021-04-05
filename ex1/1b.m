pkg load statistics

clc;
clear all;
close all;

# TASK: In a common diagram, design the Probability Density Function of Exponential processes
# with mean parameters (1/lambda) 0.5, 1, 3. In the horizontal axes, choose k parameters 
# between 0 and 8. 

k = 0:0.001:8;
# Hint is use k = 0:0.00001:8, for less demanding calculations and graphs we use k = 0:0.001:8.
mean = [0.5,1,3];

for i=1:columns(mean)
  exponential(i,:) = exppdf(k,mean(i));
endfor

colors = "rbk";
figure(1);
hold on;

for i=1:columns(mean)
  plot(k,exponential(i,:),colors(i),"linewidth",0.1);
endfor

title("Probability Density Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("1/lambda=0.5","1/lambda=1","1/lambda=3");
hold off;


# TASK: In a common diagram, design the Cumulative Density Function of Exponential processes
# with mean parameters (1/lambda) 0.5, 1, 3. In the horizontal axes, choose k parameters 
# between 0 and 8. 

for i=1:columns(mean)
  exponentialc(i,:) = expcdf(k,mean(i));
endfor

colors = "rbk";
figure(2);
hold on;

for i=1:columns(mean)
  plot(k,exponentialc(i,:),colors(i),"linewidth",0.1);
endfor

title("Cumulative Density Function of Exponential processes");
xlabel("k values");
ylabel("cumulative probability");
legend("1/lambda=0.5","1/lambda=1","1/lambda=3");
hold off;


# TASK: Using the Cumulative Density Function of Exponential Processes calculate the following
# probabilities: P(X>30000) and Pr(X>50000|X>20000).

k = 0:0.00001:8;

expo(1,:) = expcdf(k,2.5);

#P(A|B) = P(A^B)/P(B);

p_30000 = 1 - expo(30000);
p_50000 = 1 - expo(50000);
p_20000 = 1 - expo(20000);
conditional = p_50000/p_20000;

display("P(X>30000) is equal to:");
display(p_30000);

display("Pr(X>50000|X>20000) is equal to:");
display(conditional);

# The two probabilities are equal because the Exponential distribution has the memorylessness
# property, which means that the system constantly forgets which state it is in, showcased by
# the general rule of: P(X>m+n|X>m) = P(X>n), which applies here as: P(X>20000+30000|X>20000) =
# = P(X>30000).