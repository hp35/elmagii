%
% MetaPost drawing of Step 1 (point charge, closed surface with spherical
% symmetry) in the derivation of Gauss' law from the basic point-charge form
% of Coulomb's law.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;
r := 20u;
rc := 2u;
xo := 5u;
yo := -50u;
psi := -36;  % degrees
rx := r*cosd(psi);
ry := r*sind(psi);

%
% The electric monopole (point charge) including field lines.
%
picture elmonopole;
elmonopole := image(
  pickup pencircle scaled 1pt;
  fill fullcircle scaled (2rc) withcolor .75[black,white];
  draw fullcircle scaled (2rc) withcolor black;
  n := 7;
  for k = 0 upto n:
    phi := ((k)/(n))*360.0;
    drawarrow (0u,0u)--(1.35r*(cosd(phi),sind(phi)));
  endfor
);

beginfig(1);
  path p;
  pickup pencircle scaled 1pt;
  p := fullcircle scaled 2r shifted (0u,0u);
  fill p withcolor .975[black,white];
  draw p withcolor black;
  draw elmonopole shifted (0u,0u);
  label.top(btex $q'$ (``k{\"a}lla'') etex,(8.6u,2u));
  drawarrow (0u,0u)--(rx,ry);
  label.top(btex ${\bf x}-{\bf x}'$ etex, (0u,0u))
    rotated psi shifted (rx/2,ry/2);
  label.rt(btex ${\bf E}({\bf x})$ (observationspunkt p{\aa} $S$) etex,
      (rx+1u,ry));

  %
  % Draw coordinate system.
  %
  drawarrow (xo+2u,yo+1u)--(xo-4u,yo-2u);    % x-axis
  drawarrow (xo-2u,yo+1u)--(xo+4u,yo-2u);    % y-axis
  drawarrow (xo,yo-2u)--(xo,yo+5u);          % z-axis
  label.llft(btex $x$ etex,(xo-4u,yo-2u));
  label.lrt(btex $y$ etex,(xo+4u,yo-2u));
  label.lft(btex $z$ etex,(xo-0.5u,yo+5u));
  drawarrow (xo,yo)--(0u,0u);
  label.lft(btex ${\bf x}'$ etex, .4[(xo,yo),(0u,0u)]);
  drawarrow (xo,yo)--(rx,ry);
  label.rt(btex ${\bf x}$ etex, .4[(xo,yo),(rx,ry)]);

  %
  % Some explanatory labels.
  %
  label.llft(btex Labsystem etex,(xo-5u,yo+5u));
  label.ulft(btex \vbox{\hbox{Yta $S$}\hbox{(Sf{\"a}r)}} etex,
      (r*cosd(120),r*sind(120)));
  label.top(btex Elektriskt f{\"a}lt etex,(18u,22u));

  %
  % Normal vector to the enclosing surface.
  %
  pair v, vc;
  phi := 25;
  v := r*(cosd(phi),sind(phi));
  vc := (v shifted (6u*(cosd(phi),sind(phi))));
  drawarrow v--vc;
  label.rt(btex ${\bf n}$ etex,vc);

endfig;
end
