function [newray] = reflected_map(rp,vx,vy,vz,n_face)
% get the direction of the reflected ray and get the reflection coeff
ray_vector = [vx,vy,vz];
i = rp(1,5);
nvector = n_face(i,1:3);

dir_ray = dot(ray_vector,nvector);
newray(1,1:3) = ray_vector-2*dir_ray*nvector;