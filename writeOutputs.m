function writeOutputs( arduino, actions )
% sends the outputs, eg.: LED status to Arduino

led=[ 0 0 0 ];
buzzer=false;
switch actions
    case 0
        disp('Green')
        fprintf(arduino,'G255');
        pause(1);
        fprintf(arduino,'R000');
        pause(1);
        fprintf(arduino,'B000');
        pause(1);
        fprintf(arduino,'A000');
    case 1
        disp('Orange')
        fprintf(arduino,'R255');
        pause(1);
        fprintf(arduino,'G165');
        pause(1);
        fprintf(arduino,'B000');
        pause(1);
        fprintf(arduino,'A000');
    case 2
        disp('Blue');
        fprintf(arduino,'B255');
        pause(1);
        fprintf(arduino,'R000');
        pause(1);
        fprintf(arduino,'G000');
        pause(1);
        fprintf(arduino,'A000');

    case 3
        disp('Red with Buzzer')
        buzzer = true;
        fprintf(arduino,'R255');
        pause(1);
        fprintf(arduino,'G000');
        pause(1);
        fprintf(arduino,'B000');
        pause(1);
        fprintf(arduino,'A111');

end

% write values to aurduino

end