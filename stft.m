function [X, f, t] = stft(x,w,d,N_fft,Fs)

% This function computes the stft for m = [0, d, 2d, 3d...]
% This function outputs are:
% -> X, which is a matrix of n_fft lines and M columns
% M is the number of elements of m
% X(i,j) is the value of the spectrogram for time t(i) and frequency f(j)
% -> f, is a column vector of the frequencies (in Hz)
% -> t, is a row vector containing the times of the beginning of the windows

L = length(x);
N = length(w);

M = ceil((L-N)/d);

w = w(:);
x_matrix = zeros(N,M);
X = zeros(N_fft,M);

m = 1:M;

for j = m
    x_matrix(:,j) = x(j*d : (N-1) + j*d);
    xw = w.*x_matrix(:,j);
    X(:,j) = fft(xw,N_fft);
end

t = (0:M-1)*d/Fs;
f = 0: Fs*(N_fft-1)/N_fft;



