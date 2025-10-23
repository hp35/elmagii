%
% MetaPost drawing of Step 4 (continuous charge distribution, enclosed
% by a closed surface of arbitrary shape) in the derivation of Gauss'
% law from the basic point-charge form of Coulomb's law.
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
% The electric monopole (point charge) element dq = rho*dV including field
% lines.
%
picture dv;
dv := image(
  pickup pencircle scaled 1pt;
  draw (-3u,-3u)--(1u,-3u)--(1u,1u)--(-3u,1u)--(-3u,-3u);
  draw (-3u,1u)--(-1u,3u)--(3u,3u)--(1u,1u);
  draw (3u,3u)--(3u,-1u)--(1u,-3u);
  draw (-3u,-3u)--(-1u,-1u)--(-1u,3u);
  draw (-1u,-1u)--(3u,-1u);
  n := 7;
  for k = 0 upto n:
    phi := ((k)/(n))*360.0;
    drawarrow (0u,0u)--(7u*(cosd(phi),sind(phi)));
  endfor
);

beginfig(1);
  path p;
  pair v, vc;
  pickup pencircle scaled 1pt;
  p := (r,0u){dir 90}..(2.3r,r)..(0.5r,r)..(0u,.7r)..(-r,2r)
    ..{dir 270}(-0.5r,0u)..{dir 140}(-1.7r,1.1r)
    ..{dir-30}(-1.2r,-.3r)..(0u,-r)..{dir 60}(r*cosd(psi),r*sind(psi))
    ..{dir 90}(r,0u)--cycle;
  fill p withcolor .975[black,white];
  draw p;
  draw dv shifted (0u,0u);
  label.rt(btex $dq'=\rho({\bf x}')dV'$ etex,(12u,16u));
  draw (12u,16u){dir 190}..{dir 190}(4u,2u);
  drawarrow (0u,0u)--(rx,ry);
  label.top(btex ${\bf x}-{\bf x}'$ etex, (0u,0u))
    rotated psi shifted (rx/2,ry/2);
  label.lrt(btex \vbox{
      \hbox{$d{\bf E}({\bf x})$ (bidrag vid observationspunkt ${\bf x}$}
      \hbox{p{\aa} slutna ytan $A$ fr{\aa}n infinitesimal}
      \hbox{laddning $dq'$ vid k{\"a}llposition ${\bf x}'$)}} etex, (rx+2u,ry));

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
  label.ulft(btex $\rho({\bf x})$ etex,(-12u,20u));
  label.ulft(btex Volym $V$ etex,(-11u,27u));

  %
  % Normal vector to the enclosing surface.
  %
  v := point 1.2 of p;
  vc := (v shifted (6u*(cosd(35),sind(35))));
  drawarrow v--vc;
  label.rt(btex ${\bf n}$ etex,vc);

endfig;
end
