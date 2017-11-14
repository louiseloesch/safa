function main()
% entry point of SAFA


meas=readMeasurements();
act=evalModels( meas );
writeOutputs( act );


end
