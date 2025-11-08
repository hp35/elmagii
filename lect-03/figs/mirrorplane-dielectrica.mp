%
% MetaPost drawing of a charge q placed at $z=h$ and a mirror charge placed at
% $z=-h$, constuting the "gedankenexperiment" of mirror charges and perfectly
% conducting planes.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  pair pa, pb;
  color gray;
  gray := .875[black,white];

  %
  % Draw the coordinate system.
  %
  pickup pencircle scaled 1pt;
  fill ((-45u,-30u)--(45u,-30u)--(45u,0u)--(-45u,0u)--(-45u,-30u)--cycle)
    withcolor gray;
  drawarrow (-50u,0u)--(50u,0u);
  label.urt(btex $x$ etex,(40u,0u));
  drawarrow (0u,-35u)--(0u,35u);
  label.urt(btex $z$ etex,(0u,35u));
  r:=1.5u;
  p := fullcircle scaled (2*r) shifted (0u,0u);
  fill p withcolor white;
  draw p withcolor black;
  s:=sqrt(2)/2;
  pa := (s*r,s*r);
  pb := -pa;
  draw pa--pb;
  pa := (-s*r,s*r);
  pb := -pa;
  draw pa--pb;
  label.lrt(btex $y$ etex,(1u,-1u));

  %
  % Draw the point charge placed at z=h.
  %
  h:=25u;
  p:=fullcircle scaled 2u shifted (0u,h);
  fill p withcolor black;
  label.lft(btex $q$ etex,(-2u,h));
  label.lft(btex $h$ etex,(0u,h/2));

  %
  % Draw the point charge placed at z=-h.
  %
  p:=fullcircle scaled 2u shifted (0u,-h);
  fill p withcolor black;
  label.lft(btex $q'$ etex,(-2u,-h));
  label.lft(btex $h$ etex,(0u,-h/2));

  %
  % Boundary condition phi=0 at z=0.
  %
  label.top(btex $\phi=0$ vid $z=0$ etex, (-26u,0u));
  label.top(btex Permittivitet $\varepsilon_{\rm r}$ etex,(-26u,14u));
  label.bot(btex Permittivitet $\varepsilon'_{\rm r}$ etex,(-26u,-14u));

  %
  % Mission statement.
  %
  label.urt(btex S{\"o}kt: $\phi({\bf x})$ etex,(18u,30u));

  %
  % Geometry of mirrored charges, starting with the top charge q, ...
  %
  x:=35u;
  zp:=15u;
  pa:=(0u,h);
  pb:=(x,zp);
  p:=pa--pb;
  draw p dashed evenly;
  label.top(btex $\sqrt{x^2+y^2+(z-h)^2}$ etex,(0u,0u)) rotated angle(pb-pa)
    shifted (point 0.5 of p);

  %
  % ... followed by the bottom charge -q.
  %
  pa:=(0u,-h);
  pb:=(x,zp);
  p:=pa--pb;
  draw p dashed evenly;
  label.bot(btex $\sqrt{x^2+y^2+(z+h)^2}$ etex,(0u,0u)) rotated angle(pb-pa)
    shifted (point 0.5 of p);

  dotlabel.rt(btex $\phi({\bf x})$ etex,(x,zp));

endfig;
end
