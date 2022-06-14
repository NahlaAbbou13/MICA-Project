function [Sx, f, t] = spectro(x,w,d,N_fft,Fs)
% This function computes the spectrogram for m = [0, d, 2d, 3d...]
% This function outputs are:
% -> Sx, which is a matrix of n_fft lines and
% M (number of elements of m) columns
% Sx(i,j) is the value of the spectrogram for time t(i) and frequency f(j)
% -> f, is a column vector of the frequencies (in Hz)
% -> t

L = length(x);
N = length(w);
M = floor((L-N)/d);

x_matrix = zeros(N,M);
X = zeros(N_fft,M);
Sx = zeros(N_fft,M);

m = 1:M;

for j = m
    x_matrix(:,j) = x(j*d : (N-1) + j*d);
    xw = w.*x_matrix(:,j);
    X(:,j) = fft(xw,N_fft);
    Sx(:,j) = abs(X(:,j)).^2/N_fft;
end

t = (0:M-1)*d/Fs;
f = 0: Fs*(N_fft-1)/N_fft;



