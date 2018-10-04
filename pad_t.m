function y = pad_t(duration, array, start, sample_frequency)
    %insert sample at start seconds and pad result with zeros
    
    total_samples = duration * sample_frequency;
    closest_sample = start * sample_frequency;
    sample_length = length(array) / sample_frequency;
    
    if (start > duration || ((start + sample_length) > duration))
       
        y = [zeros(1, closest_sample), array]; 
    
    else
        
        y = [zeros(1,closest_sample), array, zeros(1, total_samples - closest_sample - length(array))];
        length(total_samples - closest_sample- length(array))
        
    end
    
    
    
end