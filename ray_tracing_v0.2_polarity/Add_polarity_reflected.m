function [newray,rcoe] = Add_polarity_reflected(rp,vx,vy,vz,n_face,e_face)
% get the direction of the reflected ray and get the reflection coeff
ray_vector = [vx,vy,vz];
i = rp(1,5);
nvector = n_face(i,1:3);e = e_face(i);

dir_ray = dot(ray_vector,nvector);
newray(1,1:3) = ray_vector-2*dir_ray*nvector;

vertical_in = cross(ray_vector,nvector);
R_parallel = (e*abs(dir_ray)-sqrt(e-1+dir_ray^2))/(e*abs(dir_ray)+sqrt(e-1+dir_ray^2));
R_vertical = (abs(dir_ray)-sqrt(e-1+dir_ray^2))/(abs(dir_ray)+sqrt(e-1+dir_ray^2));
if norm(vertical_in)~=0
    vertical_in = vertical_in/norm(vertical_in);
    vertical_in = vertical_in;
    parallel_in = cross(ray_vector,vertical_in);
    parallel_in = parallel_in/norm(parallel_in);
    parallel_in = parallel_in;
    vertical_ref = vertical_in;
    parallel_ref = cross(newray(1,1:3),vertical_in);
    parallel_ref = parallel_ref/norm(parallel_ref);
    
    %cos_eta = dot(parallel_in,ray_vector);
    %cos_eta = cos_eta/norm(cos_eta);
    %cos_gama = dot(vertical_in,ray_vector);
    %cos_gama = cos_gama/norm(cos_gama);
    
    
    %rcoe_para= parallel_in.*parallel_ref.*R_parallel;%平行极化反射系数
    rcoe_para= dot(parallel_in,parallel_ref).*R_parallel;%平行极化反射系数
    %rcoe_ver = vertical_in.*vertical_ref.*R_vertical;%垂直极化反射系数
    rcoe_ver = dot(vertical_in,vertical_ref).*R_vertical;%垂直极化反射系数
    rcoe = rcoe_para+rcoe_ver;
else
    rcoe = R_parallel;
end
