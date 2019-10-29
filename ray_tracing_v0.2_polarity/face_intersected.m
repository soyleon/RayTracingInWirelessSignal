function [point_fin] =  face_intersected(vx,vy,vz,tx,ty,tz,n_face,p_allface)
% judge the final intersected point
num_face = size(n_face);
for i = 1:num_face(1,1)
    [point(i,:),dis(1,i)] = intersection_sigleface(n_face(i,:),p_allface(:,(3*i-2):3*i),vx,vy,vz,tx,ty,tz);
end

[min_dis,index] = min(dis);
point_fin = [point(index,:),min_dis,index];
