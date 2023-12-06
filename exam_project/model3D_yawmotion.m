%YAW MOTION
for i = 1:length(out.X)
    X_data(i,1) = out.X(i);
    Y_data(i,1) = out.Y(i);
    Z_data(i,1) = out.Z(i);
    Psi_data(i,1) = out.Psi(i);
    Phi_data(i,1) = out.Phi(i);
    Theta_data(i,1) = out.Theta(i);
end


L1 = 2*L*cos(alpha*pi/180); %0.5150
L2 = 2*L*sin(alpha*pi/180); %0.2250
L3 = 0.1;

 video = VideoWriter('video_yaw_motion','MPEG-4');
 open(video);


for j = 1:length(X_data)
    phi = Phi_data(j);
    theta = Theta_data(j);
    psi = Psi_data(j);
    % 
    R = [cos(psi)*cos(theta) (cos(psi)*sin(theta)*sin(phi)-sin(psi)*cos(phi)) (cos(psi)*sin(theta)*cos(phi)+sin(psi)*sin(phi));
     sin(psi)*cos(theta) (sin(phi)*sin(theta)*sin(psi)+ cos(psi)*cos(phi)) (sin(psi)*sin(theta)*cos(phi)- cos(psi)*sin(phi));
     -sin(theta) cos(theta)*sin(phi) cos(theta)*cos(phi)];

    x_1 = X_data(j);
    y_1 = Y_data(j);
    z_1 = -(Z_data(j));

   % plot3(x_1,y_1,z_1, '-o')

    %Chassis dimensions
    x1 = L1;
    y1 = L2;
    z1 = L3;

    VER = [ 
    x_1-x1/2 y_1-y1/2 z1/2+z_1; %p0+
    x1/2+x_1 y_1-y1/2 z1/2+z_1; %p1+
    x1/2+x_1 y1/2+y_1 z1/2+z_1; %p3+
    x_1-x1/2 y1/2+y_1 z1/2+z_1; %p2+
    x_1-x1/2 y_1-y1/2 z_1-z1/2; %p0-
    x1/2+x_1 y_1-y1/2 z_1-z1/2; %p1-
    x_1+x1/2 y1/2+y_1 z_1-z1/2; %p3-
    x_1-x1/2 y_1+y1/2 z_1-z1/2 ];%p2-

    ver_1 = R*(VER(1,:)');
    ver_2 = R*(VER(2,:)');
    ver_3 = R*(VER(3,:)');
    ver_4 = R*(VER(4,:)');
    ver_5 = R*(VER(5,:)');
    ver_6 = R*(VER(6,:)');
    ver_7 = R*(VER(7,:)');
    ver_8 = R*(VER(8,:)');

    VER_1 = [ ver_1';
            ver_2';
            ver_3';
            ver_4';
            ver_5';
            ver_6';
            ver_7';
            ver_8'];

    grid on
    xlabel X(m)
    ylabel Y(m)
    zlabel Z(m)
    axis manual
    axis([-10 10 -10 10 -10 10])
    rectangle(VER_1,'b')

    hold on
    
    p0 = [ver_1(1,1) ver_1(2,1) ver_1(3,1)];
    p1 = [ver_2(1,1) ver_2(2,1) ver_2(3,1)];
    p2 = [ver_3(1,1) ver_3(2,1) ver_3(3,1)];
    p3 = [ver_4(1,1) ver_4(2,1) ver_4(3,1)];
    
    propellers(p0);
    propellers(p1);
    propellers(p2);
    propellers(p3);
    hold on

    %FIN
    l1 = L1;
    l2 = 0.01;
    l3 = 0.11;
    
    FIN = [
       x_1-x1/2 y_1-l2/2 z_1-z1/2;
       x_1+x1/2 y_1-l2/2 z_1-z1/2;
       x_1+x1/2 y_1+l2/2 z_1-z1/2;
       x_1-x1/2 y_1+l2/2 z_1-z1/2;
       x_1-x1/2 y_1-l2/2 z_1-z1/2-l3;
       x_1+x1/2 y_1-l2/2 z_1-z1/2-l3;
       x_1+x1/2 y_1+l2/2 z_1-z1/2-l3;
       x_1-x1/2 y_1+l2/2 z_1-z1/2-l3];

    fin_1 = R*(FIN(1,:)');
    fin_2 = R*(FIN(2,:)');
    fin_3 = R*(FIN(3,:)');
    fin_4 = R*(FIN(4,:)');
    fin_5 = R*(FIN(5,:)');
    fin_6 = R*(FIN(6,:)');
    fin_7 = R*(FIN(7,:)');
    fin_8 = R*(FIN(8,:)');

    FIN_1 =[fin_1';
        fin_2';
        fin_3';
        fin_4';
        fin_5';
        fin_6';
        fin_7';
        fin_8'];
    
    rectangle(FIN_1,'y')

     animation = getframe(gcf);
     writeVideo(video,animation);

    pause(0.001)
    
    cla reset

end

close(video);



function rectangle(coord,col)
    idx = [4 8 5 1 4; 1 5 6 2 1; 2 6 7 3 2; 3 7 8 4 3; 5 8 7 6 5; 1 4 3 2 1]';
    xc = coord(:,1);
    yc = coord(:,2);
    zc = coord(:,3);
    %ax(1) = subplot(2,1,1);
    patch(xc(idx), yc(idx), zc(idx), col, 'facealpha', 1);
    view(3);
end

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
    %Yaw Motion axis
    xlim([-0.5 2.5])
    ylim([-1 2])
    zlim([-3 0.5])
    axis manual  %show proportions correctly
end
