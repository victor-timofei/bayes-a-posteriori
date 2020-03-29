function index = findBin(value, binEnds)
    numBins = length(binEnds) - 1;
    
    index = numBins;
    for i = 1:numBins
       if value>binEnds(i)
          index = i;
       end
    end
    
    % return the index of the bin where value belongs {1, ..., numBins}. 
end