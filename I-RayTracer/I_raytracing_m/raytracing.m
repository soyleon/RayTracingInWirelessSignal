%%C# call matlab funtion, the funtion is the algorithm of SBR, it traverse
%%every ray in the environment, and it may not judge the correct face if
%%the environment is complicated. So it should be motified at the jduge
%%funcion,to make it can clarifiy the face which the ray can intersect


function [power_received_ray,power_received_ray_dB,power_received_sum,power_received_sum_dB,pathloss_ray,pathloss_ray_dB,pathloss_sum,pathloss_sum_dB,time_delay,RMS,K,K_dB,DOA,DOD] = raytracing(face,power_transmitter,frequency,face_permitivity,face_conductivity,transmitter_number,receiver_num,transmitter_location,receiver_location,antenna_gain)


Height=5;Width=23;Length=20.5;%���ڽ���ߴ磬����λΪ��:m��
WidthPlatform = 5;LengthPlatform = 20.5;HighPlatform = 1.5 ; %��̨�ߴ�,����λΪ��:m��
pt=power_transmitter;%���书��,10mw,��Ӧ10dbm�����뵥λΪmw��
f=frequency;%Ƶ��
c=3e8;
l=c/f;%����

%% ����Ľ��ʵĸ���Խ�糣�����㹫ʽ
%����������Խ�糣��
permitivity0=face_permitivity;  %�������
permitivity5=face_permitivity;  %Զ�����
permitivity1=face_permitivity;  %����
permitivity2=face_permitivity;  %����
permitivity3=face_permitivity;  %��ǽ��
permitivity4=face_permitivity;  %��ǽ��
%�������絼��
conductivity0=face_conductivity;  %�������
conductivity5=face_conductivity;  %Զ�����
conductivity1=face_conductivity;  %����
conductivity2=face_conductivity;  %����
conductivity3=face_conductivity;  %��ǽ��
conductivity4=face_conductivity;  %��ǽ��

e0=permitivity0-1j*60*conductivity0*l;  %�������
e5=permitivity5-1j*60*conductivity5*l;  %Զ�����
e1=permitivity1-1j*60*conductivity1*l;  %����
e2=permitivity2-1j*60*conductivity2*l;  %����
e3=permitivity3-1j*60*conductivity3*l;  %��ǽ��
e4=permitivity4-1j*60*conductivity4*l;  %��ǽ��




%% ����
TransmitterNum = transmitter_number;
ReceiverNum = receiver_num;
%�������
%% ����������
hwait=waitbar(0,'��ȴ�>>>>>>>>');  %����������
number1=0;  %����������
%rcollect = 1.2; %��ʼ������뾶����
%%

for u=1:TransmitterNum % ���ӣ�u��ʾ�������߸���
    for p=1:ReceiverNum %���ӣ�p��ʾ�������߸���
        tx = transmitter_location(u,1);
        ty = transmitter_location(u,2);
        tz = transmitter_location(u,3);
        rx = receiver_location(p,1);
        ry = receiver_location(p,2);
        rz = receiver_location(p,3);
        
        %% ������ͼ
figure(1)
hold on
w = Width;
length = Length;
h = Height;
x=[0 length length 0 0];
y=[0 0 0 0 0];
z=[0 0 h h 0];
plot3(x,y,z,'k','linewidth',3)
hold on
x=[0 0 0 0];
y=[0 w w 0];
z=[0 0 h h];
plot3(x,y,z,'k','linewidth',3)
x=[0 length length];
y=[w w 0];
z=[h h h];
plot3(x,y,z,'k','linewidth',3)
x=[0 length length];
y=[w w 0];
z=[0 0 0];
plot3(x,y,z,'k--')
x=[length length];
y=[w w];
z=[0 h];
plot3(x,y,z,'k--')
plot3(x,y,z,'k--')
plot3(tx,ty,tz,'r.','MarkerSize',20)
plot3(rx,ry,rz,'g.','MarkerSize',20)
plot3([tx,tx],[ty,ty],[0,tz],'k','linewidth',3)
plot3([tx,tx-0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',3)
plot3([tx,tx+0.2],[ty,ty],[tz-0.2,tz],'k','linewidth',3)
plot3([rx,rx],[ry,ry],[0,rz],'k','linewidth',3)
plot3([rx,rx-0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',3)
plot3([rx,rx+0.2],[ry,ry],[rz-0.2,rz],'k','linewidth',3)
x=[0,0,0];
y=[0,WidthPlatform,WidthPlatform];
z=[HighPlatform,HighPlatform,0];
plot3(x,y,z,'k--');
x=[LengthPlatform,LengthPlatform,LengthPlatform];
y=[0,WidthPlatform,WidthPlatform];
z=[HighPlatform,HighPlatform,0];
plot3(x,y,z,'k--');
x=[0,LengthPlatform];
y=[WidthPlatform,WidthPlatform];
z=[HighPlatform,HighPlatform];
plot3(x,y,z,'k--');
hold on;                
x = [0,0,0,0];
y = [0,0,WidthPlatform,WidthPlatform];
z = [0,HighPlatform,HighPlatform,0];
fill3(x,y,z,'g');
x = [0,0,LengthPlatform,LengthPlatform];
y = [0,WidthPlatform,WidthPlatform,0];
z = [HighPlatform,HighPlatform,HighPlatform,HighPlatform];
fill3(x,y,z,'g');
x = [0,0,LengthPlatform,LengthPlatform];
y = [WidthPlatform,WidthPlatform,WidthPlatform,WidthPlatform];
z= [0,HighPlatform,HighPlatform,0];
fill3(x,y,z,'g');    
        
        %% ��������  ��1�����ȷ���������ߵĽǶȼ�����ھ����ϵķǾ��ȽǶȷ��䣿 ��2����α�֤��Ч���Լ�����Ч�ʵķ������߼����
        
%        a=sqrt(3)*rcollect*180/(pi*rx);%�������ߵļ����
%        a=min(a,1);
        a=10;  %refer the manul of Wireless Insite
        an=floor(180/a);
        
        for n=1:an-1 %�������Ϊ���ߵ�γ��
            a1(n)=a*n;
            b(n)=a/sind(a1(n));  %���������ھ��ȷ���ļ��
            bn(n)=floor(360/b(n));  %��γ���Ϸ�����������
        end
        a1(an)=a*an;
        if a1(an)==180
            b(an)=1;
            bn(an)=1;
        else
            b(an)=a/sind(a1(an));
            bn(an)=floor(360/b(an));    
        end
        
        for n=1:an
            for m=1:bn(n)
                b1(n,m)=m*b(n);
                vx(n,m)=sind(a1(n))*cosd(b1(n,m));
                vy(n,m)=sind(a1(n))*sind(b1(n,m));
                vz(n,m)=cosd(a1(n));  %���ߵķ�������
            end
        end
        bn(1)=bn(1)+1;
        vx(1,bn(1))=0;
        vy(1,bn(1))=0;
        vz(1,bn(1))=1;  %��©�����ߣ��������߷��������
        number=sum(bn);  %������������
        
        pt0=pt/number;
        
        %% ����6���棬ǰ����ֵ��ʾ����ķ�����,���һ��ֵ��ʾλ��
        
        
        
        nFloor=[0 0 1 0];  %����1
        nCeiling=[0 0 -1 Height];  %����2
        nLeftWall=[1 0 0 0];  %��ǽ��3
        nRightWall=[-1 0 0 Length];  %��ǽ��4
        nFrontWall=[0 1 0 0];  %�������0
        nBehindWall=[0 -1 0 Width];  %Զ�����5
        nPlatformFrontWall = [0 1 0 WidthPlatform];%��̨ǰ��
        nPlatformUpWall = [0 0 1 HighPlatform];%��̨����

%         nFloor=face(1,:);  %����1
%         nCeiling=face(2,:);  %����2
%         nLeftWall=face(3,:);  %��ǽ��3
%         nRightWall=face(4,:);  %��ǽ��4
%         nFrontWall=face(5,:);  %�������0
%         nBehindWall=face(6,:);  %Զ�����5
%         nPlatformFrontWall = face(7,:);%��̨ǰ��
%         nPlatformUpWall = face(8,:);%��̨����
        
        rymax=Width;
        d=rymax-ry;%���õĽ��յ������
        rn=(rymax-ry)/d;   %���յ�����
        
        number2=number*TransmitterNum*ReceiverNum;  %����������
        
        %% ���ٹ���
        for q=1:rn %���Ͷ˵����ն˸�����ĸ���
            ry(q)=ry+d*(q-1); %���յ���x���ϵ�λ��
            n0(q)=1;
            for n=1:an
                if a1(n)>=0&&a1(n)<10
                    gt(n)=-25.0;
                elseif a1(n)<20
                    gt(n)=-12.5;
                elseif a1(n)<30
                    gt(n)=-5.76;
                elseif a1(n)<40
                    gt(n)=-3.55;
                elseif a1(n)<50
                    gt(n)=-1.86;
                elseif a1(n)<60
                    gt(n)=-0.05;
                elseif a1(n)<70
                    gt(n)=0.86;
                elseif a1(n)<80
                    gt(n)=1.61;
                elseif a1(n)<90
                    gt(n)=2;
                elseif a1(n)<100
                    gt(n)=1.56;
                elseif a1(n)<110
                    gt(n)=1;
                elseif a1(n)<120
                    gt(n)=-0.38;
                elseif a1(n)<150
                    gt(n)=-3.84;
                elseif a1(n)<160
                    gt(n)=-8.28;
                elseif a1(n)<170
                    gt(n)=-12;
                else gt(n)=-25;
                end
                GainT = 10^(gt(n)/10);
                for m=1:bn(n)
                    %����������
                    number1=number1+1;
                    if number2-number1<=100
                        h = waitbar(number1/number2,hwait,'�������');
                        
                    else
                        str=['����������',num2str(100*number1/number2),'%'];
                        h = waitbar(number1/number2,hwait,str);
                    end  %����������
                    %close(h);
                    %gt0=gt(n);
                    %ȷ��ֱ�ﾶ
                    %                   if vx(n,m)==(rx-tx)&&vy(n,m)==(ry-ty)&&vz(n,m)==(rz-tz) %ֱ�ﾶ
                    pathlength = []; rcoe = [];
                    
                    
                    pr{u,p}{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rz,a,l,GainT);  %�������߹���
                    if isempty(pr{u,p}{n,m})==0
                        pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                        n0(q)=n0(q)+1;
                        plot3([tx,rx],[ty,ry],[tz,rz])
                        d_ray_departure = sqrt((rx-tx)^2+(ry-ty)^2+(rz-tz)^2);                        
                        DOD{u,p}{q,n0(q)-1} = [(rx-tx)/d_ray_departure,(ry-ty)/d_ray_departure,(rz-tz)/d_ray_departure];
                        continue;
                    end
                    %                   else
                    surface1{u,p}{n,m}=judge1(tx,ty,tz,Height,Width,Length,HighPlatform,WidthPlatform,vx(n,m),vy(n,m),vz(n,m));  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
                    if surface1{u,p}{n,m}==0  %���������ཻ
                        point1{u,p}{n,m}=intersectmianjuxing0(vx(n,m),vy(n,m),vz(n,m),Height,Length,nFrontWall,tx,ty,tz);
                    elseif surface1{u,p}{n,m} == 5
                        point1{u,p}{n,m}=intersectmianjuxing0(vx(n,m),vy(n,m),vz(n,m),Height,Length,nBehindWall,tx,ty,tz);
                    elseif surface1{u,p}{n,m}==1  %������ཻ
                        point1{u,p}{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),Width,nFloor,tx,ty,tz,Length);
                    elseif surface1{u,p}{n,m}==2  %�붥���ཻ
                        point1{u,p}{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),Width,nCeiling,tx,ty,tz,Length);
                    elseif surface1{u,p}{n,m}==3  %����ǽ���ཻ
                        point1{u,p}{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),Height,nLeftWall,tx,ty,tz,Width);
                    elseif surface1{u,p}{n,m}==4  %����ǽ���ཻ
                        point1{u,p}{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),Height,nRightWall,tx,ty,tz,Width);
                    elseif surface1{u,p}{n,m}==6  %�뽲̨�����ཻ
                        point1{u,p}{n,m}=intersectmianjuxing4(vx(n,m),vy(n,m),vz(n,m),WidthPlatform,HighPlatform,nPlatformUpWall,tx,ty,tz,Length);
                    else   %�뽲̨ǰ���ཻ
                        point1{u,p}{n,m}=intersectmianjuxing3(vx(n,m),vy(n,m),vz(n,m),HighPlatform,WidthPlatform,Length,nPlatformFrontWall,tx,ty,tz);
                    end
                    rp=point1{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,1)]=reflectdirectionjx(rp,vx(n,m),vy(n,m),vz(n,m),nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %��ⷴ����������������ϵ��
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %��������
                    pathlength(1,1)=rp(1,4);  %������뽻�����
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                    if isempty(pr{u,p}{n,m})==1  %����յ�֮ǰ�ĸ����޽���
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            plot3([tx,rp1(1,1),rx],[ty,rp1(1,2),ry],[tz,rp1(1,3),rz])
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %���յ��޷����ո�����
                        end
                    end
                    
                    
                    
                    surface2{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
                    if surface2{u,p}{n,m}==0  %���������ཻ
                        point2{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface2{u,p}{n,m} == 5
                        point2{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface2{u,p}{n,m}==1  %������ཻ
                        point2{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface2{u,p}{n,m}==2  %�붥���ཻ
                        point2{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface2{u,p}{n,m}==3  %����ǽ���ཻ
                        point2{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface2{u,p}{n,m}==4  %����ǽ���ཻ
                        point2{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface2{u,p}{n,m}==6  %�뽲̨�����ཻ
                        point2{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %�뽲̨ǰ���ཻ
                        point2{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point2{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,2)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %��ⷴ����������������ϵ��
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %��������
                    pathlength(1,2)=rp(1,4);  %������뽻�����
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                    if isempty(pr{u,p}{n,m})==1  %����յ�֮ǰ�ĸ����޽���
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                            n0(q)=n0(q)+1;
                           	rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rx],[ty,rp1(1,2),rp2(1,2),ry],[tz,rp1(1,3),rp2(1,3),rz]);
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %���յ��޷����ո�����
                        end
                    end
                    
                    
                    
                    surface3{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
                    if surface3{u,p}{n,m}==0  %���������ཻ
                        point3{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface3{u,p}{n,m} == 5
                        point3{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface3{u,p}{n,m}==1  %������ཻ
                        point3{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface3{u,p}{n,m}==2  %�붥���ཻ
                        point3{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface3{u,p}{n,m}==3  %����ǽ���ཻ
                        point3{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface3{u,p}{n,m}==4  %����ǽ���ཻ
                        point3{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface3{u,p}{n,m}==6  %�뽲̨�����ཻ
                        point3{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %�뽲̨ǰ���ཻ
                        point3{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point3{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,3)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %��ⷴ����������������ϵ��
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %��������
                    pathlength(1,3)=rp(1,4);  %������뽻�����
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                    if isempty(pr{u,p}{n,m})==1  %����յ�֮ǰ�ĸ����޽���
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            rp3=point3{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rp3(1,1),rx],[ty,rp1(1,2),rp2(1,2),rp3(1,2),ry],[tz,rp1(1,3),rp2(1,3),rp3(1,3),rz]); 
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue
                        else
                            %���յ��޷����ո�����
                        end
                    end
                    
                    
                    
                    surface4{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
                    if surface4{u,p}{n,m}==0  %���������ཻ
                        point4{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface4{u,p}{n,m} == 5
                        point4{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface4{u,p}{n,m}==1  %������ཻ
                        point4{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface4{u,p}{n,m}==2  %�붥���ཻ
                        point4{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface4{u,p}{n,m}==3  %����ǽ���ཻ
                        point4{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface4{u,p}{n,m}==4  %����ǽ���ཻ
                        point4{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface4{u,p}{n,m}==6  %�뽲̨�����ཻ
                        point4{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %�뽲̨ǰ���ཻ
                        point4{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point4{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,4)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %��ⷴ����������������ϵ��
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %��������
                    pathlength(1,4)=rp(1,4);  %������뽻�����
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                    if isempty(pr{u,p}{n,m})==1  %����յ�֮ǰ�ĸ����޽���
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            rp3=point3{u,p}{n,m};
                            rp4=point4{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rp3(1,1),rp4(1,1),rx],[ty,rp1(1,2),rp2(1,2),rp3(1,2),rp4(1,2),ry],[tz,rp1(1,3),rp2(1,3),rp3(1,3),rp4(1,3),rz]);
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %���յ��޷����ո�����
                        end
                    end
                    
                    
                    
                    
                    surface5{u,p}{n,m}=judge1(t1,t2,t3,Height,Width,Length,HighPlatform,WidthPlatform,v1,v2,v3);  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
                    if surface5{u,p}{n,m}==0  %���������ཻ
                        point5{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nFrontWall,t1,t2,t3);
                    elseif surface5{u,p}{n,m}==5 %��Զ������ཻ
                        point5{u,p}{n,m}=intersectmianjuxing0(v1,v2,v3,Height,Length,nBehindWall,t1,t2,t3);
                    elseif surface5{u,p}{n,m}==1  %������ཻ
                        point5{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nFloor,t1,t2,t3,Length);
                    elseif surface5{u,p}{n,m}==2  %�붥���ཻ
                        point5{u,p}{n,m}=intersectmianjuxing1(v1,v2,v3,Width,nCeiling,t1,t2,t3,Length);
                    elseif surface5{u,p}{n,m}==3  %����ǽ���ཻ
                        point5{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nLeftWall,t1,t2,t3,Width);
                    elseif surface5{u,p}{n,m}==4  %����ǽ���ཻ
                        point5{u,p}{n,m}=intersectmianjuxing2(v1,v2,v3,Height,nRightWall,t1,t2,t3,Width);
                    elseif surface5{u,p}{n,m}==6  %�뽲̨�����ཻ
                        point5{u,p}{n,m}=intersectmianjuxing4(v1,v2,v3,WidthPlatform,HighPlatform,nPlatformUpWall,t1,t2,t3,Length);
                    else   %�뽲̨ǰ���ཻ
                        point5{u,p}{n,m}=intersectmianjuxing3(v1,v2,v3,HighPlatform,WidthPlatform,Length,nPlatformFrontWall,t1,t2,t3);
                    end
                    rp=point5{u,p}{n,m};
                    if isempty(rp) == 1
                        continue
                    end
                    [newray,rcoe(1,5)]=reflectdirectionjx(rp,v1,v2,v3,nFrontWall,nFloor,nCeiling,nLeftWall,nRightWall,nBehindWall,e0,e1,e2,e3,e4,e5);  %��ⷴ����������������ϵ��
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %��������
                    pathlength(1,5)=rp(1,4);  %������뽻�����
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                    if isempty(pr{u,p}{n,m})==1  %����յ�֮ǰ�ĸ����޽���
                        pr{u,p}{n,m}=receive1(t1,t2,t3,rx,ry,rz,newray,a,l,pathlength,rcoe,GainT);
                        if isempty(pr{u,p}{n,m})==0
                            pr0{u,p}{q,n0(q)}=pr{u,p}{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                            pathlength = []; rcoe = [];
                            n0(q)=n0(q)+1;
                            rp1=point1{u,p}{n,m};
                            rp2=point2{u,p}{n,m};
                            rp3=point3{u,p}{n,m};
                            rp4=point4{u,p}{n,m};
                            rp5=point5{u,p}{n,m};
                            plot3([tx,rp1(1,1),rp2(1,1),rp3(1,1),rp4(1,1),rp5(1,1),rx],[ty,rp1(1,2),rp2(1,2),rp3(1,2),rp4(1,2),rp5(1,2),ry],[tz,rp1(1,3),rp2(1,3),rp3(1,3),rp4(1,3),rp5(1,3),rz]);
                            d_ray_departure = sqrt((rp1(1,1)-tx)^2+(rp1(1,2)-ty)^2+(rp1(1,3)-tz)^2);
                            DOD{u,p}{q,n0(q)-1} = [(rp1(1,1)-tx)/d_ray_departure,(rp1(1,2)-ty)/d_ray_departure,(rp1(1,3)-tz)/d_ray_departure];
                            continue;
                        else
                            %���յ��޷����ո�����
                        end
                    end
                end
            end
        end
        
        
        %% ����������
        for q=1:rn
            n1(q)=1;n2(q)=1;
            for m=1:n0(q)-1;
                path_received_temp=pr0{u,p}{q,m};
                aoatheta=path_received_temp(1,3);
                if aoatheta>=0&&aoatheta<10
                    gr=-25.0;
                elseif aoatheta<20
                    gr=-12.5;
                elseif aoatheta<30
                    gr=-5.76;
                elseif aoatheta<40
                    gr=-3.55;
                elseif aoatheta<50
                    gr=-1.86;
                elseif aoatheta<60
                    gr=-0.05;
                elseif aoatheta<70
                    gr=0.86;
                elseif aoatheta<80
                    gr=1.61;
                elseif aoatheta<90
                    gr=2;
                elseif aoatheta<100
                    gr=1.56;
                elseif aoatheta<110
                    gr=1;
                elseif aoatheta<120
                    gr=-0.38;
                elseif aoatheta<150
                    gr=-3.84;
                elseif aoatheta<160
                    gr=-8.28;
                elseif aoatheta<170
                    gr=-12;
                else gr=-25;
                end    %�����������������������
                GainthetaR = 10^(gr/10);
            end
            for m=1:n0(q)-1
                path_received_temp = pr0{u,p}{q,m};%��������õ���pr0��ֵ��pr0�У�u��ָ��һ����������,pָ������һ����������,q�Ǵӷ���㵽���յ�֮��ÿ��һ����������Ŀ������㵽�㣬����qΪ1��m��ָ���յ������߸���,pr�ڲ��Ĳ�����receive1�еĲ�����
                E_loss{u,p}(q,m) = path_received_temp(1,1);%E_loss��ָû�г��Է���(�ź�)���ʵģ��ڸ���·������ĵĳ�ǿ�����źţ��Ĳ�������������
                E_received{u,p}(q,m) = sqrt(GainthetaR)*sqrt(pt0)*E_loss{u,p}(q,m);%E_received���������߽��յĵ糡����������
                time_delay{u,p}(q,m) = path_received_temp(1,2);%time_delay�����ߵĵ���ʱ��
                E_loss_abs{u,p}(q,m) = abs(E_loss{u,p}(q,m));%E_loss_abs:����糡�Ĵ�С
                %pr21{u,p}(q,m)=GainthetaR*pt0*2*pi/l.*E_loss_abs{u,p}(q,m)^2;%ÿ�����ߵĹ���   ��Ҫ�����߷���������������棬dbҪ���ɱ���
                power_received_ray{u,p}(q,m) = GainthetaR*pt0.*E_loss_abs{u,p}(q,m)^2;%ÿ�����ߵĽ��չ��ʣ�Wireless Insite������ͨ�����ϵ��ɲ�ͬ��Ŀǰ�����ϵ�����
                power_received_ray_dB{u,p}(q,m)=10*log10(power_received_ray{u,p}(q,m));%ÿ�����ߵĽ��չ��ʣ���λdbm
                pathloss_ray{u,p}(q,m) = pt0/power_received_ray{u,p}(q,m);%ÿ�����ߵ�·�����
                pathloss_ray_dB{u,p}(q,m)=10*log10(pathloss_ray{u,p}(q,m));%ÿ������·�����
                
                DOA{u,p}{q,m} = [path_received_temp(1,4),path_received_temp(1,5),path_received_temp(1,6)];
            end
            E_loss_sum{u,p} = sum(E_loss{u,p}(q,:));%�ܹ��ĳ�ǿ��ģ�
            E_sum{u,p} = sum(E_received{u,p}(q,:));%�ܳ�ǿ
            E_sum_timedelay{u,p}=sum(E_received{u,p}(q,:).*time_delay{u,p}(q,:));%
            E_sum_timedelay_pow{u,p}=sum(E_received{u,p}(q,:).*time_delay{u,p}(q,:).^2);%
            tave{u,p}=E_sum_timedelay{u,p}/E_sum{u,p};%
            et{u,p}=E_sum_timedelay_pow{u,p}/E_sum{u,p} ;%;
            RMS{u,p}(1,q)=sqrt(et{u,p}-tave{u,p}^2);%�������ʱ��
            los_path=norm([rx-tx,ry-ty,rz-tz]);
            E_loss_los{u,p}(1,q) = l/(4*pi*los_path)*exp(-1j*2*pi*los_path/l);%ֱ�ﾶ��ǿ���
            E_los{u,p}(1,q) = sqrt(pt0)*sqrt(GainthetaR)*E_loss_los{u,p}(1,q);%ֱ�ﾶ
            power_received_sum{u,p}(1,q)=sum(E_received{u,p}(q,:))^2;%�ܽ��չ���
            power_received_sum_dB{u,p}(1,q) = 10*log10(power_received_sum{u,p});
            k{u,p}(q)=(abs(E_los{u,p}(1,q)))^2/(abs(power_received_sum{u,p}(1,q)))^2;
            hmatrix{u,p}(1,q)=sum(E_loss{u,p}(q,:));%��������Ԫ��
        end


K_dB{u,p}=10*log10(k{u,p});%K����
pathloss_sum{u,p} = pt./power_received_sum{u,p};%·�����
pathloss_sum_dB{u,p}=10*log10(pt./power_received_sum{u,p});%·�����
    end
end
close(h);

time_delay;
RMS ;
power_received_ray;
power_received_ray_dB ;
power_received_sum ;
power_received_sum_dB ;
pathloss_ray;
pathloss_ray_dB ;
pathloss_sum;
pathloss_sum_dB;
h_matrix = hmatrix;
K = k;
K_dB = K;
DOA;
DOD;
%%
figure(2)
t=linspace(0,pi,25);
p=linspace(0,2*pi,25);
[theta,phi]=meshgrid(t,p);
x=sin(theta).*sin(phi);
y=sin(theta).*cos(phi);
z=cos(theta);
plot3(x,y,z,'Color',[0.01,0.8,0.8]);
axis equal;
title('DOA');
hold on;
num_ray = size(DOA{1,1});

for i = 1:num_ray(1,2)
    angel_arrived_x(i) = DOA{1,1}{1,i}(1,1);
    angel_arrived_y(i)= DOA{1,1}{1,i}(1,2);
    angel_arrived_z(i) = DOA{1,1}{1,i}(1,3);
    plot3([-angel_arrived_x(i),0],[-angel_arrived_y(i),0],[-angel_arrived_z(i),0]);
end

saveas(2,'DOA.jpg')
close(figure(2));

%%
figure(3)
t=linspace(0,pi,25);
p=linspace(0,2*pi,25);
[theta,phi]=meshgrid(t,p);
x=sin(theta).*sin(phi);
y=sin(theta).*cos(phi);
z=cos(theta);
plot3(x,y,z,'Color',[0.01,0.8,0.8]);
axis equal;
title('DOD');
hold on;
num_ray = size(DOD{1,1});
for i = 1:num_ray(1,2)
    angel_departure_x(i) = DOD{1,1}{1,i}(1,1);
    angel_departure_y(i)= DOD{1,1}{1,i}(1,2);
    angel_departure_z(i) = DOD{1,1}{1,i}(1,3);
    plot3([0,angel_departure_x(i)],[0,angel_departure_y(i)],[0,angel_departure_z(i)]);
end
saveas(3,'DOD.jpg')
close(figure(3));

%%
figure(4)

stem(time_delay{1,1}(1,1:n0(1)-1),pathloss_ray_dB{1,1}(1,1:n0(1)-1))
grid on
xlabel('Time Delay��ns��')
ylabel('Path loss��dB��')
title('Power Delay Profile')
saveas(4,'time_pl.jpg')
close(figure(4));
end


