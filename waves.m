% "main" file for experimenting

%sampling frequency
fs = 48000;

%center frequency
fc = 440;

%amplitude
A = 1;

%exponential fade out factor
fade = 0;

%duration in seconds
duration = 2;

%number of frequency harmonics
max = 100;

y1 = square_offset_t(1, 200, fade, duration, fs);
y2 = square_t(4, max, fc, fade, duration, fs);

y = y1.*y2;

x = [0:1/fs:duration-1/fs];

plot(x(1:round(fs/fc)), y1(1:round(fs/fc)));

soundsc(y1,fs);
