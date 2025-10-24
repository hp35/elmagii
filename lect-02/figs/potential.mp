%
% MetaPost drawing of the line integral from which we deduce the existence
% of the (scalar) electrostatic potential.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, pv;
  pair pa, pb, v;
  pickup pencircle scaled 1pt;

  p:=(-30u,10u)..(0u,-4u)..(40u,-10u);
  drawarrow p scaled 0.8 shifted (0u,20u);
  drawarrow p scaled 0.9 shifted (0u,15u);
  drawarrow p scaled 1.0 shifted (0u,10u);
  drawarrow p scaled 1.1 shifted (0u,5u);
  drawarrow p scaled 1.2 shifted (0u,0u);
  label.lft(btex ${\bf E}({\bf x})$ etex,(-30u,22u));

  %
  % Draw the gamma trajectory and its starting and end points.
  %
  pa:=(25u,17u);
  pb:=(-28u,-10u);
  p:=pa{dir 150}..{dir 160}pb;
  draw p;
  dotlabel.urt(btex ${\bf x}_a$ etex, pa);
  dotlabel.ulft(btex ${\bf x}_b$ etex, pb);
  label.top(btex $\Gamma$ etex, point 0.2 of p);

  %
  % Draw the line element dl of the trajectory Gamma.
  %
  qval:=0.45;
  v:=point qval of p;
  phi:=-126;
  drawarrow v--(v+7u*(cosd(phi),sind(phi)));
  label.urt(btex $d{\bf l}$ etex,(v+7u*(cosd(phi),sind(phi))) shifted (1u,-1u));
  phi:=-16;
  fill fullcircle scaled 3u shifted v withcolor .95[black,white];
  draw fullcircle scaled 3u shifted v withcolor black;
  label.lft(btex $q$ etex, (-2u,1.5u) shifted v);
  pickup pencircle scaled 3pt;
  pickup pencircle scaled 1pt;
  drawarrow v--(v+10u*(cosd(phi),sind(phi)));
  label.rt(btex ${\bf F}({\bf x})$ etex,(v+10u*(cosd(phi),sind(phi))));

endfig;
end
