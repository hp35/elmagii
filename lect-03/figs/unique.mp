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

  p:= (0u,0u){dir 0}..{dir 90}(35u,6u)..{dir 180}(10u,10u)
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
  label(btex S{\"o}kt: $\phi({\bf x})$, ${\bf x}\in V$ etex, (-14u,8u));

endfig;
end
