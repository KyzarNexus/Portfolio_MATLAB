clear;clc;clf;

%sphereTest
theta = 0:pi/40:pi;                   % polar angle
phi = 0:pi/20:2*pi;                   % azimuth angle

[phi,theta] = meshgrid(phi,theta);    % define the grid

degree = 100;
order = 10;
amplitude = 20;
radius = 10;

Ymn = legendre(degree,cos(theta(:,1)));
Ymn = Ymn(order+1,:)';
yy = Ymn;

for kk = 2: size(theta,1)
    yy = [yy Ymn];
end

yy = yy.*cos(order*phi);

order = max(max(abs(yy)));
rho = radius + amplitude*yy/order;

r = rho.*sin(theta);    % convert to Cartesian coordinates
x = r.*cos(phi);
y = r.*sin(phi);
z = rho.*cos(theta);

s = surf(x,y,z,'FaceColor','r');
light               % add a light
lighting gouraud    % preferred lighting for a curved surface
axis equal off      % set axis equal and remove axis
view(40,30)         % set viewpoint
camzoom(1.5)        % zoom into scene
scale = [linspace(0,1,20) linspace(1,-1,40)];    % surface scaling (0 to 1 to -1)
index = length(scale);
for ii = 1:index
    rho = radius + scale(ii)*amplitude*yy/order;

    r = rho.*sin(theta);
    x = r.*cos(phi);
    y = r.*sin(phi);
    z = rho.*cos(theta);
    s.XData = x;    % replace surface x values
    s.YData = y;    % replace surface y values
    s.ZData = z; % replace surface z values
    pause(0.1)     % pause to control animation speed
end
