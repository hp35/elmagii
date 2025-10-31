%
% MetaPost drawing of the force acting upon the charge transport (current)
% in a fixed trajectory, illustrating the Ampere force law on current loops.
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
  % Draw the trajectory of the current.
  %
  pa:=(-10u,-14u);
  pb:=(10u,24u);
  p:=pa{dir 100}..{dir 120}pb;
  dotlabel.bot(btex ${\bf x}_a$ etex, pa);
  dotlabel.top(btex ${\bf x}_b$ etex, pb);
  draw p;

  %
  % Draw the line segment dl.
  %
  pa:=point 0.7 of p;
  phi:=55;
  pb:=pa+(16u*(cosd(phi),sind(phi)));
  drawarrow pa--pb;
  label.urt(btex ${\bf I}({\bf x})=\lambda{\bf v}({\bf x})$ etex, pb);
  pickup pencircle scaled 3pt;
  pb:=pa+(2u*(cosd(phi),sind(phi)));
  draw pa--pb;
  pickup pencircle scaled 1pt;
  label.rt(btex $d{\bf l}$ etex, pa);

  %
  % Draw the force dF acting on the line segment.
  %
  phi:=110;
  pb:=pa+(22u*(cosd(phi),sind(phi)));
  drawarrow pa--pb;
  label.top(btex $d{\bf F}_{\rm mag}={\bf v}\times{\bf B}dq$ etex, pb);

  %
  % Some convenient labels.
  %
  label.lrt(btex \vbox{
      \hbox{$\Gamma$}
      \hbox{(str{\"o}mslinga)}} etex, (-8u,-5u));
  label.lft(btex $\displaystyle dq=\lambda dl\quad\Leftrightarrow\quad
      \lambda={{dq}\over{dl}}
      $ etex, (-26u,-6u));
  draw (-26u,-6u){dir 0}..{dir -10}(-12u,-10u);
endfig;
end
