function parameterR=receive_divided(t1,t2,t3,rx,ry,rz,newray,delta_theta,wavelength,pathlength,rcoe_ver,rcoe_para,parallel_ref,vertical_ref,GainT,vx,vy,vz,E_tx,Ant_vec)
%多次反射射线的接收判决及场强计算
tr=[rx-t1,ry-t2,rz-t3];
dtr=sqrt((rx-t1)^2+(ry-t2)^2+(rz-t3)^2);
d1=dot(tr,newray);
if d1<=0
    parameterR=[];
else
    d=d1+sum(pathlength);%总传播路径
    dr=sqrt(dtr^2-d1^2);%接收点到射线的距离
    r=delta_theta*pi*d/(180*sqrt(3));
    if dr>r %采用固定的接收球半径
        parameterR=[];
    else
        refnumber=size(pathlength,2);  %返回pathlength的列数
%         dir_theta = [0,0,1];
%         dir_phi =[vx,vy,0];
%         if vx == 0 && vy == 0
%             dir_phi = [0,0,0];
%         else 
%           dir_phi = dir_phi/norm(dir_phi);
%         end
%         A_theta = E_tx * GainT_theta;        
%         A_phi = E_tx * GainT_phi;
%         E_tx = abs((A_theta.*dir_theta + A_phi.*dir_phi)...
%             .*exp(-1j*2*pi*d/wavelength)/d);
        E_t = E_tx*GainT*exp(-1j*2*pi*d/wavelength)/d.*Ant_vec;
        for ref_time = 1:refnumber
            E_ref_parallel = dot(E_t,rcoe_para(ref_time,1:3))*parallel_ref(ref_time,1:3);
            E_ref_vertical = dot(E_t,rcoe_ver(ref_time,1:3))*vertical_ref(ref_time,1:3);
            E_ref = E_ref_parallel+E_ref_vertical;
            E_t = E_ref;
        end
        parameterR(1,1:3)=E_ref;
        parameterR(1,4)=d*10/3;%时延？？？
        parameterR(1,5:7) = newray(1,1:3);
        parameterR(1,8:10) = [vx,vy,vz];
        parameterR(1,11) = refnumber;%反射次数
    end
end   
