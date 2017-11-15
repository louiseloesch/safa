function meas=readMeasurements( arduino )
% returns the measured values from Aurduino

meas=zeros(4,1);
if ~isempty( arduino )
    out = fscanf(arduino);
    meas = sscanf(out,'F%dG%dH%fT%f') % fire - gas - humidity - temperature
else
    disp( 'Could not access arduino, measuremnts sets to 0!' );
end

end