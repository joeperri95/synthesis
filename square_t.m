function y = square_t(amplitude, max_harmonics, center_frequency, fade, duration, sample_frequency)
    
    x = [0:1/sample_frequency:duration-1/sample_frequency];
    y = 0;
    
    for i = 1:2:max_harmonics
        y = y + amplitude./i.*sin(center_frequency.*2.*pi.*x.*i);
    end
    
    y = y.*exp(-fade.*x);
    
end

