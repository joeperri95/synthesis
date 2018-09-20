%sampling frequency
fs = 48000;

%center frequency
fc = 440;

%amplitude
A = 1.0;

%change this variable to select waveform
%{
0 = Square wave
1 = triangle wave
2 = reverse sawtooth wave
3 = sawtooth wave
%}

type = 0;

%number of frequency harmonics
max = 25;

x = [0:1/fs:1-1/fs];
y = 0;




if type == 0
    for i = 1:2:max
        y = y + A./i.*sin(fc.*2.*pi.*x.*i);
    end

elseif type == 1
    for i = 0:max

        n = 2.*i + 1;

        if mod(i,2) == 0
            y = y + A.*(n)^(-2).*sin(n.*x.*2.*pi.*fc);
        else
            y = y - A.*(n)^(-2).*sin(n.*x.*2.*pi.*fc);
        end
    end

elseif type == 2
    for i = 1:max
        if mod(i,2) == 0
            y = y + 2.*A/(i).*sin(2.*pi.*fc.*x.*i); 
        else
            y = y - 2.*A/(i).*sin(2.*pi.*fc.*x.*i); 
        end
    end

elseif type == 3
    for i = 1:max
        if mod(i,2) == 0
            y = y - A/(pi.*i).*sin(2.*pi.*fc.*x.*i); 
        else
            y = y + A/(pi.*i).*sin(2.*pi.*fc.*x.*i); 
        end
    end
end

plot(x(1:round(fs/fc)), y(1:round(fs/fc)));


soundsc(y,fs);
