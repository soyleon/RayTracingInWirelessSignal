%% it's a time and ray number compare of ray tracing

a = [10,9,8,7,6,5,4,3,2,1.5,1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2];
ray_num = [146,145,152,167,176,174,201,205,224,234,233,239,222,237,243,229,229,235,245];
time = [2.8,3.6,4.1,5.1,6.8,9.3,14.1,24.6,39.7,106.2,207.3,256.5,325.0,420.6,572.7,860.1,1307.2,1717.0,4108.4];

figure(1);
plot(19:-1:1,ray_num,'linewidth',2);
xlabel('Launching Angular Gap (units:degree)');
ylabel('Received Ray Number ')
set(gca,'XTick',1:1:19);
set(gca,'XTickLabel',{'0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.5','2.0','3.0','4.0','5.0','6.0','7.0','8.0','9.0','10.0'});

figure(2);
plot(19:-1:1,time,'linewidth',2);
xlabel('Launching Angular Gap (units:degree)');
ylabel('Operation Time (units:s)');
set(gca,'XTick',1:1:19);
set(gca,'XTickLabel',{'0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.5','2.0','3.0','4.0','5.0','6.0','7.0','8.0','9.0','10.0'});
