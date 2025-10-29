%
% MetaPost drawing of the normal vector and electric field from an
% arbitrary surface S.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  pair pa, pb;
  pickup pencircle scaled 1pt;
  p:=(-20u,15u){dir 20}..(0u,-5u)..(20u,5u)..{dir -10}(40u,0u);
  draw p withcolor black;
  pa:=point 0.3 of p;
  pb:=pa+6u*(cosd(40),sind(40));
  drawarrow pa--pb;
  label.rt(btex ${\bf e}_n$ (normalvektor) etex, pb);
  pa:=point 1.5 of p;
  label.lrt(btex Yta $S$ etex,pa);
  pa:=(-20u,0u);
  draw pa{dir 10}..{dir 10}(point 0.5 of p shifted (-2u,0u));
  label.llft(btex Ytladdningst{\"a}thet $\sigma$ (${\rm C}/{\rm m}^2$) etex,pa);
  label.top(btex $\displaystyle\Rightarrow\ {\bf E}({\bf x})
      ={{\sigma({\bf x})}\over{\varepsilon_0}}{\bf e}_n,
      \quad\hbox{f{\"o}r}\ {\bf x}\ \hbox{n{\"a}ra}\ S$ etex, (50u,10u));

endfig;
end
