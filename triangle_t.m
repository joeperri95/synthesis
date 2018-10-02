function y = triangle_t(amplitude, max_harmonics, center_frequency, fade, duration, sample_frequency)
    
    x = [0:1/sample_frequency:duration-1/sample_frequency];
    y = 0;
    
    for i = 0:max_harmonics

        n = 2.*i + 1;

        if mod(i,2) == 0
            y = y + amplitude.*(n)^(-2).*sin(n.*x.*2.*pi.*center_frequency);
        else
            y = y - amplitude.*(n)^(-2).*sin(n.*x.*2.*pi.*center_frequency);
        end
    end
    
    y = y.*exp(-fade.*x);
    
end
