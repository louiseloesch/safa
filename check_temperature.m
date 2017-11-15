function temperature_average=check_temperature(average,epsilon)
value=meas(end).temperature;
temperature_average=average;
if (average-epsilon<=value&&value<=average+epsilon)
    temperature_average=(average+value)/2;
    if value < average
    disp('the weather is getting colder');
    else
    disp('the weather is getting warmer');
    end
else
    if (meas(end-1).temperature-epsilon<=value&&value<=meas(end-1).temperature+epsilon)
        temperature_average=(average+value)/2;
        if value < average
            disp('the weather is getting colder');
        else
            disp('the weather is getting warmer');
        end
    else
        meas(end).temperature=[];
    end
end

end

