function repo=updateHistory( meas, repo)
% manages the data stucture for the measurements

N=1000;

if isempty( repo )
    % init repo
    init=struct( 'humidity', [], 'temperature', [], 'gas', [], 'flame', false);
    repo=repmat(init,N,1);
end

repo(end).humidity=meas;

end