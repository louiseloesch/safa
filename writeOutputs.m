function writeOutputs( arduino, actions )
% sends the outputs, eg.: LED status to Arduino

led=[ 0 0 0 ];
buzzer=false;
switch actions
    case 0
        disp('Green')
        led=[ 0 255 0 ];
    case 1
        disp('Orange')
        led=[ 255 165 0 ];
    case { 2 3 }
        disp('Red with Buzzer')
        buzzer = true;
        led=[ 255 0 0 ];
end

% write values to aurduino
if buzzer
    buzzer=111;
else
    buzzer=0;
end
fprintf(arduino,'R%03.f\r\nG%03.f\r\nB%03.f\r\nA%03.f', [led buzzer] );

end