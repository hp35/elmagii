%
% MetaPost drawing of the Dirac delta function for surface charges.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
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
  p:=(-4u,10u)
       --((-4u,10u)+22u*ey)
       --((-4u,10u)+22u*ey+15u*ex)
       --((-4u,10u)+15u*ex)
       --(-4u,10u)--cycle;
  fill p withcolor .95[black,white];
  draw p;
  xp:=.7[(point 0.0 of p),(point 1.5 of p)];
  drawarrow origo--xp;
  label.lrt(btex ${\bf x}'=(x',y',z')$ etex,.5[origo,xp]);
  label.top(btex $\sigma\delta(z-z')$ etex,(0u,0u))
      rotated -10 shifted (point .5 of p);
  label.bot(btex Ytladdning $\sigma$ $({\rm C}/{\rm m}^2)$ etex,
      ((llx+urx),ury));
endfig;
end
