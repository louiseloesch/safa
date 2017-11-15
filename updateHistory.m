function repo=updateHistory( meas, repo)
% manages the data stucture for the measurements

N=1000;
f={'humidity', 'temperature', 'gas', 'flame' };

if isempty( repo )
    % init repo
    init=struct();
    for k=1:length(f)
        init.( f{k} )=[];
    end
    repo=repmat(init,N,1);
end

for k=1:length(f)
    repo(end).( f{k} )=meas(k);
end

end