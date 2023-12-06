%HEAVE MOTION

for i = 1:length(out.X)
    X_data(i,1) = out.X(i);
    Y_data(i,1) = out.Y(i);
    Z_data(i,1) = out.Z(i);
end


L1 = 2*L*cos(alpha*pi/180); %0.5150
L2 = 2*L*sin(alpha*pi/180); %0.2250
L3 = 0.1;

 video = VideoWriter('video_heavemotion','MPEG-4');
 open(video);


for j = 1:length(X_data)
    x = X_data(j);
    y = Y_data(j);
    z = -(Z_data(j));

    grid on
    xlabel X(m)
    ylabel Y(m)
    zlabel Z(m)
    axis manual
    axis([-10 10 -10 10 -10 10])
    plotcube([L1 L2 L3],[x y z],.8,[0 0 1])

    hold on
    
    x1 = L1;
    y1 = L2;
    z1 = L3;
    
    p0 = [x y z1+z];
    p1 = [x1+x y z1+z];
    p2 = [x y1+y z1+z];
    p3 = [x1+x y1+y z1+z];
    

    propellers(p0);
    propellers(p1);
    propellers(p2);
    propellers(p3);
    hold on
    %FIN
    l1 = L1;
    l2 = 0.01;
    l3 = 0.11;
    plotcube([l1 l2 l3],[x y+L2/2 z-l3],.8,[1 1 0])

    anim=getframe(gcf);
    writeVideo(video,anim);
    pause(0.001)
    
    cla reset

end
 close(video);


function propellers(p)
r = 0.05;
    %[x1,y1,z1] = cylinder(r)
    % cylinder([x1 y1],r)
    %p0=[x1,y1,z1];  %base location
    [X,Y,Z] = cylinder(r);
    h = 0.02;
    Z = Z*h;
    X=X+p(1); Y=Y+p(2); Z=Z+p(3);  %translate cylinder to new location
    s = surf(X,Y,Z,'FaceColor','#80B3FF', 'EdgeColor','none');
    %alpha(s,.2)
    %Heave Motion axis
    xlim([-0.5 2.5])
    ylim([-1 2])
    zlim([-3 0.5])
    axis manual  %show proportions correctly
end
