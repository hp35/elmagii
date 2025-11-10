%
% MetaPost drawing of the volume and surface geometry used in the proof
% of uniqueness for the electrostatic potential as solution to Laplace's
% equation.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  color gray;
  gray := .975[black,white];
  pickup pencircle scaled 1pt;

  p:= (0u,0u){dir 0}..{dir 90}(50u,6u)..{dir 180}(20u,20u)
    ..{dir 180}(-12u,36u)..(-35u,6u)..{dir 0}(0u,0u)--cycle;
  fill p withcolor gray;
  draw p;
  label(btex Volym $V$ etex, (-16u,29u));
  label(btex $\nabla^2\phi({\bf x})=0$ etex,(-16u,22u));
  label.lft(btex
      \vbox{
      \hbox{Randyta $S$ med}
      \hbox{skal{\"a}r potential}
      \hbox{$\phi$ f{\"o}reskriven}}
      etex, (-38u,36u));
  draw (-38u,36u){dir -20}..{dir -20}(point 3.4 of p shifted (-1u,0u));
  label(btex Typiskt s{\"o}kt: $\phi({\bf x})$, ${\bf x}\in V$ etex, (-14u,12u));
  label(btex {\it Men $\ldots$ {\"a}r $\phi({\bf x})$ unik?} etex, (-14u,6u));

  p:=((0u,0u){dir -30}..(18u,-4u)..(12u,2u)..(-3u,12u)..{dir -30}(0u,0u)--cycle)
    rotated 10 shifted (20u,10);
  fill p withcolor white;
  draw p;
  label.top(btex
      \vbox{
      \hbox{Eventuell inre randyta $S'$ med}
      \hbox{skal{\"a}r potential $\phi'$ f{\"o}reskriven}}
      etex, (32u,30u));
  draw (32u,30u){dir 260}..{dir 260}(point 2.2 of p shifted (0u,.8u));

endfig;
end
