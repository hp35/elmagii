clear all; close all;

L = 1.0;
x = -2*L:L/100.23:2*L;
y = -2*L:L/100.23:2*L;
[xg,yg]=meshgrid(x,y);
f = log((yg+L/2+sqrt((yg+L/2).^2+xg.^2))./(yg-L/2+sqrt((yg-L/2).^2+xg.^2)));

imagesc(x,y,f,[0 3]); hold on;
% contour(x,y,f,[0,1,2]); hold off;
contour(x,y,f,[0.0:0.5:2.5],'r-','LineWidth',1); hold off;
colorbar;

axis('equal');
axis('tight');
xlabel('x/L');
ylabel('y/L');
