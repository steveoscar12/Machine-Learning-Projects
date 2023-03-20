function updateFile(fileNameIn,factor)
mIn  = readFile(fileNameIn);
mOut = modifyM(mIn,factor);
fileNameOut = modifyFileName(fileNameIn);
writeFile(fileNameOut,mOut);