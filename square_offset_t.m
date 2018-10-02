function y = square_offset_t(amplitude, center_frequency, fade, duration, sample_frequency)
    
    x = [0:1/sample_frequency:duration-1/sample_frequency];
    y = 0;
    
    k = sample_frequency/center_frequency;
    flag = -0.5;
    
    for j = 1:length(x)
       if(mod(j,k) == 0)
           flag = flag.*-1;
       end
       y(j) = flag;
    end

    y = amplitude.*y.*exp(-fade.*x) + amplitude./2;
end