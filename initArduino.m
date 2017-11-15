function a=initArduino()

try
    instrreset

    a = serial('COM5');
    set(a,'BaudRate',115200);
    fopen(a);
catch
    a=[];
end

end