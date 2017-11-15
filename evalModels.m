function actions=evalModels( meas )
% evaluate various models on the measured data
% modes should output severity: { 0: ok, 1: risk, 2: fire }

severity=getRisk( meas ) % 1st model

actions=struct( 'led', [ 0 0 0 ],  'buzzer', false );
switch severity
    case 0 
        actions.led=[ 0 255 0 ]; % green
    case 1
        actions.led=[ 255 165 0 ]; % orange
    case 2
        actions.led=[ 255 0 0 ]; % red
        actions.buzzer=true;
end

end