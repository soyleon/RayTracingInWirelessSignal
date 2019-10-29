% RMS_mea
load H_comp_all.mat;
Nifftall = 640;
antenna_num = 64;
for  ant_temp = 1:antenna_num
    h_comp_all(ant_temp,:) = ifft(H_comp_all(ant_temp,:),Nifftall);
    h_comp_valid_dB(ant_temp,:) = 20*log10(abs(h_comp_all(ant_temp,1:Nifftall/2)));
end

pdp_mea = h_comp_valid_dB;
load SNR2;
SNR = SNR2;

T0all = 5; % ns


Len = 20; %œ‘ æ≤ø∑÷
Delay = (0:Len-1)*T0all; %ns


for ant_tar = 1:64;
    [val, id] = max(pdp_mea(ant_tar,:));
    
    pdp_mea_norm(ant_tar,:) = pdp_mea(ant_tar,:) - val;%Norm
    pdp_mea_norm_tar(ant_tar,:) = pdp_mea_norm(ant_tar,id:id+Len-1);%  the max value is directed ray
    pdp_mea_tar = pdp_mea(ant_tar,id:id+Len-1);% UNNORM
    pdp_mea_tar_linear = 10.^(pdp_mea_tar./10); % Measured Linear value
    power_mea(ant_tar,:) = sum(pdp_mea_tar_linear);
    mean_delay_mea = sum(Delay.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear);
    %pow2_delay_mea = sum((id-1)*T0all.^2.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear);
    %rms_delay_mea(ant_tar) = sqrt(pow2_delay_mea-mean_delay_mea.^2);
    rms_delay_mea(ant_tar) = sqrt(sum((Delay - mean_delay_mea).^2.*pdp_mea_tar_linear)/sum(pdp_mea_tar_linear));
    
end
