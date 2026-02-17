%
% MetaPost drawing of coulomb attraction or repulsion between two point
% charges.
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
  fill fullcircle scaled (2rc) shifted (0u,0u) withcolor .75[black,white];
  draw fullcircle scaled (2rc) shifted (0u,0u) withcolor black;
  fill fullcircle scaled 4u shifted (r,0u) withcolor .75[black,white];
  draw fullcircle scaled 4u shifted (r,0u) withcolor black;
  label.top(btex $q'$ etex,(0u,rc));
  label.top(btex $q$ etex,(r,rc));

  drawarrow (0u,0u)--(r/4,0u);
  drawarrow (r,0u)--(3*r/4,0u);
  label.top(btex ${\bf F}'$ etex,(r/8,0u));
  label.top(btex ${\bf F}$ etex,(7*r/8,0u));

  %
  % Draw coordinate system.
  %
  drawarrow (xo+2u,yo+1u)--(xo-4u,yo-2u);    % x-axis
  drawarrow (xo-2u,yo+1u)--(xo+4u,yo-2u);    % y-axis
  drawarrow (xo,yo-2u)--(xo,yo+5u);          % z-axis
  label.llft(btex $x$ etex,(xo-4u,yo-2u));
  label.lrt(btex $y$ etex,(xo+4u,yo-2u));
  label.urt(btex $z$ etex,(xo,yo+5u));
  drawarrow (xo,yo)--(0u,0u);
  label.urt(btex ${\bf x}'$ etex, .5[(xo,yo),(0u,0u)]);
  drawarrow (xo,yo)--(r,0u);
  label.ulft(btex ${\bf x}$ etex, .5[(xo,yo),(r,0u)]);
  label.llft(btex Labsystem etex,(xo-5u,yo-5u));

  %
  % Some explanatory labels.
  %
  dy:=20u;
  label.top(btex
      \vbox{
        \hbox{Kraft p{\aa} laddning $q'$ i k{\"a}llpunkten ${\bf x}'$ fr{\aa}n}
        \hbox{laddningen $q$ i observationspunkten ${\bf x}$}}
      etex,(0u,dy));
  draw (0u,dy){dir 270}..{dir 270}(r/8,6u);
  label.top(btex
      \vbox{
        \hbox{Kraft p{\aa} laddning $q$ i observationspunkten ${\bf x}$}
        \hbox{fr{\aa}n laddningen $q'$ i k{\"a}llpunkten ${\bf x}'$}}
      etex,(r+16u,dy));
  draw (r+16u,dy){dir 250}..{dir 250}(7r/8,6u);
  label.llft(btex K{\"a}llpunkt etex, (0u,0u) shifted (0u,-rc));
  label.lrt(btex \vbox{\hbox{Observationspunkt}
      \hbox{``Testladdning''}} etex, (r,0u) shifted (0u,-rc));

endfig;
end
