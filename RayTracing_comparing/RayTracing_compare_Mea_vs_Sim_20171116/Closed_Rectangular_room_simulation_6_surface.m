clear all
% �������ڷ����������ܹ�����õ�·����ġ�������ʱ����չ��k�����Լ�����ʱ����
% ������ȫ��յľ������ڷ���

%��������
h=5;w=23;length=20.5;%���ڽ���ߴ�/���ı������ĸ߶�
pt=0.1;%���书��,20dBm
f=5.6*10^9;%Ƶ��
c=3e8;
l=c/f;%����
tx=1.44;
ty=8.5;
tz=11.46;
rx=2.92;ry=13;%���յ�

t = 0;
x = 0.026;
for u=1:64
    rzmax = 9.431 + x*1*(u-1);
    t = t+1;    
    
%����������Խ�糣��
permitivity0=6.4;  %�������
permitivity5=6.4;  %Զ�����
permitivity1=6.4;  %����
permitivity2=6.4;  %����
permitivity3=6.4;  %��ǽ��
permitivity4=6.4;  %��ǽ��
%�������絼��
conductivity0=10^(-2);  %�������
conductivity5=10^(-2);  %Զ�����
conductivity1=10^(-2);  %����
conductivity2=10^(-2);  %����
conductivity3=10^(-2);  %��ǽ��
conductivity4=10^(-2);  %��ǽ��
rcollect=1.2;%������뾶
% d=rzmax-tz;%���õĽ��յ������ 
%�������
%����Ľ��ʵĸ���Խ�糣�����㹫ʽ
e0=permitivity0-1j*60*conductivity0*l;  %�������
e5=permitivity5-1j*60*conductivity5*l;  %Զ�����
e1=permitivity1-1j*60*conductivity1*l;  %����
e2=permitivity2-1j*60*conductivity2*l;  %����
e3=permitivity3-1j*60*conductivity3*l;  %��ǽ��
e4=permitivity4-1j*60*conductivity4*l;  %��ǽ��  
a=sqrt(3)*rcollect*180/(pi*rzmax);%�������ߵļ����                   
a=min(a,1);
a=1;  %���η���Ƕ�����Ϊ1��
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
% hwait=waitbar(0,'��ȴ�>>>>>>>>');  %����������
% number1=0;  %����������
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
%��������
pt0=pt/number;
%����6���棬ǰ����ֵ��ʾ����ķ�����
n1=[1 0 0 0];  %����
n2=[-1 0 0 h];  %����
n3=[0 1 0 0];  %��ǽ��
n4=[0 -1 0 w];  %��ǽ��
n5=[0 0 1 0];  %�������
n6=[0 0 -1 length];  %Զ�����  
%rn=(rzmax-tz)/d;   %���յ�����
% number2=number;  %����������
% for q=1:rn
% rz(q)=tz+d*q; %���յ�����������ϵ�λ��
n0=1;
for n=1:an
    for m=1:bn(n) 
%         %����������
%         number1=number1+1;
%         if number2-number1<=100
%             waitbar(number1/number2,hwait,'�������');
%         else
%             str=['����������',num2str(100*number1/number2),'%'];
%             waitbar(number1/number2,hwait,str);
%         end  %����������
        %ȷ��ֱ�ﾶ
        if vz(n,m)==0 %��ֱ����������ߣ�ֱ�ﾶ
            pr{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rzmax,a,l);  %�������߹���
            if isempty(pr{n,m})==0
                pr0{t,n0}=pr{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                n0(1)=n0+1;
            else
                %���յ��޷����ո�����
            end
            continue
        elseif vx(n,m)==0&&vy(n,m)==0 %ƽ���������������ߣ�ֱ�ﾶ
            pr{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rzmax,a,l);  %�������߹���
            if isempty(pr{n,m})==0
                pr0{t,n0}=pr{n,m};  %��q�����յ�ĵ�n0��q�����������߹���
                n0=n0+1;
            else
                %���յ��޷����ո�����
            end
            continue
        else
            surface1{n,m}=judge1(tx,ty,tz,h,w,vx(n,m),vy(n,m),vz(n,m));  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
            if surface1{n,m}==0  %���������ཻ
                point1{n,m}=intersectmianjuxing0(vx(n,m),vy(n,m),vz(n,m),w,h,n5,tx,ty,tz);
            elseif surface1{n,m}==1  %������ཻ
                point1{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),w,n1,tx,ty,tz,rzmax);
            elseif surface1{n,m}==2  %�붥���ཻ
                point1{n,m}=intersectmianjuxing1(vx(n,m),vy(n,m),vz(n,m),w,n2,tx,ty,tz,rzmax);
            elseif surface1{n,m}==3  %����ǽ���ཻ
                point1{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),h,n3,tx,ty,tz,rzmax);
            else  %����ǽ���ཻ
                point1{n,m}=intersectmianjuxing2(vx(n,m),vy(n,m),vz(n,m),h,n4,tx,ty,tz,rzmax);
            end
            rp=point1{n,m};
            if isempty(rp)==1  %����յ�֮ǰ�ĸ����޽���
                pr{n,m}=receivezhida(vx(n,m),vy(n,m),vz(n,m),tx,ty,tz,rx,ry,rzmax,a,l);
                if isempty(pr{n,m})==0  %�ж����߱����յ����
                    pr0{t,n0}=pr{n,m};
                    n0=n0+1;
                    continue
                else  %�ж����߲������յ���գ���������
                    surface11{n,m}=judge2(tx,ty,tz,h,w,length,vx(n,m),vy(n,m),vz(n,m));  %�������ߴ򵽽��յ�֮��ĳ������ж���������յ�֮����ĸ�����
                    if surface11{n,m}==5    %��Զ������ཻ
                        point11{n,m}=intersectmianjuxing15(vx(n,m),vy(n,m),vz(n,m),w,h,length,n6,tx,ty,tz);
                    elseif surface11{n,m}==1  %������ཻ
                        point11{n,m}=intersectmianjuxing11(vx(n,m),vy(n,m),vz(n,m),w,length,n1,tx,ty,tz,rzmax); 
                    elseif surface11{n,m}==2  %�붥���ཻ
                        point11{n,m}=intersectmianjuxing11(vx(n,m),vy(n,m),vz(n,m),w,length,n2,tx,ty,tz,rzmax);
                    elseif surface11{n,m}==3  %����ǽ���ཻ
                        point11{n,m}=intersectmianjuxing12(vx(n,m),vy(n,m),vz(n,m),h,length,n3,tx,ty,tz,rzmax);
                    else    %����ǽ���ཻ
                        point11{n,m}=intersectmianjuxing12(vx(n,m),vy(n,m),vz(n,m),h,length,n4,tx,ty,tz,rzmax);
                    end
                    %ԭ���������ڽ��յ�֮��������󽻺�1�θ���
                    rp=point11{n,m}; 
                    [newray,rcoe(1,1)]=reflectdirectionjx(rp,vx(n,m),vy(n,m),vz(n,m),n6,n1,n2,n3,n4,e5,e1,e2,e3,e4);  %��ⷴ����������������ϵ��
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %��������
                    pathlength(1,1)=rp(1,4);  %������뽻�����
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                    surface12{n,m}=judge2(t1,t2,t3,h,w,length,v1,v2,v3);  %�������ߴ򵽽��յ�֮��ĳ������ж���������յ�֮����ĸ�����
                    if surface12{n,m}==5  %��Զ������ཻ
                        point12{n,m}=intersectmianjuxing15(v1,v2,v3,w,h,length,n6,t1,t2,t3);
                    elseif surface12{n,m}==1  %������ཻ
                        point12{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n1,t1,t2,t3,rzmax);
                    elseif surface12{n,m}==2  %�붥���ཻ
                        point12{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n2,t1,t2,t3,rzmax);
                    elseif surface12{n,m}==3  %����ǽ���ཻ
                        point12{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n3,t1,t2,t3,rzmax);
                    else  %����ǽ���ཻ
                        point12{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n4,t1,t2,t3,rzmax);
                    end
                    rp=point12{n,m};
                    if isempty(rp)==1  %����յ�֮��ĸ����޽���
                        pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);
                        rcoe=[];pathlength=[];
                        if isempty(pr{n,m})==0
                            pr0{t,n0}=pr{n,m};
                            n0=n0+1;
                        else
                            %���Զ����߼���׷��
                        end
                        rcoe=[];pathlength=[];
                        continue
                    else
                        %���Զ����߼���׷��
                    end
                end
                rcoe=[];pathlength=[];
                continue
            else  %����յ�֮ǰ�ĸ����н���
                %ԭ���������ڽ��յ�֮ǰ������󽻺�1�θ���
                [newray,rcoe(1,1)]=reflectdirectionjx(rp,vx(n,m),vy(n,m),vz(n,m),n5,n1,n2,n3,n4,e0,e1,e2,e3,e4);  %��ⷴ����������������ϵ��
                t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %��������
                pathlength(1,1)=rp(1,4);  %������뽻�����
                v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                surface2{n,m}=judge1(t1,t2,t3,h,w,v1,v2,v3);  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
                if surface2{n,m}==0  %���������ཻ
                    point2{n,m}=intersectmianjuxing0(v1,v2,v3,w,h,n5,t1,t2,t3);
                elseif surface2{n,m}==1  %������ཻ
                    point2{n,m}=intersectmianjuxing1(v1,v2,v3,w,n1,t1,t2,t3,rzmax);
                elseif surface2{n,m}==2  %�붥���ཻ
                    point2{n,m}=intersectmianjuxing1(v1,v2,v3,w,n2,t1,t2,t3,rzmax);
                elseif surface2{n,m}==3  %����ǽ���ཻ
                    point2{n,m}=intersectmianjuxing2(v1,v2,v3,h,n3,t1,t2,t3,rzmax);
                else  %����ǽ���ཻ
                    point2{n,m}=intersectmianjuxing2(v1,v2,v3,h,n4,t1,t2,t3,rzmax);
                end
                rp=point2{n,m};
                if isempty(rp)==1  %����յ�֮ǰ�ĸ����޽���
                    pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);  %��ⷴ����������������ϵ��
                    if isempty(pr{n,m})==0  %�ж����߱����յ����  
                        rcoe=[];pathlength=[];
                        pr0{t,n0}=pr{n,m};
                        n0=n0+1;
                        continue
                    else
                        surface21{n,m}=judge2(t1,t2,t3,h,w,length,v1,v2,v3);  %�������ߴ򵽽��յ�֮��ĳ������ж���������յ�֮��ĸ�����
                        if surface21{n,m}==5  %��Զ������ཻ
                            point21{n,m}=intersectmianjuxing15(v1,v2,v3,w,h,length,n6,t1,t2,t3);
                        elseif surface21{n,m}==1  %������ཻ
                            point21{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n1,t1,t2,t3,rzmax); 
                        elseif surface21{n,m}==2  %�붥���ཻ
                            point21{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n2,t1,t2,t3,rzmax);
                        elseif surface21{n,m}==3  %����ǽ���ཻ
                            point21{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n3,t1,t2,t3,rzmax);
                        else  %����ǽ���ཻ
                            point21{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n4,t1,t2,t3,rzmax);
                        end
                        %���յ�֮ǰ1�η��������ڽ��յ�֮��������󽻺�1�θ���
                        rp=point21{n,m};
                        [newray,rcoe(1,2)]=reflectdirectionjx(rp,v1,v2,v3,n6,n1,n2,n3,n4,e5,e1,e2,e3,e4);  %��ⷴ����������������ϵ��
                        t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %�½�������
                        pathlength(1,2)=rp(1,4);  %1�η�������½������
                        v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                        surface22{n,m}=judge2(t1,t2,t3,h,w,length,v1,v2,v3);  %�������ߴ򵽽��յ�֮��ĳ������ж���������յ�֮��ĸ�����
                        if surface22{n,m}==5  %��Զ������ཻ
                            point22{n,m}=intersectmianjuxing15(v1,v2,v3,w,h,length,n6,t1,t2,t3);
                        elseif surface22{n,m}==1  %������ཻ
                            point22{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n1,t1,t2,t3,rzmax);
                        elseif surface22{n,m}==2  %�붥���ཻ
                            point22{n,m}=intersectmianjuxing11(v1,v2,v3,w,length,n2,t1,t2,t3,rzmax);
                        elseif surface22{n,m}==3  %����ǽ���ཻ
                            point22{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n3,t1,t2,t3,rzmax);
                        else  %����ǽ���ཻ
                            point22{n,m}=intersectmianjuxing12(v1,v2,v3,h,length,n4,t1,t2,t3,rzmax);
                        end
                        rp=point22{n,m};
                        if isempty(rp)==1  %����յ�֮��ĸ����޽���
                            pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);
                            if isempty(pr{n,m})==0  %�ж����߱����յ����
                                rcoe=[];pathlength=[];
                                pr0{t,n0}=pr{n,m};
                                n0=n0+1;
                            else
                                %���Զ����߼���׷��
                            end
                            rcoe=[];pathlength=[];
                            continue
                        else
                            %���Զ����߼���׷��
                        end
                    end
                    rcoe=[];pathlength=[];
                    continue
                else  %����յ�֮ǰ�ĸ����н���
                    %���յ�֮ǰ1�η��������ڽ��յ�֮ǰ������󽻺�2�θ���
                    [newray,rcoe(1,2)]=reflectdirectionjx(rp,v1,v2,v3,n5,n1,n2,n3,n4,e0,e1,e2,e3,e4);  %��ⷴ����������������ϵ�� 
                    t1=rp(1,1);t2=rp(1,2);t3=rp(1,3);  %�½�������
                    pathlength(1,2)=rp(1,4);  %1�η�������½������
                    v1=newray(1,1);v2=newray(1,2);v3=newray(1,3);  %������������
                    surface3{n,m}=judge1(t1,t2,t3,h,w,v1,v2,v3);  %�������ߴ򵽽��յ�֮ǰ�ĳ������ж���������յ�֮ǰ�ĸ�����
                    if surface3{n,m}==0  %���������ཻ
                        point3{n,m}=intersectmianjuxing0(v1,v2,v3,w,h,n5,t1,t2,t3);
                    elseif surface3{n,m}==1  %������ཻ
                        point3{n,m}=intersectmianjuxing1(v1,v2,v3,w,n1,t1,t2,t3,rzmax);
                    elseif surface3{n,m}==2  %�붥���ཻ
                        point3{n,m}=intersectmianjuxing1(v1,v2,v3,w,n2,t1,t2,t3,rzmax);
                    elseif surface3{n,m}==3  %����ǽ���ཻ
                        point3{n,m}=intersectmianjuxing2(v1,v2,v3,h,n3,t1,t2,t3,rzmax);
                    else  %����ǽ���ཻ
                        point3{n,m}=intersectmianjuxing2(v1,v2,v3,h,n4,t1,t2,t3,rzmax);
                    end
                    rp=point3{n,m};
                    if isempty(rp)==1  %����յ�֮ǰ�ĸ����޽���
                        pr{n,m}=receive1(t1,t2,t3,rx,ry,rzmax,newray,a,l,pathlength,rcoe);
                        if isempty(pr{n,m})==0  %�ж����߱����յ����
                            rcoe=[];pathlength=[];
                            pr0{t,n0}=pr{n,m};
                            n0=n0+1;
                        else
                            %���Զ����߼���׷��
                        end
                    else
                        %���Զ����߼���׷��
                    end
                end
            end
        end
        rcoe=[];pathlength=[];
    end
end

for m=1:n0-1
    pr1(t,:)=pr0{t,m};
    pr2(t,m)=pr1(t,1);
    td(t,m)=pr1(t,2);
    pr20(t,m)=abs(pr2(t,m));
    pr21(t,m)=pt0*2*pi/l.*pr20(t,m)^2;%ÿ�����ߵĹ���
    pl0(t,m)=10*log10(pt0/pr21(t,m));%ÿ������·�����
    pr22(t,m)=10*log10(pr21(t,m))+30;%dBm  
end
   ptotal(t)=sum(pr20(t,:));
   pttotal(t)=sum(pr20(t,:).*td(t,:));
   pttotal2(t)=sum(pr20(t,:).*td(t,:).^2);
   tave(t)=pttotal(t)/ptotal(t);
   et(t)=pttotal2(t)/ptotal(t);
   rms(t)=sqrt(et(t)-tave(t)^2);
   los(t)=norm([rx-tx,ry-ty,rzmax-tz]);
   prlos(t,1)=l/(4*pi*los(t))*exp(-1j*2*pi*los(t)/l);
   pr3(t,1)=sum(pr2(t,:));
   k(t)=(abs(prlos(t,1)))^2/(abs(pr3(t,1)))^2;
   hmatrix(t,1)=sum(pr2(t,:));%��������Ԫ��
%end
K(t)=10*log10(k(t));%K����
pr4(t)=pt0*2*pi/l.*abs(pr3(t)).^2;%���չ���
pl(t)=10*log10(pt./pr4(t));%·�����

for m = 1:n0-1
    if td(t,m) == 0;
        pl(t,m) = NaN;
        td(t,m) = NaN;
    end
end
end

%trd=[tz+d:d:tz+d*rn];
disp(['K(dB��=' num2str(K)]);
disp(['rms=' num2str(rms)]);
stem(td(1,1:n0(1)-1),pl0(1,1:n0(1)-1))
grid on
xlabel('ʱ�ӣ�ns��')
ylabel('·����ģ�dB��')



%  
% surf(1:5,1:5 ,1:5)
% else
%     figure(1)
%     plot(trd,K)
%     grid on
%     xlabel('�շ����루m��')
%     ylabel('K���ӣ�dB��')
%     figure(2)
%     plot(trd,rms)
%      grid on
%     xlabel('�շ����루m��')
%     ylabel('������ʱ�ӣ�ns��')
%      figure(3)
%     plot(trd,pl)
%      grid on
%     xlabel('�շ����루m��')
%     ylabel('·����ģ�dB��')
% end
