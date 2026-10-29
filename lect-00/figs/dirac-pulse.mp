%
% MetaPost drawing of the Dirac delta function as such.
%
% Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  epsilon:=2u;
  xp:=40u;
  xmax:=90u;
  ymax:=46u;
  invepsilon:=40u;
  dx:=4u;
  pickup pencircle scaled 1pt;
  drawarrow (-dx,0u)--(xmax,0u); label.urt(btex $x$ etex,(xmax,0u));
  drawarrow (0u,-dx)--(0u,ymax); label.urt(btex $y$ etex,(0u,ymax));
  fill ((xp-epsilon/2,0u)--(xp-epsilon/2,invepsilon)
      --(xp+epsilon/2,invepsilon)--(xp+epsilon/2,0u)
      --cycle) withcolor .9[black,white];
  draw (xp-epsilon/2,0u)--(xp-epsilon/2,invepsilon)
    --(xp+epsilon/2,invepsilon)--(xp+epsilon/2,0u);
  draw (xp-epsilon/2,-dx)--(xp-epsilon/2,-dx-12u);
  draw (xp+epsilon/2,-dx)--(xp+epsilon/2,-dx-12u);
  draw (xp-epsilon/2,-dx-10u)--(xp+epsilon/2,-dx-10u);
  drawarrow (xp-4u-epsilon/2,-dx-10u)--(xp-epsilon/2,-dx-10u);
  drawarrow (xp+epsilon/2+14u,-dx-10u)--(xp+epsilon/2,-dx-10u);
  label.top(btex $\epsilon$ etex,(xp+epsilon+7u,-dx-10u));
  label.lft(btex $0$ etex,(-dx,0u));
  draw (-2u,invepsilon)--(2u,invepsilon);
  draw ((4u,invepsilon)--(xp-epsilon/2-2u,invepsilon)) dashed evenly;
  label.lft(btex $1/\epsilon$ etex,(-dx,invepsilon));
  draw (xp,-2u)--(xp,2u);
  drawarrow (xp+26u,14u){dir 190}..{dir 200}(xp+2u,2u);
  label.rt(btex $x=x'$ (``k{\"a}llpunkt'') etex,(xp+26u,14u));
  drawarrow (xp+20u,29u){dir 180}..{dir 190}(xp,invepsilon/2);
  label.rt(btex Area $A=\epsilon\cdot(1/\epsilon)=1$ etex,(xp+20u,29u));
  drawarrow (xp+14u,44u){dir 180}..{dir 190}(xp+epsilon/2,invepsilon);
  label.rt(btex Delta-funktionen $y(x)=\delta(x-x')$ etex,(xp+14u,44u));
endfig;
end
