%
% MetaPost drawing of a domain with a homogeneous distribution of current
% density, leading to the rotation of the static magnetic field being
% positive everywhere in the domain.
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
  path p;
  pair origo, arrowdirection;
  origo:=(0u,0u);

  %
  % Draw the coordinate system and origo, just as a reference on
  % the two-dimensional plane coordinates.
  %
  drawarrow (origo shifted (-4u,0u))--(origo shifted (7u,0u));
  label.urt(btex $x$ etex,(origo shifted (7u,0u)));
  drawarrow (origo shifted (0u,-4u))--(origo shifted (0u,7u));
  label.urt(btex $y$ etex,(origo shifted (0u,7u)));
  p:=fullcircle scaled 3u shifted origo;
  fill p withcolor white;
  draw p;
  p:=fullcircle scaled .8u shifted origo;
  fill p withcolor black;
  label.llft(btex $z$ etex,origo shifted (-1u,-1u));

  %
  % Draw the homogeneous distrubution of a constant rotation as a field
  % of arcs of curling arrows.
  %
  nx:=6;  dx:=10u;
  ny:=6;  dy:=10u;
  p:=(subpath (0, 6.5) of fullcircle scaled 6u) rotated 90;
  for kx=0 upto (nx-1):
    x:=(kx-(nx-1)/2)*dx;
    for ky=0 upto (ny-1):
      y:=(ky-(ny-1)/2)*dy;
      drawtexarrow p shifted (x,y);
      draw fullcircle scaled 1.5u shifted (x,y);
      fill fullcircle scaled .5u shifted (x,y) withcolor black;
    endfor;
  endfor;

  %
  % Draw a simple label indicating the non-zero rotation of the homogeneous
  % current density.
  %
  label.rt(btex ${\bf J}({\bf x})=J_0{\bf e}_z=\hbox{konstant}$ etex,(34u,25u));
  draw (34u,2.5dy){dir 190}..{dir 190}(dx,dy);
  dotlabel(btex etex,(dx,dy));
  label.rt(btex $\Downarrow$ etex,(43u,18u));
  label.rt(btex $\nabla\times{\bf B}=\mu_0 J_0 {\bf e}_z$, {\"o}verallt etex,
      (34u,11u));
  label.rt(btex Samtidigt tycks ${\bf B}={\bf 0}$ {\"o}verallt! etex,
      (34u,4u));
  label.top(btex Dom{\"a}n med homogen str{\"o}mt{\"a}thet
      ${\bf J}({\bf x})$ etex, (origo shifted (0u,(ny/2)*dx)) shifted (0u,0u));

endfig;
end
