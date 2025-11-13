%
% MetaPost drawing of the setup of a closed, rectangular current-carrying
% loop dragged over a homogeneous field in such a way that the magnetic
% flux through the loop is linearly decreasing with time. This is the
% simplest illustration of the Faraday induction law, based directly on
% the Lorentz force acting upon the charges in the conducting wire, and
% serves as an illustration of the general case.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

%
% Employing the TeX-arrow package by Tommy Ekola.
%
input ../macros/cmarrows/cmarrows.mp
setup_cmarrows(
  arrow_name = "texarrow";
  parameter_file = "cmr12.mf";
  macro_name = "texarrow");
setup_cmarrows(
  arrow_name = "twoheadarrow";
  parameter_file = "cmr9.mf";
  macro_name = "arrowb");
setup_cmarrows(
  arrow_name = "doublearrow";
  parameter_file = "cmr8.mf";
  macro_name = "arrowc");

vardef drawinarrow(expr pos) =
  begingroup
    path p;
    pair pa, pb;
    pickup pencircle scaled 1pt;
    r:=1.5u;
    p := fullcircle scaled (2*r) shifted pos;
    fill p withcolor white;
    draw p withcolor black;
    s:=sqrt(2)/2;
    pa := (s*r,s*r);
    pb := -pa;
    draw (pa--pb) shifted pos;
    pa := (-s*r,s*r);
    pb := -pa;
    draw (pa--pb) shifted pos;
  endgroup
enddef;

vardef circletter(expr text, pos) =
  begingroup
    path p;
    pickup pencircle scaled 1pt;
    r:=2.4u;
    p := fullcircle scaled (2*r) shifted pos;
    fill p withcolor white;
    draw p withcolor black;
    label(text, pos)
  endgroup
enddef;

beginfig(1);
  path p, ps;
  pair ro, rb, pa, pb;
  color gray;
  gray := .950[black,white];
  pickup pencircle scaled 1pt;

  %
  % Draw the domain of constant magnetic field B_0.
  %
  wd:=100u;
  hd:=50u;
  ps := (-wd/2,-hd/2)--(wd/2,-hd/2)--(wd/2,hd/2)--(-wd/2,hd/2)--cycle;
  fill ps withcolor gray;
  draw ps withcolor black;

  %
  % Define the closed path Gamma along which the EMF is generated.
  %
  w:=50u;
  h:=50u;
  dz:=15u;
  p := ((-w/2,-h/2)--(w/2,-h/2)--(w/2,h/2)--(-w/2,h/2)--cycle) shifted (0u,dz);
  pickup pencircle scaled 2pt;
  draw p withcolor black;
  pickup pencircle scaled 1pt;
  texarrow (point .5 of p)--(point .4 of p);
  label.ulft(btex $I$ etex,(point .4 of p) shifted (0u,1u));
  texarrow (point 1.5 of p)--(point 1.4 of p);
  label.llft(btex $I$ etex,(point 1.4 of p) shifted (-1u,0u));
  texarrow (point 2.5 of p)--(point 2.4 of p);
  label.lrt(btex $I$ etex,(point 2.4 of p) shifted (0u,-1u));
  texarrow (point 3.7 of p)--(point 3.6 of p);
  label.urt(btex $I$ etex,(point 3.6 of p) shifted (1u,0u));

  drawarrow (0u,h/2+dz)--(0u,h/2+dz+30u);
  label.rt(btex ${\bf v}_0=v_0{\bf e}_z=\hbox{konst.}$ etex,
      (0u,h/2+dz+30u));

  %
  % Draw the coordinate system.
  %
  ro:=(-60u,-35u);
  drawarrow ((0u,0u)--(10u,0u)) shifted ro;
  label.lrt(btex $x$ etex,(10u,0u) shifted ro);
  drawarrow ((0u,0u)--(0u,10u)) shifted ro;
  label.lrt(btex $z$ etex,(0u,10u) shifted ro);
  drawinarrow(ro);
  label.lft(btex $y$ etex,(-r,0u) shifted ro);

  %
  % Draw the magnetic field, directed inward of the screen.
  %
  rb:=(-40u,16u);
  drawinarrow(rb);
  label.ulft(btex ${\bf B}_0$ etex,rb shifted (-1u,1u));

  %
  % Draw the segments of the closed path Gamma along which we integrate
  % the EMF.
  %
  rb:=(0u,-h/2-5u+dz);
  drawarrow (rb shifted (-5u,0u))--(rb shifted (6u,0u));
  circletter(btex $1$ etex, rb);

  rb:=(w/2+5u,dz);
  drawarrow (rb shifted (0u,-5u))--(rb shifted (0u,6u));
  circletter(btex $2$ etex, rb);

  rb:=(0u,h/2+5u+dz);
  drawarrow ((rb shifted (5u,0u))--(rb shifted (-6u,0u))) shifted (-10u,0u);
  circletter(btex $3$ etex, rb shifted (-10u,0u));

  rb:=(-w/2-5u,dz);
  drawarrow (rb shifted (0u,5u))--(rb shifted (0u,-6u));
  circletter(btex $4$ etex, rb);

  %
  % Label the magnetic flux Phi_M.
  %
  label.rt(btex $\def\iint{\mathop{\int\kern-8pt\int}}\displaystyle
      \Phi_{\rm M}=\iint_S{\bf B}\cdot d{\bf A}
      = B_0 (h-v_0 t) L$ etex,(24u,54u));
  draw (24u,56u){dir 200}..{dir 200}(0u,20u);
  dotlabel(btex etex,(0u,20u));
  label.rt(btex \vbox{
      \hbox{Homogent magnetf{\"a}lt}
      \hbox{${\bf B}_0=B_0{\bf e}_y$}} etex, (30u,-40u));
  draw (30u,-40u){dir 170}..{dir 170}(10u,-20u);
  dotlabel(btex etex,(10u,-20u));

  %
  % Label the generated EMF.
  %
  label.lft(btex $\displaystyle
      {\cal E}=\int_{\Gamma}\bigg({{{\bf F}}\over{q}}\bigg)\cdot d{\bf l}$ etex,
      (-40u,40u));
  draw (-40u,40u){dir -10}..{dir -10}(-w/2,h/2+4u);

  %
  % Labels of height and width of the trajectory Gamma.
  %
  draw (w/2+2u,h/2+dz)--(w/2+2u+42u,h/2+dz);
  draw (w/2+2u,-h/2+dz)--(w/2+2u+42u,-h/2+dz);
  drawarrow (w/2+2u+40u,h/2+dz)--(w/2+2u+40u,-h/2+dz);
  drawarrow reverse ((w/2+2u+40u,h/2+dz)--(w/2+2u+40u,-h/2+dz));
  label.top(btex $h$ etex,(0u,0u)) rotated 90 shifted (w/2+2u+40u,dz);

  draw (-w/2,-h/2+dz-2u)--(-w/2,-h/2-16u-2u);
  draw (w/2,-h/2+dz-2u)--(w/2,-h/2-16u-2u);
  drawarrow (-w/2,-h/2-16u)--(w/2,-h/2-16u);
  drawarrow reverse ((-w/2,-h/2-16u)--(w/2,-h/2-16u));
  label.top(btex $L$ etex,(0u,0u)) rotated 0 shifted (0u,-h/2-16u);

  %
  % The part covered by the magnetic field flux.
  %
  drawarrow (w/2+2u+16u,hd/2)--(w/2+2u+16u,-h/2+dz);
  drawarrow reverse ((w/2+2u+16u,hd/2)--(w/2+2u+16u,-h/2+dz));
  label.top(btex $h-v_0 t$ etex,(0u,0u)) rotated 90
    shifted (w/2+2u+16u,.5[hd/2,-h/2+dz]);

  %
  % Explicit indication of the direction of integration, determining also
  % the direction of area elements in the surface integral for the magnetic
  % flux.
  %
  rb := (-w/2,h/2+dz) shifted (-3u,3u);
  p := (rb shifted (10u,0u))--(rb shifted (3u,0u)){dir 180}
          ..{dir 270}(rb shifted (0u,-3u))--(rb shifted (0u,-8u));
  texarrow p;
  label.top(btex \vbox{\hbox{Integrations-}
      \hbox{v{\"a}g f{\"o}r $\Gamma$}} etex, rb shifted (-10u,20u));
  draw (rb shifted (-10u,20u)){dir -55}..{dir -55}(rb shifted (-1u,1u));

  
endfig;
end
