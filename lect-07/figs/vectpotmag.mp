%
% MetaPost drawing of the geometry in which we extract the vector potential
% for a single magnetic dipole.
%
% Copyright (C) 2026, Fredrik Jonsson
%
u := 1mm;

picture magdipole;
magdipole := image(
  pickup pencircle scaled 1pt;
  draw halfcircle rotated (120) xscaled 6u yscaled (0.4*6u);
  drawarrow halfcircle rotated (180+70) xscaled 6u yscaled (0.4*6u);
  draw (0u,-5u)--(0u,-2.0u);
  drawarrow (0u,-0.0u)--(0u,5u);
);

beginfig(1);
  pickup pencircle scaled 1pt;
  pair origo, xs, xo, p;
  origo:=(0u,0u);
  xs:=(-20u,16u);
  xo:=(30u,30u);
  drawarrow ((4u,1u)--(-8u,-2u)) shifted origo;
  drawarrow ((-4u,1u)--(8u,-2u)) shifted origo;
  drawarrow ((0u,-5u)--(0u,10u)) shifted origo;
  label.ulft(btex $x$ etex,(-8u,-2u)) shifted origo;
  label.urt(btex $y$ etex,(8u,-2u)) shifted origo;
  label.ulft(btex $z$ etex,(0u,10u)) shifted origo;

  %
  % Draw the magnetic dipole, placed at the source point x'.
  %
  drawarrow origo--xs;
  label.urt(btex ${\bf x}'$ etex,.5[origo,xs]);
  draw magdipole shifted xs;
  label.top(btex ${\bf m}$ etex,xs shifted (0u,5u));

  %
  % Draw the observation point x and the vector x-x' from the source
  % to the observation point.
  %
  drawarrow origo--xo;
  label.ulft(btex ${\bf x}$ etex,.5[origo,xo]);
  drawarrow xs--xo;
  p:=unitvector(xo-xs);
  vd:=angle p;
  label.ulft(btex ${\bf x}-{\bf x}'$ etex,(0u,0u)) rotated vd shifted .5[xs,xo];
  label.rt(btex ${\bf A}({\bf x})$ etex,xo);

endfig;
end
