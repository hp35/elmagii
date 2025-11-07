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
  pair picshift, pa, pb, pc, pd;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;

  %
  % Define the closed path Gamma along which the EMF is generated.
  %
  pgamma := ((0u,0u){dir 0}..(35u,15u)..(35u,30u)..(5u,20u)..(-10u,35u)
      ..(-35u,15u)..{dir 0}(0u,0u)--cycle) shifted (15u,-25u);
  fill pgamma withcolor .925[black,white];

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
  pickup pencircle scaled 2pt;
  drawarrow pgamma;
  pickup pencircle scaled 1pt;
  label.top(btex ${\bf B}({\bf x},t)$ etex,(14u,32u));

  %
  % Draw the shifted path Gamma at time t+dt.
  %
  pgammap := pgamma scaled 1.0 shifted (8u,8u);
  pickup pencircle scaled 2pt;
  drawarrow pgammap;
  pickup pencircle scaled 1pt;
  sa:=0.1; ds:=0.25; sb:=1.1-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=1.1; ds:=0.5; sb:=2.1-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=2.1; ds:=0.25; sb:=3.1-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=3.1; ds:=0.5; sb:=4.1-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=4.1; ds:=0.25; sb:=5.1-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor
  sa:=5.1; ds:=0.25; sb:=6.1-ds;
  for s = sa step ds until sb:
    drawarrow (point s of pgamma)--(point s of pgammap);
  endfor

  %
  % Some convenient labels added for the sake of pedagogy.
  %
  label.llft(btex $\Gamma(t)$ etex,(point 2.0 of pgamma));
  label.urt(btex $\Gamma(t+dt)$ etex,(point 2.0 of pgammap));
  label.bot(btex $I(t)$ etex,(point 0 of pgamma));
  label.bot(btex \vbox{
        \hbox{Yta $S(t)$ innesluten}
        \hbox{av trajektoria $\Gamma(t)$}} etex,(-10u,-44u));
  draw (-20u,-44u){dir 70}..{dir 70}(5u,-7u);
  dotlabel(btex etex,(5u,-7u));

  %
  % Extract the area element between the two trajectories as t and t+dt.
  %
  p:=fullcircle scaled 20u xscaled 0.6 yscaled 1.1 rotated -45
    shifted (57u,0u);
  draw p dashed evenly withcolor black;
  draw (point 0.7 of p){dir -10}..{dir -10}(80u,-10u);

  picshift:=(80u,-28u);
  pa := (0u,0u) shifted picshift;
  pb := pa shifted (30u*(cosd(45),sind(45)));
  pc := pa shifted (3u,24u);
  pd := pc shifted (30u*(cosd(45),sind(45)));
  fill pa--pb--pd--pc--cycle withcolor gray;
  drawarrow pa--pb;
  label.lrt(btex ${\bf v}dt$ etex,.5[pa,pb]);
  drawarrow pc--pd;
  label.ulft(btex ${\bf v}dt$ etex,.5[pc,pd]);
  drawarrow pa--pc;
  label.lft(btex $d{\bf l}$ etex,.5[pa,pc]);
  drawarrow pb--pd;
  label.rt(btex $d{\bf l}$ etex,.5[pb,pd]);
  p := (pa+4u*(pb-pa)/abs(pb-pa)){dir 135}..{dir 180}(pa+4u*(pc-pa)/abs(pc-pa));
  draw p;
  label.urt(btex $\vartheta$ etex,point .75 of p);
  label.top(btex $d{\bf A}=({\bf v}dt)\times(d{\bf l})=
      {\bf v}\times d{\bf l}\,dt
      $ etex,(88u,34u));
  draw (88u,34u){dir 280}..{dir 280}(100u,10u);

  %
  % The magnetic flow through the surface enclosed by Gamma.
  %
  label.bot(btex \def\iint{\mathop{\int\kern-8pt\int}}
      $\displaystyle \Phi_{\rm M}(t)=\iint_{S(t)}{\bf B}({\bf x},t)
        \cdot d{\bf S}$ etex,(50u,-44u));
  draw (50u,-44u){dir 110}..{dir 110}(25u,-10u);
  dotlabel(btex etex,(25u,-10u));
  
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
