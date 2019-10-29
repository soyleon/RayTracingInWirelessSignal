% draw cdf of 64 arrays in the hallsimulation

load TimeDelay_vs_Antenna;
delay_ray = ArrayFromSmallToBig;
load PDP_vs_Antenna;
pdp_ray = PDPrank;

load H_comp_valid_dB;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

and_num = 95;
Nifftall = 640; %整体频域信道ifft点数，得h(t)
T0all = 5; % ns



for ant_tar = 1:64;
    
Len = 64; %显示部分
Delay = (0:Len-1)*T0all; %ns
[val, id] = max(pdp_mea(ant_tar,:));
pdp_mea_norm = pdp_mea(ant_tar,:) - val;
pdp_mea_norm_tar = pdp_mea_norm(id:id+Len-1);%measured data 


% snr_hor = mean(SNR(ant_tar,:));
% NF_hor = -snr_hor - 10*log10(Nifftall) + 12; %noise floor,15dB margin


valid_ray_id1 = find(pdp_ray(ant_tar,:) ~= -Inf);
pdp_ray_norm_tar = pdp_ray(ant_tar,valid_ray_id1) - pdp_ray(ant_tar,valid_ray_id1(1)); %时延已按从小到大排列
delay_ray_norm_tar = delay_ray(ant_tar,valid_ray_id1) - delay_ray(ant_tar,valid_ray_id1(1));


% valid_ray = find(pdp_ray_norm_tar(1,:)>NF_hor);
% pdp_ray_norm_tar = pdp_ray_norm_tar(1,valid_ray);
% delay_ray_norm_tar = delay_ray_norm_tar(1,valid_ray);
% 
% valid_mea = find(pdp_mea_norm_tar(1,:)>NF_hor);
% pdp_mea_norm_tar = pdp_mea_norm_tar(1,valid_mea);
% Delay = Delay(1,valid_mea);

[Delay_common,num_valid_ray_id,num_Delay] = intersect(delay_ray_norm_tar,Delay);


pdp_mea_norm_tar = pdp_mea_norm_tar(1,num_Delay(:,1));
pdp_linear = 10.^(pdp_mea_norm_tar/10);
mean_delay = sum(Delay_common.*pdp_linear)/sum(pdp_linear);
pdp_measured(ant_tar) = sum(pdp_linear);
rms_delay(ant_tar) = sqrt(sum((Delay_common - mean_delay).^2.*pdp_linear)/sum(pdp_linear));


pdp_ray_norm_tar = pdp_ray_norm_tar(1,num_valid_ray_id(:,1));
pdp_linear_ray = 10.^(pdp_ray_norm_tar/10);
mean_delay_ray = sum(Delay_common.*pdp_linear_ray)/sum(pdp_linear_ray);
pdp_raytracing(ant_tar) = sum(pdp_linear_ray);
rms_delay_ray(ant_tar) = sqrt(sum((Delay_common - mean_delay_ray).^2.*pdp_linear_ray)/sum(pdp_linear_ray));





% error{1,ant_tar} = abs(pdp_mea_norm_tar-pdp_ray_norm_tar);
% 
% dB = 1:13;
% for i = 1:13
%     error_probability(i) = size(find(error{1,ant_tar}<dB(i)),2)/size((Delay_common),2);
% end
%figure(ant_tar);
% figure(1)
% hold on;
% plot(dB,error_probability)


% error_mean(1,ant_tar) = sum(error{1,ant_tar})/size((Delay_common),2);
% error_sd(1,ant_tar) = std(error{1,ant_tar},0,2);

end

pdp_error_ratio = pdp_measured./pdp_raytracing;
pdp_error_ratio_db = 10.*log10(pdp_error_ratio);
rms_error = rms_delay - rms_delay_ray;

figure(1)
plot(1:64,rms_delay,'-b','linewidth',2);
hold on;
plot(1:64,rms_delay_ray,'.-r','linewidth',2);
legend('Measured','Simulated');
xlabel('Antenna ID')
ylabel('Root Mean Square');

figure(2)
plot(1:64,rms_error);



% figure(1);
% cdfplot(error_mean);
% %title('mean value');
% xlabel('difference value between measured power and simulated power(dB)')
% ylabel('probability')
% figure(2)
% cdfplot(error_sd);
% %title('standard deviation');
% xlabel('difference value between measured power and simulated power(dB)')
% ylabel('probablity')



