# MICA project : Matlab Interface for a Cardiac Analyst

This project addresses the problem of automated diagnosis of cardiac pathologies, via the signals provided by electrocardiogram (ECG) measurement devices.
The main purpose of this project is to implement basic signal processing algorithms using Matlab to detect some cardiac pathologies, and develop a graphical user interface (GUI) to load, process and display ECG, in order to help clinicians through their diagnosis.

## Table of Contents
1. [Context and objectives](#context-and-objectives)
2. [Technical part](#technical-part)


## Context and objectives
This project is designed to help clinicians to detect pathologies automatically only with
loading the signal analysis.
The main goal of this project is to analyse an ECG1 signal by:
- implementing the Pan and Tompkins algorithm to automatically detect the PQRST
complex,
![image](https://user-images.githubusercontent.com/107478473/173598858-58d5cd89-a586-4be8-a99a-e1a4c521c8c7.png)
- designing algorithms to identify certain cardiac pathologies such as cardia tachi, cardia brachy, ectopic beat and fibrillation,
- conducting a frequency study to visualise these pathologies in the spectrogram of the ECG signal by applying a STFT.

## Technical part
This part describes the different scripts used to realize this project

#### STFT
***
This file [stft.m]() allows to apply the Short Term Fourier Transform to the ECG signal  
#### Spectrogram
***
[spectrogram.m]() is a function which computes the modulus squared of the STFT.
#### Pan and Tompkins Algorithm 
***
Pan and Tompkins Algorithm: This algorithm is used to localize the R wave. [R_detection.m]()

The PQST waves are detected using these following scripts :
[Q_and_S_detection.m]()
[P_and_T_detection.m]()

#### Automatic identification of cardiac pathologies
***
The cardiac pathologies (Tachycardia/Bradycardia - Ectopic beat) are detected in the following file:
[cardiac_pathologies.m]()

Atrial fibrillation is identified in this file: 
[artrial_filbriation.m]()


#### ECG denoising
***
To conserve the useful information and to remove such noises we use the next filters:
-  low-pass IIR Butterworth filter [lpf_butter.m]()
-  high-pass Chebyshev filter [hpf_tcheby.m]()

#### Display of the results 
***
And to display the spectrograms, and the complex PQRST, we use the function [Affichage_test.m]()
