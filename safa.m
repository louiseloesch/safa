function safa()
% entry point of SAFA

Ts=5; % step time in sec

a=initArduino();

meas=[];
while 1
    actMeas=readMeasurements( a );
    meas=updateHistory( actMeas, meas);
    act=evalModels( meas )
    writeOutputs( a, act );
    pause(Ts); 
end


end
