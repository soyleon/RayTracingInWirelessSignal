function parameterR = receive_LOS(t1,t2,t3,tx,ty,tz,rx,ry,rz,delta_theta,wavelength,GainT,n,m,vx,vy,vz)
ray_vector = [t1,t2,t3];
Los_vector = [rx-tx,ry-ty,rz-tz];
dis_los = sqrt((rx-tx)^2+(ry-ty)^2+(rz-tz)^2);
dir_cos = dot(Los_vector,ray_vector); 
if dir_cos <= 0
    parameterR = [];
else
    dis_Rec = sqrt(dis_los^2-dir_cos^2);%接收点到射线的距离
    Received_R = delta_theta * pi * dir_cos / (180 * sqrt(3));%接收球半径随射线距离增加而增大
     if dis_Rec > Received_R 
        parameterR=[];
     else
        parameterR(1,1)=sqrt(GainT)*wavelength/(4*pi*dis_los)*exp(-1j*2*pi*dis_los/wavelength);%E
        parameterR(1,2)=dis_los*10/3;%时延,ns
        parameterR(1,3) = Los_vector(1,1)/dis_los;
        parameterR(1,4) = Los_vector(1,2)/dis_los;
        parameterR(1,5) = Los_vector(1,3)/dis_los;
        parameterR(1,6) = vx(n,m);
        parameterR(1,7) = vy(n,m);
        parameterR(1,8) = vz(n,m);
        parameterR(1,9) = 0;%反射次数
     end
end
end