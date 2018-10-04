function y = add_t(y1, y2, sample_frequency)
    
    if length(y1) > length(y2)
        temp = pad_t(length(y1) / sample_frequency, y2, 0, sample_frequency); 
        y = temp + y1;
    elseif length(y1) < length(y2)
        temp = pad_t(length(y2) / sample_frequency, y1, 0, sample_frequency); 
        y = temp + y2;
    elseif length(y1) == length(y2)
        y = y1 + y2;
    end
end