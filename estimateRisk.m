function act=estimateRisk( meas )

% simple linear regression base estimator with manually defined weights
f={ 'humidity', 'temperature', 'gas', 'flame' };
w=[ 0 -0.5 1 0 10]';
x=zeros( length(f)+1,1);
for k=1:length(f)
    if ~isempty( meas(end).( f{k} ) )
        x(k+1)=meas(end).( f{k} );
    end
end
y=w'*x

% tresholding
act=0;
if y>0.5 % risk
    act=1;
end
if y>0.8 % fire
    act=2;
end

end