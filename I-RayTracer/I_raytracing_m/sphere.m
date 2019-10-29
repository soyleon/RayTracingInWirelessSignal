%%
figure(2)
title('DOA')
t=linspace(0,pi,25);
p=linspace(0,2*pi,25);
[theta,phi]=meshgrid(t,p);
x=sin(theta).*sin(phi);
y=sin(theta).*cos(phi);
z=cos(theta);
plot3(x,y,z,'Color',[0.01,0.8,0.8]);
axis equal;
title('DOA');
hold on;
num_ray = size(DOA{1,1});
for i = 1:num_ray(1,2)
    angel_arrived_x(i) = DOA{1,1}{1,i}(1,1);
    angel_arrived_y(i)= DOA{1,1}{1,i}(1,2);
    angel_arrived_z(i) = DOA{1,1}{1,i}(1,3);
    plot3([-angel_arrived_x(i),0],[-angel_arrived_y(i),0],[-angel_arrived_z(i),0]);
end
saveas(2,'DOA.jpg')

%%
figure(3)
title('DOD')
t=linspace(0,pi,25);
p=linspace(0,2*pi,25);
[theta,phi]=meshgrid(t,p);
x=sin(theta).*sin(phi);
y=sin(theta).*cos(phi);
z=cos(theta);
plot3(x,y,z,'Color',[0.01,0.8,0.8]);
axis equal;
title('DOA');
hold on;
num_ray = size(DOD{1,1});
for i = 1:num_ray(1,2)
    angel_departure_x(i) = DOD{1,1}{1,i}(1,1);
    angel_departure_y(i)= DOD{1,1}{1,i}(1,2);
    angel_departure_z(i) = DOD{1,1}{1,i}(1,3);
    plot3([0,angel_departure_x(i)],[0,angel_departure_y(i)],[0,angel_departure_z(i)]);
end

saveas(3,'DOD.jpg')

figure(4)

    stem(time_delay{1,1}(1,1:n0(1)-1),pathloss_ray_dB{1,1}(1,1:n0(1)-1))
    grid on
    xlabel('Time Delay£¨ns£©')
    ylabel('Path loss£¨dB£©')
    title('Power Delay Profile')
    saveas(4,'time_pl.jpg')


