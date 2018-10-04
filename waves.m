% "main" file for experimenting

clear all
clc

%sampling frequency
fs = 48000;

%center frequency
fc = 440;

%amplitude
A = 1;

%exponential fade out factor
fade = 0;

%total duration
t_duration = 4;

x = [0:1/fs:t_duration-1/fs];

%sample duration in seconds
duration = 1;

%number of frequency harmonics
max = 100;

y1 = sine_t(1, 220, 0, 2, fs);
y2 = square_t(0.5, max, fc, 5, duration, fs);
y3 = saw_t(1, max, 70, 5, 1, fs);
y4 = triangle_t(1, max, 110, 1, t_duration, fs);

ya = pad_t(t_duration, y2, 1, fs);
yb = pad_t(t_duration, y1, 0, fs);
yc = pad_t(t_duration, y3, 3, fs);
yd = pad_t(t_duration, y4, 0, fs);


y = add_t(ya, yb, fs);
y = add_t(y, yc, fs);

soundsc(y,fs);
