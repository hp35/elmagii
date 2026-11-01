%
% MetaPost drawing of an inhomogeneous vector field which gives rise to a
% non-zero rotation everywhere despite that the field lines everywhere are
% parallel.
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
  % Draw the inhomogeneous field.
  %
  normfactor:=10;
  nx:=6;  dx:=10u;
  ny:=6;  dy:=10u;
  ymin:=-((ny-1)/2)*dy;
  ymax:=((ny-1)/2)*dy;
  for kx=0 upto (nx-1):
    x:=(kx-(nx-1)/2)*dx;
    for ky=0 upto (ny-1):
      y:=(ky-(ny-1)/2)*dy;
      arrowlength:=4u-(y-ymax)/normfactor;
      arrowdirection:=unitvector((1,0));
      drawtexarrow ((0u,0u)--(arrowlength*arrowdirection)) shifted (x,y);
    endfor;
  endfor;

  %
  % Draw a simple label indicating the non-zero divergence of the
  % inhomogeneous field.
  %
  label(btex ${\bf a}=(a_0-a_1 y)\,{\bf e}_x$ etex,(-dx,-dy));
  label.rt(btex $\nabla\times{\bf a}=a_0{\bf e}_z$, {\"o}verallt etex,
      (34u,2dy));
  draw (34u,2dy){dir 190}..{dir 190}(dx,dy);
  dotlabel(btex etex,(dx,dy));
  label.top(btex Exempel p{\aa} inhomogent men parallellt vektorf{\"a}lt etex,
      (origo shifted (0u,(ny/2)*dx)) shifted (0u,0u));

endfig;
end
