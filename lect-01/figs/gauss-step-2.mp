%
% MetaPost drawing of Step 2 (point charge, non-spherical closed surface
% of arbitrary shape) in the derivation of Gauss' law from the basic
% point-charge form of Coulomb's law.
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
  pickup pencircle scaled 1pt;
  path p;
  pair v, vc;
  p := (r,0u){dir 90}..(2.3r,r)..(0.5r,r)..(0u,.7r)..(-r,2r)
    ..{dir 270}(-0.5r,0u)..{dir 140}(-1.7r,1.1r)
    ..{dir-30}(-1.2r,-.3r)..(0u,-r)..{dir 60}(r*cosd(psi),r*sind(psi))
    ..{dir 90}(r,0u)--cycle;
  fill p withcolor .975[black,white];
  draw p;

  %
  % Three intersections (+1)+(-1)+(+1) = +1.
  %
  v := point 4.872 of p; dotlabel.urt(btex $+1$ etex,v);
  v := point 5.782 of p; dotlabel.urt(btex $-1$ etex,v);
  v := point 6.402 of p; dotlabel.llft(btex $+1$ etex,v);

  %
  % Three intersections (+1)+(-1)+(+1) = +1.
  %
  v := point 5.088 of p; dotlabel.lrt(btex $+1$ etex,v);
  v := point 5.352 of p; dotlabel.top(btex $-1$ etex,v);
  v := point 7.205 of p; dotlabel.bot(btex $+1$ etex,v);

  phi := (3/7)*360.0;
  draw (0u,0u)--(2.7r*(cosd(phi),sind(phi))) dashed evenly;
  draw elmonopole shifted (0u,0u);
  label.top(btex $q'$ (``k{\"a}lla'') etex,(8.6u,2u));
  drawarrow (0u,0u)--(rx,ry);
  label.top(btex ${\bf x}-{\bf x}'$ etex, (0u,0u))
    rotated psi shifted (rx/2,ry/2);
  label.rt(btex ${\bf E}({\bf x})$ (observationspunkt p{\aa} $A$) etex, (rx,ry));

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
  label.ulft(btex Sluten yta $A$ etex,(-26u,39u));
  label.urt(btex Elektriskt f{\"a}lt etex,(18u,20u));

  %
  % Normal vector to the enclosing surface.
  %
  v := point 1.2 of p;
  vc := (v shifted (6u*(cosd(35),sind(35))));
  drawarrow v--vc;
  label.rt(btex ${\bf n}$ etex,vc);

endfig;
end
