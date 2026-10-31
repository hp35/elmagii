%
% MetaPost drawing of a plain parallel-plate capacitor subject to a
% potential difference between the two plates.
%
% Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
%
u:=1mm;

%
% Employing the TeX-arrow package by Tommy Ekola.
%
input ../../worldmap/macros/cmarrows/cmarrows.mp
setup_cmarrows(
  arrow_name = "texarrow";
  parameter_file = "cmr12.mf";
  macro_name = "drawtexarrow");

beginfig(1);

  pickup pencircle scaled 1pt;

  %
  % Draw the coordinate system and origo.
  %
  drawarrow (-20u,-4u)--(40u,-4u);
  label.urt(btex $x$ etex,(40u,-4u));
  draw (0u,-6u)--(0u,-2u);     label.bot(btex $x$ etex,(0u,-6u));
  draw (14u,-6u)--(14u,-2u);   label.bot(btex $x+a$ etex,(14u,-6u));

  %
  % Draw the plate capacitor.
  %
  pickup pencircle scaled 3pt;
  draw (0u,0u)--(0u,30u);
  draw (14u,0u)--(14u,30u);
  pickup pencircle scaled 1pt;
  label.top(btex $\phi_0$ etex,(-10u,40u));
  draw (-10u,40u){dir 280}..{dir 280}(0u,32u);
  label.top(btex $\phi_0-U_0$ etex,(24u,40u));
  draw (24u,40u){dir 260}..{dir 260}(14u,32u);
  label.rt(btex $\phi(x)=\phi_0-({{U_0}/{a}})x$ etex,(30u,24u));
  draw (7u,15u){dir 10}..{dir 10}(30u,24u);
  dotlabel(btex etex,(7u,15u));
  drawarrow (1u,32u){dir 30}..{dir -30}(13u,32u);
  label.top(btex $\Delta U=U_0$ etex,(7u,35u));

  %
  % Draw the electric field.
  %
  y:=3u;  drawtexarrow (0u,y)--(7u,y);   draw (0u,y)--(14u,y);
  y:=11u;  drawtexarrow (0u,y)--(7u,y);   draw (0u,y)--(14u,y);
  y:=19u;  drawtexarrow (0u,y)--(7u,y);   draw (0u,y)--(14u,y);
  y:=27u;  drawtexarrow (0u,y)--(7u,y);   draw (0u,y)--(14u,y);
  label.top(btex ${\bf E}$ etex,(10u,3u));
  label.lft(btex ${\bf E}=-\nabla\phi$ etex,(-30u,24u));
  draw (-30u,24u){dir -10}..{dir -10}(3u,11u);
  dotlabel(btex etex,(3u,11u));


endfig;
end
