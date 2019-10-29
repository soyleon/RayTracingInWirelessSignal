%Save the Power paramenter and Timedelay data from small to big in order
%to make it easily draw every rays compared to the real measured data
%Plus: the timedelay is 5ns divided, because the SORA measuring platform
%has a sensitivity of 5ns. The power is added per 5ns to corresponde to
%reality

clear
load('office_64.mat');
for i=1:64   %number of antennas
    ArrayFromSmallToBig2(i,:) = td(i,:);  %put the timedelay paramenters in ArrayFromSmallToBig 
    for k = 1:30  %30 is a number that conform the timedelay is less than 
        E_5ns(i,k) = 0; %Initialize the E field per 5ns
        td_5ns(i,k) = 0;  %Initialize the Timedelay per 5ns
        RayNum = size(td(i,:)>0);  %Note the ray number
        for j = 1:RayNum(1,2)
            if floor((td(i,j))./5) == k   %While the td is within [2.5+5n.7.5+5n], the timedelay is all 5n;
                td_5ns(i,k) = 5*k;                
                E_5ns(i,k) = pr2(i,j)+E_5ns(i,k); % add the e field per 5ns
            end
        end
     E_5ns_abs(i,k) = abs(E_5ns(i,k)); % The e field in ray launching is complexity,get the E value with abs
     Power_5ns(i,k) = pt0*2*pi/l.*E_5ns_abs(i,k)^2; %Calculate the received power (unit 'mw')
     PDPrank1(i,k) =10*log10(Power_5ns(i,k));    %Transform the received power unit as dBm(the calculated power unit is 'mw')
     ArrayFromSmallToBig1(i,k) = td_5ns(i,k); % Put the timedelay in the ArrayFromSmallToBig1
     %[ArrayFromSmallToBig{1,i},RankID{1,i}] = sort(ArrayFromSmallToBig1{1,i},2);
            %PDPrank{1,i}=PDPrank1{1,i}(RankID{1,i});
    end
    [ArrayFromSmallToBig(i,:),RankID(i,:)] = sort(ArrayFromSmallToBig1(i,:),2);%Rank the timedelay
    PDPrank(i,:)=PDPrank1(i,RankID(i,:));  % the power value is correspond to the timedelay
end
save('PDP_vs_Antenna.mat','PDPrank');
save('TimeDelay_vs_Antenna.mat','ArrayFromSmallToBig');