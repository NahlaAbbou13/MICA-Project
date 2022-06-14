%% Introduction

clear, clc, close all

%% Loading data from file

file1 = 'C:\Users\nhlai\MICA_project\data\ecg_noiseBL.mat'; 
data1 = load(file1);

file2 = 'C:\Users\nhlai\MICA_project\data\ecg_noisePL.mat'; 
data2 = load(file2);

%% Initialization of parameters 

x1 = -data1.ecg; % ecg signal BL
x2 = -data2.ecg; % ecg signal PL
Fs = data1.Fs; % frequence 

N_fft = 512;
wd = 8; % window duration
wl = wd*Fs; % window length
w = hamming(wl); % hamming wondow of length wl
d = 10; % 

Hd1 = lpf_butter;
lpf_but = filter(Hd1, x2);

Hd2 = hpf_tcheby;
hpf_tch = filter(Hd2, x1);


%% Spectrogram
[S11, t1, f1] = spectro(x1,w,d, N_fft, Fs);

figure,
subplot(3,1,1)
imagesc(t1,f1, 10*log10(S11));
xlabel('time(s)');
ylabel('Frequency(Hz)');
title("The ECG-noiseBL spectrogram");

subplot(3,1,2)
plot(x1), xlim([0 200]), title("ECG-noiseBL segment characteristic"),grid MINOR;
xlabel('Temps (s)');
ylabel('Magnitude');

subplot(3,1,3)
plot(hpf_tch), xlim([0 10]), title("ECG-denoiseBL segment characteristic"),grid MINOR;
xlabel('Temps (s)');
ylabel('Magnitude');

[S12, t1, f1] = spectro(x2,w,d, N_fft, Fs);

figure,
subplot(3,1,1)
imagesc(t1,f1, 10*log10(S12));
xlabel('time(s)');
ylabel('Frequency(Hz)');
title("The ECG-noiseBL spectrogram");

subplot(3,1,2)
plot(x2), xlim([0 200]), title("ECG-noisePL segment characteristic"),grid MINOR;
xlabel('Temps (s)');
ylabel('Magnitude');

subplot(3,1,3)
plot(lpf_but), xlim([0 200]), title("ECG-denoisePL segment characteristic"),grid MINOR;
xlabel('Temps (s)');
ylabel('Magnitude');
