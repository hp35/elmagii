%
% MetaPost drawing of a charge q placed a distance d above an infinite
% and perfectly conducting plane $z=0$, providing the first example of
% application of the method of images.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  pair pa, pb;
  color gray;
  gray := .975[black,white];

  %
  % Draw the perfectly conducting infinite plane z=0.
  %
  pickup pencircle scaled 1pt;
  label.top(btex \vbox{
      \hbox{Perfekt ledande}
      \hbox{plan vid $z=0$}} etex,(-40u,20u));
  draw (-40u,20u){dir -80}..{dir -80}(-30u,1u);
  pickup pencircle scaled 2pt;
  draw (-35u,0u)--(35u,0u);

  %
  % Draw the coordinate system.
  %
  pickup pencircle scaled 1pt;
  drawarrow (-40u,0u)--(40u,0u);
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
  pickup pencircle scaled 1pt;
  draw (-35u,-4u){dir 60}..{dir 60}(-35u,4u);
  draw (35u,-4u){dir 60}..{dir 60}(35u,4u);

  %
  % Draw the point charge placed at z=h.
  %
  h:=25u;
  p:=fullcircle scaled 2u shifted (0u,h);
  fill p withcolor black;
  label.lft(btex $q$ etex,(-2u,h));
  label.lft(btex $h$ etex,(0u,h/2));

  %
  % Connection to ground (phi=0).
  %
  draw (-20u,0u)--(-20u,-10u);
  pa := (-20u,-10u);
  draw (pa shifted (-2.5u,0u))--(pa shifted (2.5u,0u));
  draw (pa shifted (-1.5u,-1u))--(pa shifted (1.5u,-1u));
  draw (pa shifted (-0.5u,-2u))--(pa shifted (0.5u,-2u));
  label.llft(btex $\phi=0$ etex, (pa shifted (-4u,0u)));

  %
  % Potential at infinity is zero.
  %
  label.llft(btex \vbox{\hbox{$\phi({\bf x})\to0$,}\hbox{$|{\bf x}|\to\infty$}} etex,(30u,30u));
  p := (0u,0u)--(36u,36u);
  drawarrow (point .84 of p rotated -10)
    --(point 1.0 of p rotated -10) dashed evenly;
  drawarrow (point .84 of p rotated 0)
    --(point 1.0 of p rotated 0) dashed evenly;
  drawarrow (point .78 of (p rotated 10))
    --(point 0.94 of (p rotated 10)) dashed evenly;
  drawarrow (point .72 of (p rotated 20))
    --(point 0.88 of (p rotated 20)) dashed evenly;

  %
  % Mission statement.
  %
  label.urt(btex S{\"o}kt: $\phi({\bf x})$, f{\"o}r $z\ge0$ etex,(24u,10u))

endfig;
end
