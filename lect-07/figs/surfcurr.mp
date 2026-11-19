%
% MetaPost drawing of the equivalent bound surface current of a magnetized
% cylindrical object.
%
% Copyright (C) 2026, Fredrik Jonsson
%
u = 1mm;

picture magdipole;
magdipole := image(
  draw halfcircle rotated (120) xscaled 6u yscaled (0.8*6u);
  drawarrow halfcircle rotated (180+70) xscaled 6u yscaled (0.8*6u);
  draw (0u,-5u)--(0u,-3.5u);
  drawarrow (0u,-1.5u)--(0u,5u);
);

beginfig(1);
  pickup pencircle scaled 1pt;
  path square, pa, pb, ra;
  ll:=40u; % Cylinder length
  rr:=40u; % Cylinder radius
  vd:=20;  % Angle of rotation in degrees

  square:=(-0.5,-0.5)--(0.5,-0.5)--(0.5,0.5)--(-0.5,0.5)--cycle;
  ra:=square xscaled ll yscaled rr shifted (ll/2,0u) rotated vd;
  fill ra withcolor .9[black,white];
  draw (point 0.0 of ra)--(point 1.0 of ra);
  draw (point 2.0 of ra)--(point 3.0 of ra);

  pa:=fullcircle rotated -90 xscaled .8rr yscaled rr rotated vd;
  pb:=halfcircle rotated -90 xscaled .8rr yscaled rr rotated vd;
  fill pa shifted (ll*(cosd(vd),sind(vd))) withcolor .9[black,white];
  draw pb shifted (ll*(cosd(vd),sind(vd)));
  fill pa shifted (0u,0u) withcolor .96[black,white];
  draw pa shifted (0u,0u);

  drawarrow (0u,0u)--(-30u*(cosd(vd),sind(vd)));
  label.ulft(btex ${\bf M}$ etex,(-30u*(cosd(vd),sind(vd))));
  draw magdipole rotated (90+vd) shifted (0u,0u);

  for kr=1 upto 3:
    d:=kr*(7u);
    for kphi=0 upto 5*kr:
      phi:=kphi*60/(kr);
      x:=0.8*d*cosd(phi);
      y:=d*sind(phi);
      draw magdipole scaled .9 rotated (90+vd) shifted (x,y);
    endfor;
  endfor;
  
endfig;
end
