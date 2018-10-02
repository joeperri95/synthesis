function y = reverse_saw_t(amplitude, max_harmonics, center_frequency, fade, duration, sample_frequency)
    
    x = [0:1/sample_frequency:duration-1/sample_frequency];
    y = 0;
    
    for i = 1:max_harmonics
        if mod(i,2) == 0
            y = y + 2.*amplitude/(i).*sin(2.*pi.*center_frequency.*x.*i); 
        else
            y = y - 2.*amplitude/(i).*sin(2.*pi.*center_frequency.*x.*i); 
        end
    end
    
    y = y.*exp(-fade.*x);
    
end
