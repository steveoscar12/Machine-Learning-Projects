function mOut = modifyM(mIn,factor)
if(numel(factor) ~=1)
    error('The scaling factor must be a single number');
end;
mOut = mIn.*factor;