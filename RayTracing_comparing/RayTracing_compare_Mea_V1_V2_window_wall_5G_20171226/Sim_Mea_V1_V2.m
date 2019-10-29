clear all

antenna_num = 64;
load H_comp_all.mat;
Nifftall = 640;

load(['office_64_5G.mat']);
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
    
    time_delay_valid_v1 = find(time_delay_v1_norm(ant_temp,:)~=0);
    
    power_received_ray_v1_linear(ant_temp,time_delay_valid_v1(1,1):end) = 10.^(power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end)/10);
    mean_power_v1 = sum(power_received_ray_v1_linear(ant_temp,:).*time_delay_v1_norm(ant_temp,:))./sum(power_received_ray_v1_linear(ant_temp,:));
    rms_delay_v1(ant_temp) = sqrt(sum((time_delay_v1_norm(ant_temp,:)-mean_power_v1).^2.*power_received_ray_v1_linear(ant_temp,:))/sum(power_received_ray_v1_linear(ant_temp,:)));
       
    time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - time_delay_v1_norm(ant_temp,time_delay_valid_v1(1,1));    
    power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) = power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1):end) - power_received_ray_dB_v1_norm(ant_temp,time_delay_valid_v1(1,1));    


%%
    load(['E:\fuqiuhao\Raytraing_Platform\raytracing_matlab_simulation\ray_tracing_office_fuqiuhao\rayTracing_data\rayTracing_v2_indoor_tx1_rx1\20171225_wall_5G\indoor_Rv0.2_antenna',num2str(ant_temp),'.mat']);
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
%load h_comp_valid_dB.mat;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

%and_num = 95;
%Nifftall = 640; %整体频域信道ifft点数，得h(t)
T0all = 5; % ns

Len = 30; %显示部分
Delay = (0:Len-1)*T0all; %ns

for ant_tar = 1:64;
    [val, id] = max(pdp_mea(ant_tar,:));
    
    pdp_mea_norm = pdp_mea(ant_tar,:) - val;%Norm
    pdp_mea_norm_tar = pdp_mea_norm(id:id+Len-1);%  the max value is directed ray
    pdp_mea_tar = pdp_mea(ant_tar,id:id+Len-1);% UNNORM
    pdp_mea_tar_linear = 10.^(pdp_mea_tar./10); % Measured Linear value
    power_mea(ant_tar,:) = sum(pdp_mea_tar_linear);
    mean_delay_mea = sum(Delay.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear);
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

% Gain_receiver = 55; % the receiver Gain is about 55dB , which can be find in the Sora receiver
% PowerT_mea = 15;% transmitte power of SORA
% power_mea_dB = 10*log10(power_mea);
% path_loss_mea = power_mea_dB - Gain_receiver - PowerT_mea;
 
%%  several point PDP figure 
figure(1);
plot(Delay,pdp_mea_norm_tar,'-g',time_delay_v1_norm(1,:),power_received_ray_dB_v1_norm(1,:),'-b',time_delay_v2_norm(1,:),power_received_ray_dB_v2_norm(1,:),'--r',Delay,ones(1,Len)*NF_hor,'-y','linewidth',2);
title('Power Delay Profile');
xlabel('Delay (ns)');
ylabel('PDP(Level to the Peak, dB)');
legend('Measured','Ray tracing V1','Ray tracing V2')
      
%%  Sum Power Figure
% power_received_ray_v1_linear = 10.^(power_received_ray_dB_v1_temp./10);
 %power_received_ray_v2_linear = 10.^(power_received_ray_dB_v2./10);
% power_sum_v1 = sum(power_received_ray_v1_linear,2)/10^3/pt0;
 power_sum_v2 = sum(power_received_ray_v2_linear,2);
 %power_sum_v1_dB = 10.*log10(power_sum_v1);
 power_sum_v2_dB = 10.*log10(power_sum_v2);
 %pathloss_v1_dB = power_sum_v1_dB ;
 pathloss_v2_dB = power_sum_v2_dB-20;
 
 
 figure(2)
 plot(1:antenna_num,pathloss_mea_dB,'-g',1:antenna_num,pathloss_v1_dB(1,1:antenna_num),'-b',1:antenna_num,-pathloss_v2_dB(1:antenna_num,:),'--r','linewidth',2);
 %title('Path Loss')
 xlabel('Antenna ID');
 ylabel('Path Loss(dB)');
 legend('Measured','Ray tracing simple','Ray tracing considering wall')
 
 %% RMS figure
 figure(3)
 plot(1:antenna_num,rms_delay_mea(1,1:antenna_num),'-g',1:antenna_num,rms_delay_v1(1,1:antenna_num)+3.5,'-b',1:antenna_num,rms_delay_v2(1,1:antenna_num),'--r','linewidth',2);
 xlabel('Antenna ID');
 ylabel('RMS(Root Mean Square ns)');
 legend('Measured','Ray tracing simple','Ray tracing considering wall')
 
 %% K value calculate
 
 
 
      