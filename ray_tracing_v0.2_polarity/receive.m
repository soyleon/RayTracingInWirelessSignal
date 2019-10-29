function parameterR=receive(t1,t2,t3,rx,ry,rz,newray,delta_theta,wavelength,pathlength,rcoe,GainT,n,m,vx,vy,vz)
%��η������ߵĽ����о�����ǿ����
tr=[rx-t1,ry-t2,rz-t3];
dtr=sqrt((rx-t1)^2+(ry-t2)^2+(rz-t3)^2);
d1=dot(tr,newray);
if d1<=0
    parameterR=[];
else
    d=d1+sum(pathlength);%�ܴ���·��
    dr=sqrt(dtr^2-d1^2);%���յ㵽���ߵľ���
    r=delta_theta*pi*d/(180*sqrt(3));
    if dr>r %���ù̶��Ľ�����뾶
        parameterR=[];
    else
        refnumber=size(pathlength,2);  %����pathlength������
        parameterR(1,1)=sqrt(GainT)*prod(rcoe)*wavelength/(4*pi*d)*exp(-1j*2*pi*d/wavelength);
        parameterR(1,2)=d*10/3;%ʱ�ӣ�����
        %pr(1,3)=180-acosd(d1/dtr);%�����
       % pr(1,3)=acosd(dot(newray,[0 0 1]));
        %pr(1,4)=refnumber;
        parameterR(1,3) = newray(1,1);
        parameterR(1,4) = newray(1,2);
        parameterR(1,5) = newray(1,3);
        parameterR(1,6) = vx(n,m);
        parameterR(1,7) = vy(n,m);
        parameterR(1,8) = vz(n,m);
        parameterR(1,9) = refnumber;%�������
    end
end   
