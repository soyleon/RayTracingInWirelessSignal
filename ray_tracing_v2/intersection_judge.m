function intersect_index = intersection_judge(vx,vy,vz,tx,ty,tz,rx,ry,rz,n_face,p_allface)
%judge whether exit face between the reflected point and received point 
num_face = size(n_face);
for i = 1:num_face(1,1)
    [~,dis(1,i)] = intersection_sigleface(n_face(i,:),p_allface(:,(3*i-2):3*i),vx,vy,vz,tx,ty,tz);
end
[min_dis,~] = min(dis);
received_dis = sqrt((rx-tx)^2+(ry-ty)^2+(rz-tz)^2);
if min_dis < received_dis
    intersect_index = 0;
else
    intersect_index = 1;
end
