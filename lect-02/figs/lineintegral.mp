%
% MetaPost drawing of the line integral from which we via Stokes' theorem
% can deduce that the rotation of the static electric field is identically
% zero.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

%
% The electric monopole (point charge) including field lines.
%
picture elmonopole;
elmonopole := image(
  rc := 2u;
  pickup pencircle scaled 1pt;
  fill fullcircle scaled (2rc) withcolor .75[black,white];
  draw fullcircle scaled (2rc) withcolor black;
  n := 7;
  for k = 0 upto n:
    phi := ((k)/(n))*360.0;
    drawarrow (0u,0u)--(12u*(cosd(phi),sind(phi)));
  endfor
);

beginfig(1);
  path p, pv;
  pair pa, pb, v;
  pickup pencircle scaled 1pt;

  %
  % Draw the Cartesian coordinate system.
  %
  p := (0u,-2u)--(0u,22u);
  pv := p rotated 0;  % z-axis
  drawarrow p rotated 0 withcolor black;
  label.ulft(btex $z$ etex, point 1.0 of pv);
  pv := p rotated 130;  % x-axis
  drawarrow pv withcolor black;
  label.ulft(btex $x$ etex, point 1.0 of pv);
  pv := p rotated 260;  % y-axis
  drawarrow pv withcolor black;
  label.urt(btex $y$ etex, point 1.0 of pv);

  %
  % Draw the point charge and its field lines.
  %
  draw elmonopole shifted (0u,0u);
  label.top(btex $q'$ etex, (-4u,3u));
  label.top(btex ${\bf E}({\bf x})$ etex, (16u,0u));

  %
  % Draw the trajetory and its starting and end points.
  %
  pa:=(15u,35u);
  pb:=(38u,-20u);
  p:=pa{dir 30}..(20u,24u)..(20u,8u)..(30u,15u)..pb;
  draw p;
  dotlabel.ulft(btex ${\bf x}_a$ etex, pa);
  dotlabel.urt(btex ${\bf x}_b$ etex, pb);
  drawarrow (0u,0u)--pa dashed evenly withcolor black;
  drawarrow (0u,0u)--pb dashed evenly withcolor black;
  label.ulft(btex $r_a$ etex,point 0.5 of ((0u,0u)--pa));
  label.llft(btex $r_b$ etex,point 0.5 of ((0u,0u)--pb));

  %
  % Draw the line element dl of the trajectory Gamma.
  %
  label.top(btex $\Gamma$ etex, point 3.1 of p);
  v:=point 3.3 of p;
  label.urt(btex $d{\bf l}$ etex,v);
  phi:=-41;
  pickup pencircle scaled 3pt;
  draw subpath (3.28,3.32) of p;
  pickup pencircle scaled 1pt;
  drawarrow v--(v+10u*(cosd(phi),sind(phi)));

endfig;
end
