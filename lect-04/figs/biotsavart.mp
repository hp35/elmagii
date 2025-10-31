%
% MetaPost drawing of the setup used in Biot--Savart's law, describing
% the generation of a magnetic field by a steady-state current.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, pv;
  pair pa, pb, pl;
  pickup pencircle scaled 1pt;

  pa:=(0u,0u);
  pb:=(-20u,10u);
  p:=pa{dir 0}..(20u,10u)..(-5u,15u)..{dir 180}(-10u,30u)..pb;
  draw p;
  drawarrow subpath (1.75,2.0) of p;
  label.urt(btex $I$ etex, point 2.0 of p);
  label.top(btex Str{\"o}mslinga $\Gamma$ etex, point 3.0 of p);
  dotlabel.bot(btex ${\bf x}_a$ etex, pa);
  dotlabel.bot(btex ${\bf x}_b$ etex, pb);

  %
  % Draw the line segment dl.
  %
  pa:=point 0.7 of p;
  phi:=55;
  pb:=pa+(16u*(cosd(phi),sind(phi)));
  drawarrow pa--pb;
  label.urt(btex $d{\bf l}'$ etex, pb);
  pickup pencircle scaled 3pt;
  pb:=pa+(2u*(cosd(phi),sind(phi)));
  draw pa--pb;
  pl:= point .5 of (pa--pb);
  pickup pencircle scaled 1pt;
  label.ulft(btex $dl'$ etex, pa);

  %
  % Draw the coordinate system.
  %
  pa:=(40u,-20u);
  pb:=(pa shifted (0u,10u));
  drawarrow pa--pb;
  label.urt(btex $z$ etex, pb);
  pb:=(pa shifted (-8u,-3u));
  drawarrow pa--pb;
  label.ulft(btex $x$ etex, pb);
  pb:=(pa shifted (9u,-1u));
  drawarrow pa--pb;
  label.urt(btex $y$ etex, pb);

  %
  % Vectors to source and observation points.
  %
  drawarrow pa--pl;
  label.urt(btex ${\bf x}'$ etex, point .5 of (pa--pl));
  
  pb:=(pa shifted (30u,50u));
  drawarrow pa--pb;
  label.lrt(btex ${\bf x}$ etex, point .5 of (pa--pb));
  
  drawarrow pl--pb;
  label.lrt(btex ${\bf x}-{\bf x}'$ etex, point .5 of (pl--pb));
  dotlabel.urt(btex \vbox{\hbox{Observationspunkt}
      \hbox{f{\"o}r magnetf{\"a}lt ${\bf B}({\bf x})$}} etex, pb);

endfig;
end
