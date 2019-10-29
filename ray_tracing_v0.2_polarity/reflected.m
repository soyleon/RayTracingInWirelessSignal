function [newray,rcoe] = reflected(rp,vx,vy,vz,n_face,e_face)
% get the direction of the reflected ray and get the reflection coeff
ray_vector = [vx,vy,vz];
i = rp(1,5);
nvector = n_face(i,1:3);e = e_face(i);

dir_ray = dot(ray_vector,nvector);
newray(1,1:3) = ray_vector-2*dir_ray*nvector;

if (rp(1,5)==1)||(rp(1,5)==2)
    rcoe=(e*abs(dir_ray)-sqrt(e-1+dir_ray^2))/(e*abs(dir_ray)+sqrt(e-1+dir_ray^2));%平行极化反射系数
else
    rcoe=(abs(dir_ray)-sqrt(e-1+dir_ray^2))/(abs(dir_ray)+sqrt(e-1+dir_ray^2));%垂直极化反射系数
end
