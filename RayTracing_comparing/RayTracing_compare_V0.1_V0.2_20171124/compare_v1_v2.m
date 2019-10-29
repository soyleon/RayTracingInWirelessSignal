clear all

antenna_num = 64;

load(['E:\fuqiuhao\Raytraing_Platform\raytracing_matlab_simulation\ray_tracing_office_fuqiuhao\rayTracing_data\rayTracing_v1_indoor_tx1_rx1\office_64.mat']);
power_received_ray_dB_v1_temp = pr22;
power_received_ray_dB_v1_norm = pr22;
time_delay_v1_temp = td;
time_delay_v1_norm = td;
for  ant_temp = 1:antenna_num
    
    [time_delay_v1_norm(ant_temp,:),t_index_v1] = sort(time_delay_v1_norm(ant_temp,:));
    
    power_received_ray_dB_v1_norm(ant_temp,:) = power_received_ray_dB_v1_norm(ant_temp,t_index_v1);    
    power_received_ray_v1_linear(ant_temp,:)=power_received_ray_dB_v1_norm(ant_temp,:);
    
    time_delay_valid_v1 = find(time_delay_v1_norm(ant_temp,:)~=0);
    power_received_ray_v1_linear(ant_temp,time_delay_valid_v1(1,1):end) = 10.^(power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end)/10);
    
    mean_power_v1 = sum(power_received_ray_v1_linear(ant_temp,:).*time_delay_v1_norm(ant_temp,:))./sum(power_received_ray_v1_linear(ant_temp,:));
    rms_delay_v1(ant_temp) = sqrt(sum((time_delay_v1_norm(ant_temp,:)-mean_power_v1).^2.*power_received_ray_v1_linear(ant_temp,:))/sum(power_received_ray_v1_linear(ant_temp,:)));
     
    time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1));    
    power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1));    


%%
    load(['E:\fuqiuhao\Raytraing_Platform\raytracing_matlab_simulation\ray_tracing_office_fuqiuhao\rayTracing_data\rayTracing_v2_indoor_tx1_rx1\20171130_polarity\indoor_Rv0.2_antenna',num2str(ant_temp),'.mat']);
    num_ray = size(time_delay);
    ray_num = 0;
    for num_ray_i = 1:num_ray(1,2)
        if time_delay(1,num_ray_i) == 0
            continue;
        else
            ray_num = ray_num+1;
            time_delay_v2_temp(ant_temp,ray_num) = time_delay(1,num_ray_i);
            power_received_ray_dB_v2_temp(ant_temp,ray_num) = power_received_ray_dB(1,num_ray_i)+30;
            power_received_ray_v2_linear(ant_temp,ray_num) = power_received_ray(1,num_ray_i)*10^3;
        end
    end
    mean_power_v2 = sum(power_received_ray_v2_linear(ant_temp,:).*time_delay_v2_temp(ant_temp,:))/sum(power_received_ray_v2_linear(ant_temp,:));
    rms_delay_v2(ant_temp) = sqrt(sum((time_delay_v2_temp(ant_temp,:)-mean_power_v2).^2.*power_received_ray_v2_linear(ant_temp,:))/sum(power_received_ray_v2_linear(ant_temp,:)));
    
     delete(hwait);

end
time_delay_v2 = time_delay_v2_temp;
time_delay_v2_norm = time_delay_v2_temp;
power_received_ray_dB_v2 = power_received_ray_dB_v2_temp;
power_received_ray_dB_v2_norm = power_received_ray_dB_v2_temp;
 for ant_temp = 1:antenna_num     
      [time_delay_v2_norm(ant_temp,:),t_index_v2] = sort(time_delay_v2_norm(ant_temp,:));
     power_received_ray_dB_v2_norm(ant_temp,:) = power_received_ray_dB_v2_norm(ant_temp,t_index_v2);
     time_delay_valid_v2 = find(time_delay_v2_norm(ant_temp,:)~=0);
     time_delay_v2_norm(ant_temp,time_delay_valid_v2(1,1):end) = time_delay_v2_norm(1,time_delay_valid_v2(1,1):end) - time_delay_v2_norm(1,time_delay_valid_v2(1,1));
      power_received_ray_dB_v2_norm(ant_temp,time_delay_valid_v2(1,1):end) = power_received_ray_dB_v2_norm(ant_temp,time_delay_valid_v2(1,1):end) - power_received_ray_dB_v2_norm(ant_temp,time_delay_valid_v2(1,1));     
 end
 
%%  several point PDP figure 
figure(1);
plot(time_delay_v1_norm(1,:),power_received_ray_dB_v1_norm(1,:),'-b',time_delay_v2_norm(1,:),power_received_ray_dB_v2_norm(1,:),'--r','linewidth',2);
title('Power Delay Profile');
xlabel('Delay (ns)');
ylabel('PDP(Level to the Peak, dB)');
legend('Ray tracing V1','Ray tracing V2');
      
%%  Sum Power Figure
% power_received_ray_v1_linear = 10.^(power_received_ray_dB_v1_temp./10);
 %power_received_ray_v2_linear = 10.^(power_received_ray_dB_v2./10);
 power_sum_v1 = sum(power_received_ray_v1_linear,2)/10^3/pt0;
 power_sum_v2 = sum(power_received_ray_v2_linear,2);
 power_sum_v1_dB = 10.*log10(power_sum_v1);
 power_sum_v2_dB = 10.*log10(power_sum_v2);
 pathloss_v1_dB = power_sum_v1_dB ;
 pathloss_v2_dB = power_sum_v2_dB-20;
 
 figure(2)
 plot(1:antenna_num,-pathloss_v1_dB(1:antenna_num,:),'-b',1:antenna_num,-pathloss_v2_dB(1:antenna_num,:),'--r','linewidth',2);
 %title('Path Loss')
 xlabel('Antenna ID');
 ylabel('Path Loss(dB)');
 legend('Ray tracing V1','Ray tracing V2');
 
 %% RMS figure
 figure(3)
 plot(1:antenna_num,rms_delay_v1(1,1:antenna_num),'-b',1:antenna_num,rms_delay_v2(1,1:antenna_num),'--r','linewidth',2);  % v1的rms值大了9ns，一开始的功率的数量级有问题，此处做修改，v1的结果是dbm但是多了
 xlabel('Antenna ID');
 ylabel('RMS(Root Mean Square)');
 legend('Ray tracing V1','Ray tracing V2');
 
      
      