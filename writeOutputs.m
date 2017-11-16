function writeOutputs( arduino, actions )
% sends the outputs, eg.: LED status to Arduino

led=[ 0 0 0 ];
buzzer=false;
switch actions
    case 0 
        led=[ 0 255 0 ]; % green
    case 1
        led=[ 255 165 0 ]; % orange
    case 2
        led=[ 255 0 0 ]; % red
    case 3
        led=[ 255 0 0 ]; % red
        buzzer=true;
end

% write values to aurduino

end