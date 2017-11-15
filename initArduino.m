function a=initArduino()
    instrreset

    a = serial('COM5');
    set(a,'BaudRate',115200);
    fopen(a);

end