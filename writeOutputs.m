function writeOutputs( arduino, actions )
% sends the outputs, eg.: LED status to Arduino

led=[ 0 0 0 ];
buzzer=false;
switch actions
    case 0 
        led=[ 0 255 0 ]; % green
        
        fprintf(arduino,'G255');
    case 1
        led=[ 255 165 0 ]; % orange
        
        fprintf(arduino,'R255');
        fprintf(arduino,'G165');
    case 2
        led=[ 0 0 255 ]; % blue
        
        fprintf(arduino,'B255');
    case 3
        led=[ 255 0 0 ]; % red
        buzzer=true;
        
        fprintf(arduino,'R255');
        fprintf(arduino,'A255');

end

% write values to aurduino

end