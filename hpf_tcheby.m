function Hd = hpf_tcheby
%HPF_TCHEBY Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.11 and Signal Processing Toolbox 8.7.
% Generated on: 22-May-2022 01:05:02

% Chebyshev Type I Highpass filter designed using FDESIGN.HIGHPASS.

% All frequency values are in Hz.
Fs = 200;  % Sampling Frequency

Fstop = 0.1;         % Stopband Frequency
Fpass = 0.5;         % Passband Frequency
Astop = 40;           % Stopband Attenuation (dB)
Apass = 1;           % Passband Ripple (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its CHEBY1 method.
h  = fdesign.highpass(Fstop, Fpass, Astop, Apass, Fs);
Hd = design(h, 'cheby2', 'MatchExactly', match);

% [EOF]