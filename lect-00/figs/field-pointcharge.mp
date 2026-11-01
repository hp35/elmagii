%
% MetaPost drawing of a the electric field from a positive point charge.
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
  pair origo, xp, arrowdirection;
  origo:=(0u,0u);
  xp:=(26u,26u);

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
  n:=6;
  for k=0 upto (n-1):
    phi:=k*360/n;
    arrowdirection:=unitvector((sind(phi),cosd(phi)));
    drawtexarrow ((arrowlength*arrowdirection)
	--(2*arrowlength*arrowdirection)) shifted xp;
  endfor;
  label(btex ${\bf E}({\bf x})$ etex,(xp shifted (8u,8u)));

  %
  % Draw a simple label indicating the zero divergence of the homogeneous
  % field.
  %
  drawarrow origo--(xp shifted (-.7u,-.7u));
  label.lrt(btex ${\bf x}'$ etex, .5[origo,xp]);
  dotlabel.urt(btex $q$ etex, xp);
  fill fullcircle scaled 2u shifted xp withcolor black;
  draw (xp shifted (5u,0u)){dir -20}..{dir -20}(xp shifted (20u,-10u));
  label.rt(btex $\rho({\bf x})=q\delta^{(3)}({\bf x}-{\bf x}')$ etex,
      (xp shifted (20u,-10u)));
  label(btex $\Downarrow$ etex, (xp shifted (30u,-16u)));
  label(btex $\nabla\cdot{\bf E}=\rho({\bf x})/\varepsilon_0=0,
                 \quad{\bf x}\ne{\bf x}'$ etex, (xp shifted (38u,-22u)));
%  label(btex ${\bf a}=a_0{\bf e}_x$ etex,(-dx,-dy));
%  label.rt(btex $\nabla\cdot{\bf a}=0$, {\"o}verallt etex,(31u,2dy));
%  draw (31u,2dy){dir 190}..{dir 190}(dx,dy);
%  dotlabel(btex etex,(dx,dy));
%  label.top(btex Exempel p{\aa} homogent vektorf{\"a}lt etex,
%      (origo shifted (0u,(ny/2)*dx)) shifted (0u,0u));
  
endfig;
end
