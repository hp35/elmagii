%
% MetaPost drawing of the hysteresis curve in magnetostatics.
%
% Copyright (C) 2023, Fredrik Jonsson
%
u = 1mm;

beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the electric dipole model
  %
  path p;
  p := (-18u,-10u){dir 0}..(0u,-4u)..{dir 0}(18u,10u){dir 180}
    ..(0u,4u)..{dir 180}(-18u,-10u)--cycle;
  fill p withcolor .9[black,white];
  draw p;

  drawarrow (-20u,0u)--(20u,0u);
  label.urt(btex $B$ (Tesla) etex,(0u,12u));
  drawarrow (0u,-12u)--(0u,12u);
  label.urt(btex $H$ (Henry) etex,(20u,0u));

  dotlabel.ulft(btex $B\cdot H$ etex,(-18u,10u));
  draw (-18u,10u){dir -20}..{dir -20}(-5u,-3u);

  dotlabel.rt(btex (saturation) etex,(18u,10u));
  dotlabel.lft(btex (saturation) etex,(-18u,-10u));
endfig;
end
