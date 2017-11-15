function safa()
% entry point of SAFA

Ts=1; % step time in sec

a=initArduino();

meas=[];
while 1
    actMeas=readMeasurements( a );
    meas=updateHistory( actMeas, meas);
    act=evalModels( meas )
    writeOutputs( a, act );
    pause(Ts); 
end

fclose(s)
delete(s)
clear s

end
