%% Introduction

clear, clc, close all

%% Loading data from file
[file,path] = uigetfile('MICA PROJECT/*.mat', 'rt');
signal = load(fullfile(path, file));
x = -signal.ecg  ; % Your ecg data
%% Initialization of parameters
% load("PatientData.mat");
% x=ecg{13};


Fs = 200; % frequence
Ts =1/Fs ;
N_fft = 512;

wd = 8; % window duration
wl = wd*Fs; % window length
w = hamming(wl); % hamming wondow of length wl
d = 10; %
epsilon = 7 ;
%% Spectrogram

%[S1, t1, f1] = spectro(x,w,d, N_fft, Fs);


N=8;
[lpf,bpf,pass_dif,s_sq,s_mwi_n,s_mwi_n2,r_locs]= R_detection(x,Fs,N);
[Q_locs,S_locs] = Q_and_S_detection(x,Fs,N);
[f_1, f_2, T_locs] = P_and_T_detection(x,Fs,N);
[a,b,c] = cardiac_pathologies(r_locs,epsilon,Ts) ;
%% Display of results

figure,
subplot(6,1,1) , plot(x), xlim([0 400]), title('ECG segment characteristic'),grid MINOR;
hold on
r = scatter(r_locs,x(r_locs),'filled');
q = scatter(Q_locs,x(floor(Q_locs)),'filled');
s = scatter(S_locs,x(floor(S_locs)),'filled');
t = scatter(T_locs,x(floor(T_locs)),'filled');
hold off
subplot(6,1,2), plot(lpf), xlim([0 400]), title('lpf'),grid MINOR;
subplot(6,1,3), plot(bpf), xlim([0 400]), title('bpf'),grid MINOR;
subplot(6,1,4), plot(pass_dif), xlim([0 400]), title('pass_dif'),grid MINOR;
subplot(6,1,5), plot(s_sq), xlim([0 400]), title('s_sq'),grid MINOR;
subplot(6,1,6), plot(s_mwi_n), xlim([0 400]), title('AFTER INTEGRATION'),grid MINOR;




