function severity=getRisk( meas )

severity=0;
meas(end)
severity=double( ( check_temperature(meas,1) > 30 )&&( humidity(meas,4) < 30 ) );

end