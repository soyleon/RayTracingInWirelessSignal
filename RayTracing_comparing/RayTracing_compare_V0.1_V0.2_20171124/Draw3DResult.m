
load('HallSimulation2.mat');
t = 0;
% for AntennaId = 1:u
%     for m = 0:n0-1
%         if td(AntennaId , m+1) ~= 0;
%             t = t+1;
%             data1(t , 1) = AntennaId;
%             data1(t , 2) = td(AntennaId , m+1);
%             data1(t, 3) = pr21(AntennaId , m+1);
%             
%         end
%     end 
% end
% 
% 
% [AntennaId,Delay]=meshgrid(1:u,1:150);  %生成网格点
% Pathloss=griddata(data1(:,1),data1(:,2),data1(:,3),AntennaId,Delay);%你的数据得插值成网格型数据。
% surf(AntennaId,Delay,Pathloss);
% shading interp;
% title('Pathloss Delay Profile');
% xlabel('Antenna ID');
% ylabel('Delay(ns)');
% zlabel('Pathloss');
% 
% 
% figure(2);
% plot3(data1(:,1) , data1(:,2), data1(:,3),'*');
% title('Power Delay Profile');
% xlabel('Antenna ID');
% ylabel('Delay(ns)');
% zlabel('PDP (Level to the Peak , dB)');


% for AntennaId = 1:64
%     for m = 0:n0-2
%         if td{1,AntennaId}(1 , m+1) ~= 0;
%             t = t+1;
%             data1(t , 1) = AntennaId;
%             data1(t , 2) = td{1,AntennaId}(1 , m+1);
%             data1(t, 3) = 10*log10(pr21{1,AntennaId}(1 , m+1)/pt0);
%             
%         end
%     end 
% end
% 
% 
% figure(1);
% [AntennaId,Delay]=meshgrid(1:64,1:150);  %生成网格点
% Power=griddata(data1(:,1),data1(:,2),data1(:,3),AntennaId,Delay);%你的数据得插值成网格型数据。
% surf(AntennaId,Delay,Power);
% shading interp;
% title('Power Delay Profile');
% xlabel('Antenna ID');
% ylabel('Delay(ns)');
% zlabel('PDP (Level to the Peak , dB)');
% 
% 
% 
% figure(2);
% plot3(data1(:,1) , data1(:,2), data1(:,3),'*');
% title('Power Delay Profile');
% xlabel('Antenna ID');
% ylabel('Delay(ns)');
% zlabel('PDP (Level to the Peak , dB)');

% for AntennaId = 1:64
%     for m = 0:n0-2
%         if td{1,AntennaId}(1 , m+1) ~= 0;
%             t = t+1;
%             data1(t , 1) = AntennaId;
%             data1(t , 2) = td{1,AntennaId}(1 , m+1);
%             data1(t, 3) = pl0{1,AntennaId}(1 , m+1);
%             
%         end
%     end 
% end
% 
% 
% figure(3);
% [AntennaId,Delay]=meshgrid(1:64,1:150);  %生成网格点
% Pathloss=griddata(data1(:,1),data1(:,2),data1(:,3),AntennaId,Delay);%你的数据得插值成网格型数据。
% surf(AntennaId,Delay,Pathloss);
% shading interp;
% title('PathLoss Delay Profile');
% xlabel('Antenna ID');
% ylabel('Delay(ns)');
% zlabel('PathLoss(dB)');


for AntennaId = 1:64
    for m = 0:n0-2
        if td{1,AntennaId}(1 , m+1) ~= 0;
            t = t+1;
            data1(t , 1) = AntennaId;
            data1(t , 2) = td{1,AntennaId}(1 , m+1);
            data1(t, 3) = pr22{1,AntennaId}(1 , m+1);
            
        end
    end 
end


figure(4);
[AntennaId,Delay]=meshgrid(1:64,1:150);  %生成网格点
AOA=griddata(data1(:,1),data1(:,2),data1(:,3),AntennaId,Delay);%你的数据得插值成网格型数据。
surf(AntennaId,Delay,AOA);%angle of arrived
shading interp;
title('AOA vs Delay vs AntennaID');
xlabel('Antenna ID');
ylabel('Delay(ns)');
zlabel('AOA');

