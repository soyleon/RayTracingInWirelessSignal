function [point,dis] = intersection_sigleface(nvector,point_face,vx,vy,vz,tx,ty,tz)
% get the interscetion of rays and faces
ray_vector = [vx,vy,vz];
cosign = dot(ray_vector,nvector(1,1:3));
dis = -(nvector(1,1)*tx+nvector(1,2)*ty+nvector(1,3)*tz+nvector(1,4))/(cosign);
if dis <= 0
    point = [NaN,NaN,NaN];
    dis = NaN;
else
    inter_x = vx*dis+tx;
    inter_y = vy*dis+ty;
    inter_z = vz*dis+tz;
%     inter_x = roundn(inter_x,-4);
%     inter_y = roundn(inter_y,-4);
%     inter_z = roundn(inter_z,-4);
    if inter_x>(min(point_face(:,1))-0.001)&&inter_x<(max(point_face(:,1))+0.001)...
            &&inter_y>(min(point_face(:,2))-0.001)&&inter_y<(max(point_face(:,2))+0.001)...
            &&inter_z>(min(point_face(:,3))-0.001)&&inter_z<(max(point_face(:,3))+0.001)
        point = [inter_x,inter_y,inter_z];
    else
        dis = NaN;
        point = [NaN,NaN,NaN];
    end
end