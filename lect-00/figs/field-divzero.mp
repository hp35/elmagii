%
% MetaPost drawing of a homogeneous vector field, everywhere possessing
% a zero divergence.
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
  pair origo;
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
  % Draw the homogeneous field.
  %
  arrowlength:=4u;
  nx:=6;  dx:=10u;
  ny:=6;  dy:=10u;
  for kx=0 upto (nx-1):
    x:=(kx-(nx-1)/2)*dx;
    for ky=0 upto (ny-1):
      y:=(ky-(ny-1)/2)*dy;
      drawtexarrow ((-arrowlength/2,0u)--(arrowlength/2,0u)) shifted (x,y);
    endfor;
  endfor;

  %
  % Draw a simple label indicating the zero divergence of the homogeneous
  % field.
  %
  label(btex ${\bf a}=a_0{\bf e}_x$ etex,(-dx,-dy));
  label.rt(btex $\nabla\cdot{\bf a}=0$, {\"o}verallt etex,(31u,2dy));
  draw (31u,2dy){dir 190}..{dir 190}(dx,dy);
  dotlabel(btex etex,(dx,dy));
  
endfig;
end
