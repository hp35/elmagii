%
% MetaPost drawing of the Dirac delta function for line charges.
%
% Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;
llx:=-20u; lly:=-20u; urx:=20u; ury:=20u;
pair origo,ex,ey,ez,xp;
origo:=(-13u,-15u);
ex:=dir -150;
ey:=dir -10;
ez:=dir 90;

beginfig(1);
  pickup pencircle scaled 1pt;
  path p;
  draw (llx,lly)--(urx,lly)--(urx,ury)--(llx,ury)--(llx,lly) withcolor white;
  drawarrow origo--(origo+4.5u*ex); label.llft(btex $x$ etex,(origo+4.5u*ex));
  drawarrow origo--(origo+5u*ey);   label.lrt(btex $y$ etex,(origo+5u*ey));
  drawarrow origo--(origo+5u*ez);   label.top(btex $z$ etex,(origo+5u*ez));
  p:=(-17u,10u)--((-14u,10u)+32u*ey);
  pickup pencircle scaled 2pt;
  draw p;
  pickup pencircle scaled 1pt;
  xp:=(point .3 of p);
  drawarrow origo--xp;
  label.lrt(btex ${\bf x}'=(x',y',z')$ etex,.5[origo,xp]);
  label.top(btex $\lambda\delta(x-x')\delta(z-z')$ etex,(0u,0u))
      rotated -10 shifted (point .5 of p);
  label.llft(btex L{\"a}ngs $y$-axeln etex,(0u,-0.5u))
      rotated -10 shifted (point 1.0 of p);
  label.bot(btex Linjeladdning $\lambda$ $({\rm C}/{\rm m})$ etex,
      ((llx+urx),ury));
endfig;
end
