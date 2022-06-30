clc; clear all; close all;

% Generate the data for Homework 6 of MAT801.FS17

% The function is chosen from Wikipedia Fourier transform.
fun =@(t) cos(2*pi*(3*t)).*exp(-pi*t.^2);

N = 2^12;
a = 1.5;
t = linspace(-a,a, N+1);

ft = fun(t);
plot(linspace(0,1,N+1),ft);

fileID = fopen('f.dat','w');
fprintf(fileID,'%+12.10f\n', ft(1:N));
fclose(fileID);
