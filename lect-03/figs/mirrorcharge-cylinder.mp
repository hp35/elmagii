%
% MetaPost drawing of a linecharge lambda placed along and outside of a
% cylindrical perfect conductor, constuting the "gedankenexperiment" of
% mirrored line charges and perfectly conducting cylindrical surfaces.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path pc, p, ps;
  pair po, pr, pa, pb, pd;
  color gray;
  gray := .875[black,white];
  pickup pencircle scaled 1pt;

  %
  % Draw the perfectly conducting sphere.
  %
  rr := 35u;
  pc := fullcircle scaled (2*rr) shifted (0u,0u);
  fill pc withcolor gray;
  draw pc;
  phi:=145;
  po:=(0u,0u);
  pr:=rr*(cosd(phi),sind(phi));
  drawarrow po--pr;
  label.top(btex ${\bf x}$ etex,(0u,0u)) rotated (phi+180) shifted .5[po,pr];
  label.bot(btex $|{\bf x}|=R$ etex,(0u,0u)) rotated (phi+180) shifted .5[po,pr];

  %
  % Draw the coordinate system.
  %
  drawarrow (-40u,0u)--(40u,0u);
  label.urt(btex $y$ etex,(40u,0u));
  drawarrow (0u,-45u)--(0u,75u);
  label.urt(btex $x$ etex,(0u,75u));
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
  label.lrt(btex $z$ etex,(1u,-1u));

  %
  % Draw the line charge placed at x=R+h and its vector to the
  % observation point.
  %
  h:=65u;
  pa := (0u,h);
  p:=fullcircle scaled 2u shifted pa;
  fill p withcolor black;
  label.urt(btex \vbox{\hbox{Linjeladdning}\hbox{$\lambda$ (C/m)}} etex,
      pa shifted (30u,10u));
  draw (pa shifted (30u,12u)){dir 190}..{dir 190}(pa shifted (2u,0u));
  label.lrt(btex $x=R+h$ etex, pa shifted (2u,0u));
  drawarrow pa--pr;
  alpha:=angle(pr-pa);
  label.top(btex ${\bf x}-(R+h){\bf e}_x$ etex,po)
    rotated (alpha+180) shifted .5[pa,pr];

  %
  % Draw also the mirrored (imaged) virtual line charge placed at x=d
  % and its vector to the observation point.
  %
  d:=25u;
  pd := (0u,d);
  p:=fullcircle scaled 2u shifted pd;
  fill p withcolor black;
  label.urt(btex \vbox{\hbox{Virtuell speglad}
      \hbox{linjeladdning}
      \hbox{$\lambda'$ (C/m)}} etex,
      pd shifted (30u,10u));
  draw (pd shifted (30u,12u)){dir 190}..{dir 190}(pd shifted (2u,0u));
  label.lrt(btex $x=d$ etex, pd shifted (2u,0u));
  drawarrow pd--pr;
  alpha:=angle(pr-pd);
  label.top(btex ${\bf x}-d{\bf e}_x$ etex,po)
    rotated (alpha+180) shifted .5[pd,pr];

  %
  % Mission statement.
  %
  label.lft(btex S{\"o}kt: $\phi({\bf x})$, f{\"o}r $|{\bf x}|\ge R$ etex,
      (-40u,70u));

  %
  % Boundary condition at the surface of the perfectly conducting cylinder.
  %
  label.lft(btex $\phi=0$ p{\aa} $|{\bf x}|=R$ etex,(-50u,-20u));
  draw (-50u,-20u){dir 20}..{dir 20}(point 4.3 of pc);

  %
  % Labeling the perfectly conducting cylinder.
  %
  label.rt(btex \vbox{
      \hbox{Perfekt ledande}
      \hbox{o{\"a}ndlig cylinder}
      \hbox{i vilken $\lambda$ speglas}}
      etex,(40u,-24u));
  draw (40u,-24u){dir 180}..{dir 180}(20u,-12u);
  dotlabel(btex etex,(20u,-12u));

endfig;
end
