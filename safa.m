function safa()
% entry point of SAFA

a=initArduino();

meas=[];
while 1
    actMeas=readMeasurements( a );
    meas=updateHistory( actMeas, meas)
    act=evalModels( meas );
    writeOutputs( act );
end


end
