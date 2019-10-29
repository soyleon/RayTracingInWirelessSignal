function pr=receivezhida(v1,v2,v3,t1,t2,t3,rx,ry,rz,a,l,GainT)
linevector=[v1,v2,v3];
tr=[rx-t1,ry-t2,rz-t3];
dtr=sqrt((rx-t1)^2+(ry-t2)^2+(rz-t3)^2);
d1=dot(tr,linevector); 
if d1<=0
    pr=[];
else
    dr=sqrt(dtr^2-d1^2);%���յ㵽���ߵľ���
    r=a*pi*d1/(180*sqrt(3));%������뾶�����߾������Ӷ�����
     if dr>r 
        pr=[];
     else
        pr(1,1)=GainT*l/(4*pi*d1)*exp(-1j*2*pi*d1/l);%E
        pr(1,2)=d1*10/3;%ʱ��,ns
        %pr(1,3)=180-acosd(d1/dtr);%�����
        %pr(1,4)=0;%�����������ֱ��
        pr(1,3) = acosd(dot(linevector,[0 0 1]));
        pr(1,7) = 0;%�����������ֱ��
        pr(1,4) = v1;
        pr(1,5) = v2;
        pr(1,6) = v3;
     end
end
end