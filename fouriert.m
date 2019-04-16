function [G,f] = fouriert(g,t);
Ts = t(2)-t(1);  % sampling period
fs=1/Ts;     % sampling rate
Nf=length(t);    % points in time same as frequency
df = fs/Nf;   % interval between two adjacent frequency points
f= (-0.5*fs):df:(0.5*fs-df);  % freq. vector around 0 Hz (central replica)
G = fftshift(fft(fftshift(g)));     % Central replica of the DFT
