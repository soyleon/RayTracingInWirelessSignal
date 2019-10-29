load office_64.mat 
load h_comp_valid_dB.mat;
pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

ant_num = 64;% antenna number
Nifft_all = 640;% frequency channel ifft number, h(t);
T0all = 5; % ns;

Len = 30; % display from 0 to 30*5ns
Delay = (0:Len-1)*T0all;  % time delay 



for i = 1:64
    power_sum(i,:) = sum(pr21(i,:))/pt0;
    power_ray_dB(i,:) = 10.*log10(power_sum(i,:));
    [var,id] = max(pdp_mea(i,:));
    pdp_mea_tar = pdp_mea(i,id:id+Len-1);
    pdp_mea_tar_linear =  10.^(pdp_mea_tar./10);
    snr_hor = mean(SNR(i,:));
    NoiseFloor_hor = -snr_hor - 10*log10(Nifft_all)+12; %noise floor ,15dB margin % ???? why does it add the Nifft
    power_mea(i,:) = sum(pdp_mea_tar_linear);
end

power_mea_dB = 10*log10(power_mea);

plot(1:64,-(power_mea_dB-55),'b-',1:64,-power_ray_dB-15,'r--','linewidth',2);
xlabel('Antenna ID');
ylabel('Path Loss (dB)');
legend('Measured','Simulated');