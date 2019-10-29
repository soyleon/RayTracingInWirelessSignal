%% 比较实测结果和射线跟踪仿真结果
%2017.4.13

close all;
clear all;

load TimeDelay_vs_Antenna1;
delay_ray = ArrayFromSmallToBigTotal;
load PDP_vs_Antenna;
pdp_ray = PDPrankTotal;

load h_comp_valid_dB1204;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

and_num = 95;
Nifftall = 640; %整体频域信道ifft点数，得h(t)
T0all = 5; % ns

Len = 60; %显示部分
Delay = (0:Len-1)*T0all; %ns

for ant_tar = 1:64;
[val, id] = max(pdp_mea(ant_tar,:));
pdp_mea_norm = pdp_mea(ant_tar,:) - val;
pdp_mea_norm_tar = pdp_mea_norm(id:id+Len-1);

snr_hor = mean(SNR(ant_tar,:));
NF_hor = -snr_hor - 10*log10(Nifftall) + 12; %noise floor,15dB margin


valid_ray_id = find(pdp_ray(ant_tar,:) ~= -Inf);
pdp_ray_norm_tar = pdp_ray(ant_tar,valid_ray_id) - pdp_ray(ant_tar,valid_ray_id(1)); %时延已按从小到大排列
delay_ray_norm_tar = delay_ray(ant_tar,valid_ray_id) - delay_ray(ant_tar,valid_ray_id(1));



figure(ant_tar)
plot(Delay,pdp_mea_norm_tar,'b-',delay_ray_norm_tar,pdp_ray_norm_tar,'ro',Delay,ones(1,Len)*NF_hor,'g--','LineWidth',2)
legend('Measured','Ray Tracing','Noise floor')
grid on;
xlabel('Delay (ns)');
ylabel('PDP (dB)');
end
