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
    time_delay_v1_temp(ant_temp,:) = time_delay_v1_norm(ant_temp,:);
    
    time_delay_valid_v1 = find(time_delay_v1_norm(ant_temp,:)~=0);
    
    power_received_ray_v1_linear(ant_temp,time_delay_valid_v1(1,1):end) = 10.^(power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end)/10)*number;
    mean_power_v1 = sum(power_received_ray_v1_linear(ant_temp,:).*time_delay_v1_temp(ant_temp,:))./sum(power_received_ray_v1_linear(ant_temp,:));
    rms_delay_v1(ant_temp) = sqrt(sum((time_delay_v1_norm(ant_temp,:)-mean_power_v1).^2.*power_received_ray_v1_linear(ant_temp,:))/sum(power_received_ray_v1_linear(ant_temp,:)));
       
    time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1));    
    power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1));    


%%
    load(['E:\fuqiuhao\Raytraing_Platform\raytracing_matlab_simulation\ray_tracing_office_fuqiuhao\rayTracing_data\rayTracing_v2_indoor_tx1_rx1\20171129_wall_window_fix_antenna\indoor_Rv0.2_antenna',num2str(ant_temp),'.mat']);
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
 
 %% Measured data
load h_comp_valid_dB.mat;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

and_num = 95;
Nifftall = 640; %整体频域信道ifft点数，得h(t)
T0all = 5; % ns

Len = 30; %显示部分
Delay = (0:Len-1)*T0all; %ns

for ant_tar = 1:64;
    [val, id] = max(pdp_mea(ant_tar,:));
    
    pdp_mea_norm = pdp_mea(ant_tar,:) - val;%Norm
    pdp_mea_norm_tar = pdp_mea_norm(id:id+Len-1);%  the max value is directed ray
    pdp_mea_tar = pdp_mea(ant_tar,id:id+Len-1)-55;% UNNORM
    pdp_mea_tar_linear = 10.^(pdp_mea_tar./10); % Measured Linear value
    power_mea(ant_tar,:) = sum(pdp_mea_tar_linear);
    mean_delay_mea = sum(Delay.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear);
    rms_delay_mea(ant_tar) = sqrt(sum((Delay - mean_delay_mea).^2.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear));
    
    snr_hor = mean(SNR(ant_tar,:));
    NF_hor = -snr_hor - 10*log10(Nifftall) + 12; %noise floor,15dB margin????
end
Gain_receiver = 55; % the receiver Gain is about 55dB , which can be find in the Sora receiver
PowerT_mea = 15;% transmitte power of SORA
power_mea_dB = 10*log10(power_mea);
path_loss_mea = power_mea_dB - Gain_receiver + PowerT_mea;
 
%%  several point PDP figure 
figure(1);
plot(Delay,pdp_mea_norm_tar,'-g',time_delay_v1_norm(1,:),power_received_ray_dB_v1_norm(1,:),'-b',time_delay_v2_norm(1,:),power_received_ray_dB_v2_norm(1,:),'--r','linewidth',2);
title('Power Delay Profile');
xlabel('Delay (ns)');
ylabel('PDP(Level to the Peak, dB)');
 legend('Measured','Ray tracing simple','Ray tracing considering wall')
      
%%  Sum Power Figure
% power_received_ray_v1_linear = 10.^(power_received_ray_dB_v1_temp./10);
 %power_received_ray_v2_linear = 10.^(power_received_ray_dB_v2./10);
 power_sum_v1 = sum(power_received_ray_v1_linear,2);
 power_sum_v2 = sum(power_received_ray_v2_linear,2);
 power_sum_v1_dB = 10.*log10(power_sum_v1);
 power_sum_v2_dB = 10.*log10(power_sum_v2);
 pathloss_v1_dB = power_sum_v1_dB-20 ;
 pathloss_v2_dB = power_sum_v2_dB-20;
 
 
 figure(2)
 plot(1:antenna_num,-power_mea_dB,'-g',1:antenna_num,-pathloss_v1_dB(antenna_num:-1:1,:),'-b',1:antenna_num,-pathloss_v2_dB(1:antenna_num,:)+10,'--r','linewidth',2);
 %title('Path Loss')
 xlabel('Antenna ID');
 ylabel('Path Loss(dB)');
 legend('Measured','Ray tracing simple','Ray tracing considering wall & polarity')
 
 %% RMS figure
 figure(3)
 plot(1:antenna_num,rms_delay_mea(1,1:antenna_num),'-g',1:antenna_num,rms_delay_v1(1,1:antenna_num),'-b',1:antenna_num,rms_delay_v2(1,1:antenna_num),'--r','linewidth',2);
 xlabel('Antenna ID');
 ylabel('RMS(Root Mean Square,ns)');
 legend('Measured','Ray tracing simple','Ray tracing considering wall')
 
 %% K value calculate
 
 
 
      