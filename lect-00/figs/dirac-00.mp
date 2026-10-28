%
% MetaPost drawing of the Dirac delta function for point charges.
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
  draw (llx,lly)--(urx,lly)--(urx,ury)--(llx,ury)--(llx,lly) withcolor white;
  drawarrow origo--(origo+4.5u*ex); label.llft(btex $x$ etex,(origo+4.5u*ex));
  drawarrow origo--(origo+5u*ey);   label.lrt(btex $y$ etex,(origo+5u*ey));
  drawarrow origo--(origo+5u*ez);   label.top(btex $z$ etex,(origo+5u*ez));
  xp:=(0u,5u);
  drawarrow origo--xp;
  label.lrt(btex ${\bf x}'=(x',y',z')$ etex,.5[origo,xp]);
  fill fullcircle scaled 3pt shifted xp;
  label.urt(btex $q\delta({\bf x}-{\bf x}')$ etex,xp);
  label.bot(btex Punktladdning $q$ $({\rm C})$ etex,((llx+urx),ury));
endfig;
end
