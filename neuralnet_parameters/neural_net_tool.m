%使用用输入输出数据（inputData、outputData）建立网络，  
%隐节点个数设为3.其中隐层、输出层的传递函数分别为tansig和purelin，使用trainlm方法训练。
clear all
close all

load('neural_data4.mat');
inputData = pathloss_sum_dB(:,1:259);
outputData = [permitivity(1,1:259);conductivity(1,1:259)];
net =newff(inputData,outputData,12,{'tansig','purelin'},'trainlm');  %设置一些常用参数
net.trainparam.goal =0.00001; %训练目标：均方误差低于0.0001  
net.trainparam.show =500;   %每训练400次展示一次结果  
net.trainparam.epochs =1500;  %最大训练次数：15000.  
net.divideFcn = '';  
[net,tr] =train(net,inputData,outputData);%调用matlab神经网络工具箱自带的train函数训练网络  

%load('neural_testdata5.mat');



Pt = -15.2; % dB,transmitted power and frequency line attenuation
power_received_mea = [-67.355,-73.016,-66.685,-65.453,-62.143,-60.441,-62.313,...
    -67.049,-63.963,-63.539,-71.711,-65.599,-64.453,-65.990,-64.638,-63.703,-65.417,...
    -64.967,-66.031,-67.772,-64.362,-62.678,-65.713,-68.095,-67.472,-62.677,-64.335,...
    -63.559,-68.439,-65.100,-62.310,-66.064,-70.209,-73.739,-64.500,-61.363,-63.015,...
    -72.789,-69.377,-66.464,-66.593,-66.851,-65.011,-64.850,-61.944,-63.359,-67.904,-72.261,...
    -68.342,-68.973,-64.271,-60.984,-60.687,-63.474,-65.499,-65.987,-68.924,-74.189,...
    -68.599,-62.790,-60.813,-63.547,-68.327,-71.717];
pathloss_mea_dB = Pt-power_received_mea;
input= pathloss_mea_dB';
simout =sim(net,input); %调用matlab神经网络工具箱自带的sim函数得到网络的预测值  

% Pt_2 = -18.057; % dB,transmitted power and frequency line attenuation
% power_received_mea = [-71.51,-73.78,-74.86,-74.07,-79.24,-78.54,-75.09,-77.065,-76.50,...
%     -74.61,-80.61,-81.54,-79.51,-72.04,-85.01,-76.26,-79.26,-77.19,-74.27,-82.38,-83.13,-72.27,...
%     -74.64,-82.18,-77.03,-79.40,-74.50,-73.442,-78.114,-76.50,-81.23,-71.08,-75.12,...
%     -80.34,-80.16,-89.17,-79.11,-74.01,-75.77,-78.26,-90.0,-81.50,-85.14,-85.60,-80.72,-69.17,...
%     -75.20,-82.21,-89.92,-76.23,-85.77,-74.04,-73.61,-73.79,-72.05,-70.06,-71.08,-69.32,-74.53,...
%     -69.44,-72.13,-78.07,-70.16,-78.25];
% pathloss_mea_dB = Pt_2-power_received_mea;
% input= pathloss_mea_dB';
% simout =sim(net,input); %调用matlab神经网络工具箱自带的sim函数得到网络的预测值  

%test 
 for i = 1:20
     testout(1:2,i) = sim(net,pathloss_sum_dB(:,i));
 end
 
 figure
 plot(1:20,testout(1,:),'*r',1:20,permitivity(1:20),'-b','linewidth',2);
 xlabel('test ID');
 ylabel('permittivity');
 legend('test case','actual value');
 
 figure
  plot(1:20,testout(2,:),'*r',1:20,conductivity(1:20),'-b','linewidth',2);
 xlabel('test ID');
 ylabel('conductivity');
 legend('test case','actual value');

load('neural_testdata5.mat');
%test 
 for i = 1:20
     testout(1:2,i) = sim(net,pathloss_sum_dB(:,i));
 end
 
 figure
 plot(1:20,testout(1,:),'*r',1:20,permitivity(1:20),'-b','linewidth',2);
 xlabel('test ID');
 ylabel('permittivity');
 legend('test case','actual value');
 
 figure
  plot(1:20,testout(2,:),'*r',1:20,conductivity(1:20),'-b','linewidth',2);
 xlabel('test ID');
 ylabel('conductivity');
 legend('test case','actual value');