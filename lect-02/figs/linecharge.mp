%
% MetaPost drawing of a line charge enclosed by a "gaussian surface" with
% the purpose of extracting the electric field.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;

  p:= unitsquare xscaled 40u yscaled 15u shifted (-20u,-7.5u);
  fill p withcolor .975[black,white];
  draw p;
  p := fullcircle xscaled 5u yscaled 15u;
  fill p shifted (-20u,0u) withcolor .925[black,white];
  draw p shifted (-20u,0u) withcolor black;

  fill p shifted (20u,0u) withcolor .975[black,white];
  p := halfcircle rotated 90 xscaled 5u yscaled 15u;
  draw p shifted (20u,0u) withcolor .7[black,white];
  p := halfcircle rotated 270 xscaled 5u yscaled 15u;
  draw p shifted (20u,0u) withcolor black;

  drawarrow (-60u,0u)--(60u,0u);
  label.urt(btex $z$ etex,(60u,0u));

  %
  % Draw the line charge as such.
  %
  pickup pencircle scaled 3pt;
  draw (-55u,0u)--(55u,0u) withcolor black;
  draw (-20u,0u)--(20u,0u) withcolor .6[black,white];
  pickup pencircle scaled 1pt;
  label.top(btex Linjeladdning $\lambda$ (${\rm C}/{\rm m}$) etex, (-45u,10u));
  draw (-45u,10u){dir -80}..{dir -80}(-35u,2u);

  label.top(btex ``Gaussisk cylinder'' etex, (0u,12u));

  drawarrow (10u,0u)--(10u,7.5u);
  label.rt(btex $r$ etex,(10u,3.75u));
  label.top(btex S{\"o}kt: ${\bf E}={\bf e}_r E_r(r)$ etex,(45u,15u));
  draw (30u,15u){dir -110}..{dir -110}(17u,9u);
endfig;
end
