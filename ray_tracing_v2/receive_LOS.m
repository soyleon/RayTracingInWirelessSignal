function parameterR = receive_LOS(t1,t2,t3,tx,ty,tz,rx,ry,rz,delta_theta,wavelength,GainT,n,m,vx,vy,vz,E_tx,Ant_vec)
ray_vector = [t1,t2,t3];
Los_vector = [rx-tx,ry-ty,rz-tz];
dis_los = sqrt((rx-tx)^2+(ry-ty)^2+(rz-tz)^2);
dis_los_at_ray = dot(Los_vector,ray_vector); % 发射点与接收球切点之间的距离
if dis_los_at_ray <= 0
    parameterR = [];
else
    dis_Rec = sqrt(dis_los^2-dis_los_at_ray^2);%接收点到射线的距离
    Received_R = delta_theta * pi * dis_los_at_ray / (180 * sqrt(3));%接收球半径随射线距离增加而增大
    if dis_Rec > Received_R
        parameterR=[];
    else
%         dir_theta = [0,0,1];
%         dir_phi =[t1,t2,0];
%         dir_phi = dir_phi/norm(dir_phi);
%         A_theta = E_tx * GainT_theta;
%         A_phi = E_tx * GainT_phi;
        parameterR(1,1:3)= Ant_vec.*E_tx*GainT...
            *exp(-1j*2*pi*dis_los/wavelength)/dis_los;
        parameterR(1,4)= dis_los*10/3;%时延,ns
        parameterR(1,5:7) = Los_vector/dis_los;
        parameterR(1,8:10) = [vx(n,m),vy(n,m),vz(n,m)];
        parameterR(1,11) = 0;%反射次数
    end
end
end