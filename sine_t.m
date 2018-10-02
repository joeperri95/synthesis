function y = sine_t(amplitude, center_frequency, fade, duration, sample_frequency)
    
    x = [0:1/sample_frequency:duration-1/sample_frequency];
    y = amplitude.*sin(2.*pi.*center_frequency.*x).*exp(-fade.*x);
    
end
