%
% MetaPost drawing of the setup of a closed current-carrying loop and the
% electro-motoric force (EMF) driving a current through this whenever the
% magnetic flow enclosed by the loop is altered, either by means of a
% magnetic field which is changing in time or by means of a change in the
% orientation or position of the loop itself. This is the basic setup in
% which we derive Faraday's law of induction.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path pgamma, pgammap, p, ps;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;

  %
  % Define the closed path Gamma along which the EMF is generated.
  %
  pgamma := ((0u,0u){dir 0}..(35u,15u)..(35u,30u)..(5u,20u)..(-10u,35u)
      ..(-35u,15u)..{dir 0}(0u,0u)--cycle) shifted (15u,-25u);
  fill pgamma withcolor .975[black,white];

  %
  % First fieldline, counting from left.
  %
  w:=10u; h:=50u; x:=-10u;
  gpa:=0.32; gpb:=0.80; % Start and stop points along path for grey segment
  p := (x-w,-h/2)..{dir 90}(x,0u){dir 90}..(x-w,h/2);
  draw (subpath (0,gpa) of p) withcolor black;
  draw (subpath (gpa,gpb) of p) withcolor gray;
  drawarrow (subpath (gpb,2) of p) withcolor black;
  
  %
  % Second fieldline, counting from left.
  %
  w:=7u; h:=60u; x:=0u;
  gpa:=0.24; gpb:=0.76; % Start and stop points along path for grey segment
  p := (x-w,-h/2)..{dir 90}(x,0u){dir 90}..(x-w,h/2);
  draw (subpath (0,gpa) of p) withcolor black;
  draw (subpath (gpa,gpb) of p) withcolor gray;
  drawarrow (subpath (gpb,2) of p) withcolor black;
  
  %
  % Third fieldline, counting from left.
  %
  w:=4u; h:=65u; x:=10u;
  gpa:=0.24; gpb:=0.72; % Start and stop points along path for grey segment
  p := (x-w,-h/2)..{dir 90}(x,0u){dir 90}..(x-w,h/2);
  draw (subpath (0,gpa) of p) withcolor black;
  draw (subpath (gpa,gpb) of p) withcolor gray;
  drawarrow (subpath (gpb,2) of p) withcolor black;
  
  %
  % Fourth fieldline, counting from left.
  %
  w:=-2u; h:=70u; x:=20u;
  gpa:=0.30; gpb:=0.72; % Start and stop points along path for grey segment
  p := (x-w,-h/2)..{dir 90}(x,0u){dir 90}..(x-w,h/2);
  draw (subpath (0,gpa) of p) withcolor black;
  draw (subpath (gpa,gpb) of p) withcolor gray;
  drawarrow (subpath (gpb,2) of p) withcolor black;
  
  %
  % Fifth fieldline, counting from left.
  %
  w:=-8u; h:=70u; x:=30u;
  gpa:=0.38; gpb:=0.80; % Start and stop points along path for grey segment
  p := (x-w,-h/2)..{dir 90}(x,0u){dir 90}..(x-w,h/2);
  draw (subpath (0,gpa) of p) withcolor black;
  draw (subpath (gpa,gpb) of p) withcolor gray;
  drawarrow (subpath (gpb,2) of p) withcolor black;
  
  %
  % Sixth fieldline, counting from left.
  %
  w:=-14u; h:=70u; x:=40u;
  gpa:=0.55; gpb:=0.90; % Start and stop points along path for grey segment
  p := (x-w,-h/2)..{dir 90}(x,0u){dir 90}..(x-w,h/2);
  draw (subpath (0,gpa) of p) withcolor black;
  draw (subpath (gpa,gpb) of p) withcolor gray;
  drawarrow (subpath (gpb,2) of p) withcolor black;

  %
  % Redraw the outline of the Gamma path, hiding the intersections of
  % the magnetic field lines.
  %
  draw pgamma;
  label.top(btex ${\bf B}({\bf x},t)$ etex,(14u,32u));

  %
  % Draw the shifted path Gamma at time t+dt.
  %
  pgammap := pgamma scaled 1.0 shifted (8u,8u);
  draw pgammap;
  sa:=0; ds:=0.25; sb:=1-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=1; ds:=0.5; sb:=2-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=2; ds:=0.25; sb:=3-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=3; ds:=0.5; sb:=4-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=4; ds:=0.25; sb:=5-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=5; ds:=0.25; sb:=6-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor

  label.bot(btex $\Gamma(t)$ etex,(point 6.1 of pgamma));
  label.top(btex $\Gamma(t+dt)$ etex,(point 6.1 of pgammap));
  label.lft(btex Yta $A$ etex,(-30u,10u));
  draw (-30u,10u){dir 0}..{dir 0}(-17u,-3u);
  

  %
  % Normal to the surface.
  %
%  drawarrow (-14u,-4u)--(-18u,4u);
%  draw (-14.5u,-3u)--(-13.5u,-2.5u)--(-13.0u,-3.5u);
%  label.ulft(btex ${\bf n}$ etex,(-18u,4u));

  %
  % Definition of the electric flow through the surface S.
  %
%  label.top(btex ${\bf B}({\bf x})$ etex, (-9u,22u));
%  label.lft(btex $S$ etex,(-18u,-4u));
%  label.rt(btex
%      \def\iint{\mathop{\int\kern-8pt\int}}
%	$\displaystyle{\bf\Phi}_{\rm M}=\iint_S{\bf B}({\bf x})\cdot d{\bf A}$
%	etex,(30u,14u));
%    draw (30u,14u){dir 190}..{dir 190}(8u,-1u);
endfig;
end
