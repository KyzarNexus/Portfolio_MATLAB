% Testing space for 3d animation of a mesh grid.
clear;clc;clf;
domain = 2*pi;
div= pi/40;
theta = 0:div:domain;
phi = 0:div:domain;

[theta, phi] = meshgrid(theta,phi);

z = sin(theta).*sin(phi);

s = surf(theta,phi,z);

light               % add a light
lighting gouraud    % preferred lighting for a curved surface
axis equal off      % set axis equal and remove axis
view(40,30)         % set viewpoint
camzoom(1.5)        % zoom into scene
shading interp

length = 200;
for ii = -50:length
    phase1 = ii*pi/length;
    phase2 = ii*pi/length;
    thetaN = theta + phase1;
    phiN = phi + phase2;
    zN = sin(thetaN).*sin(phiN);
    title('Okay, so that title on the sphere file didn''t work but this one somehow does??')
    s.XData = thetaN;    % replace surface x values
    s.YData = phiN;    % replace surface y values
    s.ZData = zN;    % replace surface z values
    pause(0.05)     % pause to control animation speed
end