i = 0;

while 1
    
    url = ['https://dweet.io/dweet/for/safa-milano?fire=1&gas=10&humidity=',num2str(i),'&temperature=',num2str(i),'&status=1'];
    
    %disp(url)
    
    system(['START /B py -3 D:\Users\Varandas\Workspace\safa\webreq.py "', url, '"']);
    
    i = i + 1;
    
    pause(0.5);
end