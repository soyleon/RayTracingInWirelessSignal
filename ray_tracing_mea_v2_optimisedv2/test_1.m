
for pdp_num_ant =1:64;

[row,col] = find(power_received_ray_dB_v1_norm(65-pdp_num_ant,:)>NF_hor-10);
time_delay_v1_normtemp = time_delay_v1_norm(65-pdp_num_ant,col);
power_received_ray_dB_v1_normtemp = power_received_ray_dB_v1_norm(65-pdp_num_ant,col);

[row,col] = find(power_received_ray_dB_v2_norm(65-pdp_num_ant,:)>NF_hor-10);
time_delay_v2_normtemp = time_delay_v2_norm(65-pdp_num_ant,col);
power_received_ray_dB_v2_normtemp = power_received_ray_dB_v2_norm(65-pdp_num_ant,col);

for index_time = 1:Len
    time_delay_per5_v1 (1,index_time) = 0;
    power_received_per5_linear_v1 (1,index_time) = 0;
    time_delay_per5_v2 (1,index_time) = 0;
    power_received_per5_linear_v2 (1,index_time) = 0;
    Ray_num_v1 = size(time_delay_v1_normtemp);
    Ray_num_v2 = size(time_delay_v2_normtemp);
    for index_ray = 1:Ray_num_v1(1,2)
        if floor(time_delay_v1_normtemp(1,index_ray)./5)==index_time&&floor(time_delay_v1_normtemp(1,index_ray)./5)~=0
            time_delay_per5_v1(1,index_time) = 5*(index_time);
            power_received_per5_linear_v1(1,index_time) = 10.^(power_received_ray_dB_v1_normtemp(1,index_ray)/10)+power_received_per5_linear_v1(1,index_time);
        end
    end
    for index_ray = 1:Ray_num_v2(1,2)
         if floor(time_delay_v2_normtemp(1,index_ray)./5)==index_time&&floor(time_delay_v2_normtemp(1,index_ray)./5)~=0
            time_delay_per5_v2(1,index_time) = 5*(index_time+1);
            power_received_per5_linear_v2(1,index_time) = 10.^(power_received_ray_dB_v2_normtemp(1,index_ray)/10)+power_received_per5_linear_v2(1,index_time);
         end
    end
    if power_received_per5_linear_v1(1,index_time)~=0
        power_received_per5_dB_v1(1,index_time) = 10*log10(power_received_per5_linear_v1(1,index_time));
    else
        power_received_per5_dB_v1(1,index_time) = 0;
    end
    if power_received_per5_linear_v2(1,index_time)~=0
        power_received_per5_dB_v2(1,index_time) = 10*log10(power_received_per5_linear_v2(1,index_time));
    else
        power_received_per5_dB_v2(1,index_time) = 0;
    end

end
    [time_delay_per5_v1_sorted,index_v1_sort] = sort(time_delay_per5_v1);
    power_received_per5_dB_v1_sorted = power_received_per5_dB_v1(1,index_v1_sort);
    [time_delay_per5_v2_sorted,index_v2_sort] = sort(time_delay_per5_v2);
    power_received_per5_dB_v2_sorted = power_received_per5_dB_v2(1,index_v2_sort);
    [~,a] = intersect(Delay,time_delay_per5_v1_sorted);
    [~,b] = intersect(Delay,time_delay_per5_v2_sorted);
    error_v1_pdp = pdp_mea_norm_tar(pdp_num_ant,a)-power_received_per5_dB_v1_sorted(1,a);
    error_v2_pdp = pdp_mea_norm_tar(pdp_num_ant,b)-power_received_per5_dB_v2_sorted(1,b);
%     if power_received_per5_dB_v1_sorted ~= 0
%         power_received_per5_dB_v1_sorted_linear = 10.^(power_received_per5_dB_v1_sorted/10);
%     end
%     if power_received_per5_dB_v2_sorted ~= 0
%         power_received_per5_dB_v2_sorted_linear = 10.^(power_received_per5_dB_v2_sorted/10);
%     end
    
    mean_timedelay_per5_v1 = power_received_per5_linear_v1.*time_delay_per5_v1;
    mean_timedelay_per5_v2 = power_received_per5_linear_v2.*time_delay_per5_v2;
    
    rms_per5_v1(1,pdp_num_ant) = sqrt(sum((time_delay_per5_v1-mean_timedelay_per5_v1).^2.*power_received_per5_linear_v1))/sum(power_received_per5_linear_v1);
    rms_per5_v2(1,pdp_num_ant) = sqrt(sum((time_delay_per5_v2-mean_timedelay_per5_v2).^2.*power_received_per5_linear_v2))/sum(power_received_per5_linear_v2);
    
    time_delay_v1_normtemp = 0;
    time_delay_v2_normtemp = 0;
    
end