function humidity_average=check_humidity(meas,epsilon)
value=meas(end).humidity;
average=mean( [meas(1:end-1).humidity] );
if isnan( average)
    average=value;
end
humidity_average=average;
if (average-epsilon)<=value&&value<=(average+epsilon)
    humidity_average=(average+value)/2;
    if value < average
    disp('the weather is getting dryer');
    else
    disp('the weather is getting wetter');
    end
else
    if (meas(end-1).humidity-epsilon<=value&&value<=meas(end-1).humidity+epsilon)
        humidity_average=(average+value)/2;
        if value < average
            disp('the weather is getting dryer');
        else
            disp('the weather is getting wetter');
        end
    else
        meas(end).humidity=[];
    end
end

end

