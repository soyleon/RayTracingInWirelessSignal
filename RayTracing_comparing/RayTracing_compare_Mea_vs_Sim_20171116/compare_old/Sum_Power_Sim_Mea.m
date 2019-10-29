% sum the power of every antenna , then compare the measurement and the
% raytracing  result
close all;
clear;
%load Ray tracing result
load TimeDelay_vs_Antenna;
delay_ray = ArrayFromSmallToBig;
load PDP_vs_Antenna;
pdp_ray = PDPrank;
%load Measurement result
load h_comp_valid_dB.mat;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

ant_num = 64;% antenna number
Nifft_all = 640;% frequency channel ifft number, h(t);
T0all = 5; % ns;

Len = 30; % display from 0 to 30*5ns
Delay = (0:Len-1)*T0all;  % time delay 

for ant_tar = 1:ant_num
    [var,id] = max(pdp_mea(ant_tar,:));
    pdp_mea_tar = pdp_mea(ant_tar,id:id+Len-1);
    
    snr_hor = mean(SNR(ant_tar,:));
    NoiseFloor_hor = -snr_hor - 10*log10(Nifft_all)+12; %noise floor ,15dB margin % ???? why does it add the Nifft
    
    valid_ray_id = find(pdp_ray(ant_tar,:) ~= -Inf);
    pdp_ray_tar = pdp_ray(ant_tar,valid_ray_id); % the version 1 make a mistake that the transmitter emitted rays that divided the power to every ray
    delay_ray_tar = delay_ray(ant_tar,valid_ray_id);
    
    pdp_mea_tar_linear = 10.^(pdp_mea_tar./10);
    pdp_ray_tar_linear = 10.^(pdp_ray_tar./10);
    power_mea(ant_tar,:) = sum(pdp_mea_tar_linear);
    power_ray(ant_tar,:) = sum(pdp_ray_tar_linear);
    
end

power_mea_dB = 10*log10(power_mea);
power_ray_dB = 10*log10(power_ray);



plot(1:64,power_mea_dB-70,'b-',1:64,power_ray_dB,'r--','linewidth',2);
xlabel('Antenna ID');
ylabel('Path Loss');
legend('Measured','Simulated');