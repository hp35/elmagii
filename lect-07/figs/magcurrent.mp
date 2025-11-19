%
% MetaPost drawing of the equivalent bound surface and volume currents
% corresponding to the local magnetization of a magnetized object.
%
% Copyright (C) 2023, Fredrik Jonsson
%
u = 1mm;

picture magdipole;
magdipole := image(
  draw halfcircle rotated (120) xscaled 6u yscaled 2u;
  drawarrow halfcircle rotated (180+70) xscaled 6u yscaled 2u;
  draw (0u,-4u)--(0u,-2u);
  drawarrow (0u,0u)--(0u,4u);
);

beginfig(1);
  pickup pencircle scaled 1pt;
  path p;
  pair pa;
  p:=(0u,-10u){dir 0}..(30u,10u)..(5u,10u)..(-15u,20u)
    ..(-10u,-10u)..{dir 0}(0u,-10u)--cycle;
  fill p withcolor .975[black,white];
  draw p;
  
  %
  % Draw the unpolarized/random molecules.
  %
  draw magdipole rotated 45 shifted (-15u,3u);
  draw magdipole rotated 35 shifted (-3u,7u);
  draw magdipole rotated 30 shifted (0u,-2u);
  draw magdipole rotated 20 shifted (17u,-2u);
  label.top(btex ${\bf M}$ etex, (-14u,14u));

  %
  % Bound surface and volume currents.
  %
  label.rt(btex ${\bf J}_{\rm b}=\nabla\times{\bf M}
      \quad(\hbox{volymstr{\"o}m})$ etex, (50u,20u));
  draw (50u,20u){dir 180}..{dir 190}(8u,4u);
  label.rt(btex ${\bf K}_{\rm b}={\bf M}\times{\bf e}_n
      \quad(\hbox{ytstr{\"o}m})$ etex, (50u,10u));
  draw (50u,10u){dir 180}..{dir 190}(31u,0u);

  %
  % Draw the normal to the surface
  %
  pa:=point 2.4 of p;
  drawarrow pa--(pa shifted (6u,8u));
  label.rt(btex ${\bf e}_n$ etex,(pa shifted (6u,8u)));
  draw (pa shifted 0.2(6u,8u))
    --(pa shifted 0.2(6u,8u) shifted 0.2(-8u,6u))
    --(pa shifted 0.2(-8u,6u));

endfig;
end
