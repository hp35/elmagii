%
% MetaPost drawing of the right-hand system formed by (E,B,k).
%
% Copyright (C) 2023, Fredrik Jonsson
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;
  drawarrow (0u,0u)--(30u,-5u); label.urt(btex ${\bf k}$ etex,(30u,-10u));
  drawarrow (0u,0u)--(0u,20u); label.urt(btex ${\bf E}_k$ etex,(0u,20u));
  drawarrow (0u,0u)--(-12u,-8u); label.ulft(btex ${\bf B}_k$ etex,(-12u,-8u));
  pickup pencircle scaled .5pt;
  draw (0u,5u)--(5u,5u-5u*(5.0/30.0))--(5u,0u-5u*(5.0/30.0));
  draw (0u,5u)--(-3u,5u-3u*(8.0/12.0))--(-3u,-3u*(8.0/12.0));
  draw (-3u,-3u*(8.0/12.0))--(-3u+5u,-3u*(8.0/12.0)-5u*(5.0/30.0))
    --(5u,0u-5u*(5.0/30.0));
endfig;
end
