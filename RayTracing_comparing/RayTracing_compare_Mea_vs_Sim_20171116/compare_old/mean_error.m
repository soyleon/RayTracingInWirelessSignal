% draw cdf of 64 arrays in the hallsimulation

close all;
clear all;

load TimeDelay_vs_Antenna;
delay_ray = ArrayFromSmallToBig;
load PDP_vs_Antenna;
pdp_ray = PDPrank;

load h_comp_valid_dB.mat;
pdp_mea = h_comp_valid_dB;
load SNR2.mat;
SNR = SNR2;

and_num = 95;
Nifftall = 640; %整体频域信道ifft点数，得h(t)
T0all = 5; % ns
Len = 30; %显示部分
Delay = (0:Len-1)*T0all; %ns
ant_num = 64;
%pdp_mea_norm_tar = zeros(ant_num,Len);

for ant_tar =  1:ant_num;
   
[val, id] = max(pdp_mea(ant_tar,:));
pdp_mea_norm = pdp_mea(ant_tar,:) - val;
pdp_mea_norm_tar = pdp_mea_norm(id:id+Len-1);

snr_hor = mean(SNR(ant_tar,:));
NF_hor = -snr_hor - 10*log10(Nifftall) + 12; %noise floor,15dB margin


valid_ray_id1 = find(pdp_ray(ant_tar,:) ~= -Inf);
pdp_ray_norm_tar = pdp_ray(ant_tar,valid_ray_id1) - pdp_ray(ant_tar,valid_ray_id1(1)); %时延已按从小到大排列
delay_ray_norm_tar = delay_ray(ant_tar,valid_ray_id1) - delay_ray(ant_tar,valid_ray_id1(1));

valid_ray = find(pdp_ray_norm_tar(1,:)>NF_hor);
pdp_ray_norm_tar = pdp_ray_norm_tar(1,valid_ray);
delay_ray_norm_tar = delay_ray_norm_tar(1,valid_ray);

valid_mea = find(pdp_mea_norm_tar(1,:)>NF_hor);
pdp_mea_norm_tar = pdp_mea_norm_tar(1,valid_mea);
Delay_mea = Delay(1,valid_mea);

[Delay_common,num_valid_ray_id,num_Delay] = intersect(delay_ray_norm_tar,Delay_mea);
delay_mea_norm_tar = Delay_mea(1,num_Delay(:,1));
pdp_mea_norm_tar = pdp_mea_norm_tar(1,num_Delay(:,1));
delay_ray_norm_tar = delay_ray_norm_tar(1,num_valid_ray_id(:,1));
pdp_ray_norm_tar = pdp_ray_norm_tar(1,num_valid_ray_id(:,1));
%save(['pdp_mea',num2str(ant_tar),'.mat'],'pdp_mea_norm_tar');
%save(['delay_mea',num2str(ant_tar),'.mat'],'delay_mea_norm_tar');
%save(['delay_ray',num2str(ant_tar),'.mat'],'delay_ray_norm_tar');
%save(['pdp_ray',num2str(ant_tar),'.mat'],'pdp_ray_norm_tar');
error = abs(pdp_mea_norm_tar-pdp_ray_norm_tar);

% dB = 1:26;
% for i = 1:26
%     error_probability(i) = size(find(error(1,:)<dB(i)),2)/size((Delay_common),2);
% end
%figure(ant_tar);
% figure(1)
% hold on;
% plot(dB,error_probability)


%error_mean(1,1) = sum(error(1,:))/size((Delay_common),2);
error_sd = std(error(1,:),0,2);

end
% figure(1);
% cdfplot(error_probability);
% title('mean value');
% xlabel('dB')
% ylabel('probability')
% figure(2)
% cdfplot(error_sd);
% title('standard deviation');
% xlabel('dB')
% ylabel('probablity')



