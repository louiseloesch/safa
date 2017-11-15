function meas=readMeasurements( arduino )
% returns the measured values from Aurduino

out = fscanf(arduino);

meas = sscanf(out,'F%dG%dH%fT%f') % fire - gas - humidity - temperature

end