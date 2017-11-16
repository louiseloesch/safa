function severity=getRisk( meas )

severity=1;

% risk consditions
severity=severity&&( check_temperature(meas,1) > 30 );
severity=severity&&( humidity(meas,4) < 30 ); 
%severity=severity&&( meas(end).gas > 51 ); 

% if meas(end).gas > 204 % air dangerous
%     severity=2;
% end

if meas(end).flame < 60 % fire
    severity=3;
end

severity=double( severity );

end
