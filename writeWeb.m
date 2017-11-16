function writeWeb( meas, act )
% post data to the dashboard

url='https://dweet.io/dweet/for/safa-milano';

data.temperature=meas(end).temperature;
data.humidity=meas(end).humidity;
data.noriskpollution=( act==0 );
data.riskpollution=( act==1 || act==2 );
data.firesmoke=( act==3 );

f=fieldnames( data );
for k=1:length(f)
    sep='&';
    if k==1
        sep='?';
    end
    url=[ url sep f{k} '=' num2str( data.(f{k}) ) ];
end

tic
try
    r=urlread(url,'Timeout', 0.4);
catch
    disp('Timeout')
end

toc
end