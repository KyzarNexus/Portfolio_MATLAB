theta = linspace(0,pi,20);
phi = linspace(0,2*pi,20);
[thetaM, phiM]= meshgrid(theta,phi);
x = sin(thetaM).*cos(phiM);
y = sin(thetaM).*sin(phiM);
z = cos(thetaM);

figure(1)
subplot(1,2,1); surf(x,y,z);
subplot(1,2,2); mesh(x,y,z);

