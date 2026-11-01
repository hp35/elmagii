%
% MetaPost drawing of the vector field corresponding to the magnetic field
% from Biot--Savarts law for a straight current through origo, directed in
% the positive z-direction. This figure is intended to illustrate that the
% rotation of a field as such can be zero despite that the field as such
% obviously is going circularly around a point.
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
  % Draw the magnetic field according to Biot--Savart's law.
  %
  normfactor:=300;
  nx:=6;  dx:=10u;
  ny:=6;  dy:=10u;
  for kx=0 upto (nx-1):
    x:=(kx-(nx-1)/2)*dx;
    for ky=0 upto (ny-1):
      y:=(ky-(ny-1)/2)*dy;
      arrowlength:=(1/length((x,y)))*normfactor;
      arrowdirection:=unitvector((-y,x));
      drawtexarrow ((0u,0u)--(arrowlength*arrowdirection)) shifted (x,y);
    endfor;
  endfor;

  %
  % Draw a simple label indicating the non-zero divergence of the
  % inhomogeneous field.
  %
  label.rt(btex $\nabla\times{\bf B}={\bf 0}$, {\"o}verallt d{\"a}r
                ${\bf x}\ne{\bf x}'$ etex,(34u,2.5dy));
  draw (34u,2.5dy){dir 190}..{dir 190}(dx,dy);
  dotlabel(btex etex,(dx,dy));
  label.rt(btex ${\bf J}({\bf x})=I\delta(x)\delta(y){\bf e}_z$ etex,
      (34u,-16u));
  draw (34u,-16u){dir 170}..{dir 160}(.4u,-.4u);
  label(btex $|{\bf B}({\bf x})|\sim 1/(x^2+y^2)^{1/2}$ etex,(-5dx,dy));
  label.top(btex Magnetf{\"a}lt fr{\aa}n Biot--Savarts lag etex,
      (origo shifted (0u,(ny/2)*dx)) shifted (0u,3u));
  
endfig;
end
