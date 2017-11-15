function severity=getRisk( meas )

severity=1;

severity=severity&&( check_temperature(meas,1) > 30 ); % risk
severity=severity&&( humidity(meas,4) < 30 ); % risk
if meas(end).flame < 2 % fire
    severity=2;
end

severity=double( severity );

end