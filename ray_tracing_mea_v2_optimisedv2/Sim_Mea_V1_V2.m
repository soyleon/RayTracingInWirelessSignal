clear all

antenna_num = 64;
load H_comp_all.mat;
Nifftall = 640;
load(['G:\fuqiuhao\Raytraing_Platform\raytracing_matlab_simulation\ray_tracing_office_fuqiuhao\rayTracing_data\rayTracing_v1_indoor_tx1_rx1\office_64_5G.mat']);
pathloss_v1_dB = pl;
power_received_ray_dB_v1_temp = pr22;
power_received_ray_dB_v1_norm = pr22;
time_delay_v1_temp = td;
time_delay_v1_norm = td;
for  ant_temp = 1:antenna_num
    h_comp_all(ant_temp,:) = ifft(H_comp_all(ant_temp,:),Nifftall);
    h_comp_valid_dB(ant_temp,:) = 20*log10(abs(h_comp_all(ant_temp,1:Nifftall/2)));
    
    
    [time_delay_v1_norm(ant_temp,:),t_index_v1] = sort(time_delay_v1_norm(ant_temp,:));
    
    power_received_ray_dB_v1_norm(ant_temp,:) = power_received_ray_dB_v1_norm(ant_temp,t_index_v1);
    power_received_ray_v1_linear(ant_temp,:)=power_received_ray_dB_v1_norm(ant_temp,:);
    time_delay_v1_temp(ant_temp,:) = time_delay_v1_norm(ant_temp,:);
    
    time_delay_valid_v1 = find(time_delay_v1_norm(ant_temp,:)~=0);
    
    power_received_ray_v1_linear(ant_temp,time_delay_valid_v1(1,1):end) = 10.^(power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end)/10);
    mean_power_v1 = sum(power_received_ray_v1_linear(ant_temp,:).*time_delay_v1_temp(ant_temp,:))./sum(power_received_ray_v1_linear(ant_temp,:));
    rms_delay_v1(ant_temp) = sqrt(sum((time_delay_v1_norm(ant_temp,:)-mean_power_v1).^2.*power_received_ray_v1_linear(ant_temp,:))/sum(power_received_ray_v1_linear(ant_temp,:)));
    
    time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1));
    power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1));
    
    
    %%
    load(['G:\fuqiuhao\Raytraing_Platform\raytracing_matlab_simulation\ray_tracing_office_fuqiuhao\rayTracing_data\rayTracing_v2_indoor_tx1_rx1\20180506_optimisedv2_5G_p_w_d\indoor_Rv0.2_antenna',num2str(ant_temp),'.mat']);
    E_received_sum = abs(sum(E_received(3,:)));
    power_received_sum = E_received_sum^2*wavelength^2/(8*pi*enta);
    pathloss_sum_dB = 10*log10(pt_ray./power_received_sum);
    pathloss_v2_dB(1,ant_temp) = pathloss_sum_dB;
    rms_delay_v2(1,ant_temp) = RMS;
    num_ray = size(time_delay);
    ray_num = 0;
    for num_ray_i = 1:num_ray(1,2)
        if time_delay(1,num_ray_i) == 0
            continue;
        else
            ray_num = ray_num+1;
             time_delay_v2_temp(ant_temp,ray_num) = time_delay(1,num_ray_i);
             power_received_ray_dB_v2_temp(ant_temp,ray_num) = power_received_ray_dB(1,num_ray_i);
             power_received_ray_v2_linear(ant_temp,ray_num) = power_received_ray(1,num_ray_i);
            
            ZenithOA(ant_temp,num_ray_i) = acosd(dot(Arrived_vec(1:3,num_ray_i),[0,0,1]));
            if Arrived_vec(2,num_ray_i)>=0
                AzimuthOA(ant_temp,num_ray_i) = acosd(dot(Arrived_vec(1:3,num_ray_i),[1,0,0]));
            else
                AzimuthOA(ant_temp,num_ray_i) = 360-acosd(dot(Arrived_vec(1:3,num_ray_i),[1,0,0]));
            end
            ZenithOD(ant_temp,num_ray_i) = acosd(dot(Departure_vec(1:3,num_ray_i),[0,0,1]));
            if Departure_vec(2,num_ray_i)>=0
                AzimuthOD(ant_temp,num_ray_i) = acosd(dot(Departure_vec(1:3,num_ray_i),[1,0,0]));
            else
                AzimuthOD(ant_temp,num_ray_i) = 360-acosd(dot(Departure_vec(1:3,num_ray_i),[1,0,0]));
            end
        end
    end
%      mean_power_v2 = sum(power_received_ray_v2_linear(ant_temp,:).*time_delay_v2_temp(ant_temp,:))/sum(power_received_ray_v2_linear(ant_temp,:));
%      rms_delay_v2(ant_temp) = sqrt(sum((time_delay_v2_temp(ant_temp,:)-mean_power_v2).^2.*power_received_ray_v2_linear(ant_temp,:))/sum(power_received_ray_v2_linear(ant_temp,:)));
    
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
    time_delay_v2_norm(ant_temp,time_delay_valid_v2(1,1):end) = time_delay_v2_norm(ant_temp,time_delay_valid_v2(1,1):end) - time_delay_v2_norm(ant_temp,time_delay_valid_v2(1,1));
    power_received_ray_dB_v2_norm(ant_temp,time_delay_valid_v2(1,1):end) = power_received_ray_dB_v2_norm(ant_temp,time_delay_valid_v2(1,1):end) - power_received_ray_dB_v2_norm(ant_temp,time_delay_valid_v2(1,1));
end

%% Measured data


pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

%and_num = 95;
%Nifftall = 640; %整体频域信道ifft点数，得h(t)
T0all = 5; % ns

Len = 20; %显示部分
Delay = (0:Len-1)*T0all; %ns


for ant_tar = 1:64;
    [val, id] = max(pdp_mea(ant_tar,:));
    
    pdp_mea_norm(ant_tar,:) = pdp_mea(ant_tar,:) - val;%Norm
    pdp_mea_norm_tar(ant_tar,:) = pdp_mea_norm(ant_tar,id:id+Len-1);%  the max value is directed ray
    pdp_mea_tar = pdp_mea(ant_tar,id:id+Len-1);% UNNORM
    pdp_mea_tar_linear = 10.^(pdp_mea_tar./10); % Measured Linear value
    power_mea(ant_tar,:) = sum(pdp_mea_tar_linear);
    mean_delay_mea = sum(Delay.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear);
    %pow2_delay_mea = sum(Delay.^2.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear);
    %rms_delay_mea(ant_tar) = sqrt(pow2_delay_mea-mean_delay_mea.^2);
    rms_delay_mea(ant_tar) = sqrt(sum((Delay - mean_delay_mea).^2.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear));
    
    snr_hor = mean(SNR(ant_tar,:));
    NF_hor = -snr_hor - 10*log10(Nifftall) + 12; %noise floor,15dB margin????
end

Pt = -15.2; % dB,transmitted power and frequency line attenuation
power_received_mea = [-67.355,-73.016,-66.685,-65.453,-62.143,-60.441,-62.313,...
    -67.049,-63.963,-63.539,-71.711,-65.599,-64.453,-65.990,-64.638,-63.703,-65.417,...
    -64.967,-66.031,-67.772,-64.362,-62.678,-65.713,-68.095,-67.472,-62.677,-64.335,...
    -63.559,-68.439,-65.100,-62.310,-66.064,-70.209,-73.739,-64.500,-61.363,-63.015,...
    -72.789,-69.377,-66.464,-66.593,-66.851,-65.011,-64.850,-61.944,-63.359,-67.904,-72.261,...
    -68.342,-68.973,-64.271,-60.984,-60.687,-63.474,-65.499,-65.987,-68.924,-74.189,...
    -68.599,-62.790,-60.813,-63.547,-68.327,-71.717];
pathloss_mea_dB = Pt-power_received_mea;
% Gain_receiver = 55+50; % the receiver Gain is about 55dB , which can be find in the Sora receiver
% PowerT_mea = 15;% transmitte power of SORA
% power_mea_dB = 10*log10(power_mea);
% path_loss_mea = power_mea_dB - Gain_receiver + PowerT_mea;

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
    
    
%%  several point PDP figure
pdp_num_ant = 3;
figure
plot(Delay,pdp_mea_norm_tar(pdp_num_ant,:),'-g',time_delay_v1_normtemp,power_received_ray_dB_v1_normtemp,'-b',time_delay_v2_normtemp,power_received_ray_dB_v2_normtemp,'--r',Delay,ones(1,Len)*NF_hor,'-y','linewidth',2);
title('Power Delay Profile');
xlabel('Delay (ns)');
ylabel('PDP(Level to the Peak, dB)');
legend('Measured','Ray tracing simple','Ray tracing considering wall&polarity')
figure
plot(Delay,pdp_mea_norm_tar(pdp_num_ant,:),'-g',time_delay_per5_v1_sorted,power_received_per5_dB_v1_sorted,'-b',time_delay_per5_v2_sorted,power_received_per5_dB_v2_sorted,'--r',Delay,ones(1,Len)*NF_hor,'-y','linewidth',2);
title('Power Delay Profile');
xlabel('Delay (ns)');
ylabel('PDP(Level to the Peak, dB)');
legend('Measured','Ray tracing simple','Ray tracing considering wall&polarity')
%%  Sum Power Figure

%power_sum_v1 = sum(power_received_ray_v1_linear,2)/pt;
%power_sum_v2 = sum(power_received_ray_v2_linear,2);
%power_sum_v1_dB = 10.*log10(power_sum_v1);
%power_sum_v2_dB = 10.*log10(power_sum_v2);
%pathloss_v1_dB = power_sum_v1_dB ;
%pathloss_v2_dB = power_sum_v2_dB-20;


figure
plot(1:antenna_num,pathloss_mea_dB,'-g',1:antenna_num,pathloss_v1_dB,'-b',1:antenna_num,pathloss_v2_dB(1,1:antenna_num),'--r','linewidth',2);
%title('Path Loss')
xlabel('Antenna ID');
ylabel('Path Loss(dB)');
legend('Measured','Ray tracing simple','Ray tracing considering wall&polarity')
error_pathloss_v1 = pathloss_mea_dB-pathloss_v1_dB;
error_pathloss_v2 = pathloss_mea_dB-pathloss_v2_dB;

%% RMS figure
figure
plot(1:antenna_num,rms_delay_mea(1,1:antenna_num),'-g',1:antenna_num,rms_delay_v1(1,1:antenna_num),'-b',1:antenna_num,rms_delay_v2(1,1:antenna_num),'--r','linewidth',2);
xlabel('Antenna ID');
ylabel('RMS(Root Mean Square,ns)');
legend('Measured','Ray tracing simple','Ray tracing considering wall&polarity')
error_rms_v1 = rms_delay_mea-rms_delay_v1;
error_rms_v2 = rms_delay_mea-rms_delay_v2;

figure
plot(1:antenna_num,rms_delay_mea(1,1:antenna_num),'-g',1:antenna_num,rms_per5_v1(1,1:antenna_num),'-b',1:antenna_num,rms_per5_v2(1,1:antenna_num),'--r','linewidth',2);
xlabel('Antenna ID');
ylabel('RMS(Root Mean Square,ns)');
legend('Measured','Ray tracing simple','Ray tracing considering wall&polarity')
error_rms_v1 = rms_delay_mea-rms_delay_v1;
error_rms_v2 = rms_delay_mea-rms_delay_v2;


%% K value calculate

%% Angular Spread Figure
figure
AzimuthOA(1,91) = 180-73;
stem(AzimuthOA(1,:),power_received_ray_v2_linear(1,:),'linewidth',2);
xlabel('Azimuth of Arival, units:°');
ylabel('Received Power, units:mw');

figure
stem(ZenithOA(1,:),power_received_ray_v2_linear(1,:),'linewidth',2);
xlabel('Zenith of Arival, units:°');
ylabel('Received Power, units:mw');

figure
stem(AzimuthOD(1,:),power_received_ray_v2_linear(1,:),'linewidth',2);
xlabel('Azimuth of Departure, units:°');
ylabel('Received Power, units:mw');

figure
stem(ZenithOD(1,:),power_received_ray_v2_linear(1,:),'linewidth',2);
xlabel('Zenith of Departure, units:°');
ylabel('Received Power, units:mw');


