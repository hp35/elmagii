%
% MetaPost drawing of coulomb action for a system of point charges.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;
r := 64u;
rc := 2u;
xo := 20u;
yo := -30u;

beginfig(1);
  pickup pencircle scaled 1pt;

  pair p;

  p:=(2u,0u);
  fill fullcircle scaled 2rc shifted p withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted p withcolor black;
  label.top(btex $q'_1$ etex,p+(0u,rc));

  p:=(-5u,10u);
  fill fullcircle scaled 2rc shifted p withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted p withcolor black;
  label.top(btex $q'_2$ etex,p+(0u,rc));

  p:=(-8u,-4u);
  fill fullcircle scaled 2rc shifted p withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted p withcolor black;
  label.top(btex $q'_7$ etex,p+(0u,rc));

  p:=(25u,-5u);
  fill fullcircle scaled 2rc shifted p withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted p withcolor black;
  label.top(btex $q'_4$ etex,p+(0u,rc));

  p:=(7u,-15u);
  fill fullcircle scaled 2rc shifted p withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted p withcolor black;
  label.top(btex $q'_5$ etex,p+(0u,rc));

  p:=(22u,16u);
  fill fullcircle scaled 2rc shifted p withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted p withcolor black;
  label.top(btex $q'_6$ etex,p+(0u,rc));

  p:=(10u,10u);
  fill fullcircle scaled 2rc shifted p withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted p withcolor black;
  label.top(btex $q'_3$ etex,p+(0u,rc));

  fill fullcircle scaled 2rc shifted (r,0u) withcolor .75[black,white];
  draw fullcircle scaled 2rc shifted (r,0u) withcolor black;
  label.top(btex $q$ etex,(r,rc));

  drawarrow p--(.35[p,(r,0u)]);
  drawarrow (r,0u)--(.35[(r,0u),p]);
  label.top(btex ${\bf F}'_k$ etex,(0.35[p,(r,0u)]));
  label.top(btex ${\bf F}_k$ etex,(0.35[(r,0u),p]));

  %
  % Draw coordinate system.
  %
  drawarrow (xo+2u,yo+1u)--(xo-4u,yo-2u);    % x-axis
  drawarrow (xo-2u,yo+1u)--(xo+4u,yo-2u);    % y-axis
  drawarrow (xo,yo-2u)--(xo,yo+5u);          % z-axis
  label.llft(btex $x$ etex,(xo-4u,yo-2u));
  label.lrt(btex $y$ etex,(xo+4u,yo-2u));
  label.urt(btex $z$ etex,(xo,yo+5u));
  drawarrow (xo,yo)--p;
  label.urt(btex ${\bf x}'_k$ etex, .5[(xo,yo),p]);
  drawarrow (xo,yo)--(r,0u);
  label.ulft(btex ${\bf x}$ etex, .5[(xo,yo),(r,0u)]);
  label.lrt(btex \vbox{\hbox{Observationspunkt}
      \hbox{``Testladdning''}} etex, (r,0u) shifted (0u,-rc));

endfig;
end
