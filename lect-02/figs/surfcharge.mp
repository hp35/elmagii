%
% MetaPost drawing of a surface charge enclosed by a "gaussian surface" with
% the purpose of extracting the electric field.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;

  p:= (0u,-5u)--(60u,10u)--(10u,22u)--(-40u,15u)--(0u,-5u)--cycle;
  fill p withcolor .900[black,white];
  draw p;

  p := fullcircle xscaled 30u yscaled 5u;
  fill unitsquare xscaled 30u yscaled 12u shifted (10u-15u,4u)
    withcolor .925[black,white];
  fill unitsquare xscaled 30u yscaled 6u shifted (10u-15u,4u)
    withcolor .850[black,white];
  fill p shifted (10u,4u) withcolor .850[black,white];
  fill p shifted (10u,10u) withcolor .925[black,white];
  fill p shifted (10u,16u) withcolor .975[black,white];
  draw (-5u,10u)--(-5u,16u) withcolor black;
  draw (25u,10u)--(25u,16u) withcolor black;
  draw (-5u,4u)--(-5u,10u) withcolor .7[black,white];
  draw (25u,4u)--(25u,10u) withcolor .7[black,white];
  draw p shifted (10u,4u) withcolor .7[black,white];
  draw p shifted (10u,10u);
  draw p shifted (10u,16u);

  label.top(btex
      \vbox{
        \hbox{``Gaussisk burk''}
        \hbox{\hskip10pt Lockarea $A$}
      }
      etex, (-15u,30u));
  draw (-15u,30u){dir -70}..{dir -70}(0u,17u);

  drawarrow (10u,-6u)--(10u,30u);
  label.rt(btex $z$ etex,(10u,30u));
  draw ((-1u,0u)--(1u,0u)) shifted (10u,4u);
  draw ((-1u,0u)--(1u,0u)) shifted (10u,10u);
  draw ((-1u,0u)--(1u,0u)) shifted (10u,16u);
  label.rt(btex $-a$ etex, (11u,4u));
  label.rt(btex $0$ etex, (11u,10u));
  label.rt(btex $a$ etex, (11u,16u));

  label.top(btex S{\"o}kt: ${\bf E}={\bf e}_z E_z(z)$ etex,(50u,23u));
  draw (35u,23u){dir -130}..{dir -130}(18u,17u);

  label.top(btex Ytladdning $\sigma$ (${\rm C}/{\rm m}^2$) etex, (-40u,22u));
  draw (-40u,22u){dir -80}..{dir -80}(-30u,14u);

endfig;
end
