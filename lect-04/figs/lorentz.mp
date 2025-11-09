%
% MetaPost drawing of a point charge moving with velocity v in a magnetic
% field B, illustrating the resulting Lorentz force F acting of the charge.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, pv;
  pair pa, pb;
  pickup pencircle scaled 1pt;

  p:=(-30u,10u)..(0u,-4u)..(40u,-10u);
  drawarrow p scaled 0.8 shifted (0u,20u);
  drawarrow p scaled 0.9 shifted (0u,15u);
  drawarrow p scaled 1.0 shifted (0u,10u);
  drawarrow p scaled 1.1 shifted (0u,5u);
  drawarrow p scaled 1.2 shifted (0u,0u);
  label.lft(btex ${\bf B}({\bf x})$ etex,(-30u,22u));

  %
  % Draw the charge and the Lorentz force.
  %

  pa:=(0u,9u);
  fill fullcircle scaled 3u shifted pa withcolor .95[black,white];
  draw fullcircle scaled 3u shifted pa withcolor black;
  label.lft(btex $q$ etex, (-2u,1.5u) shifted pa);
  pickup pencircle scaled 3pt;
  pickup pencircle scaled 1pt;

  phi:=90;
  pb:=pa+14u*(cosd(phi),sind(phi));
  drawarrow pa--pb;
  label.urt(btex ${\bf F}=q({\bf v}\times{\bf B})
      \quad\Rightarrow\quad{\bf F}\perp{\bf v},\ {\bf F}\perp{\bf B}$ etex, pb);

  phi:=-16;
  pb:=pa+14u*(cosd(phi),sind(phi));
  drawarrow pa--pb;
  label.rt(btex ${\bf B}$ etex, pb);

  phi:=-126;
  pb:=pa+18u*(cosd(phi),sind(phi));
  drawarrow pa--pb;
  label.llft(btex ${\bf v}$ etex, pb);

endfig;
end
