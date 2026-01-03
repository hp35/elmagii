%
% MetaPost drawing of a centre-fed dipole antenna consisting of a tube with outer
% radius a, being signifigantly smaller than the wavelength of the electromagnetic
% wave.
%
% Copyright (C) 2025, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  pickup pencircle scaled 1pt;
  path pa, pb, pc, pd, pe, pf, pah, pbh, pahr, pbhr;
  pair qa,qb,qc,qd,qe,qf;
  color lightgrey, lightergrey, mediumgrey, darkgrey, darkergrey;
  lightergrey=.95[black,white];
  lightgrey=.9[black,white];
  mediumgrey=.8[black,white];
  darkgrey=.7[black,white];
  darkergrey=.5[black,white];

  %
  % Definitions of the geometry to be drawn.
  %
  rb:=5u;            % Inner radius r_b of the antenna tube
  ra:=8u;            % Outer radius r_a of the antenna tube
  ll:=50u;           % Length L of each antenna tube
  zgap:=4u;          % Gap between the two elements
  aspectratio:=0.3;  % Y/X-scaling

  %
  % Outer circle for the antenna cross-section.
  %
  pa:=fullcircle xscaled (2ra) yscaled (aspectratio*(2ra));
  pah:=halfcircle xscaled (2ra) yscaled (aspectratio*(2ra));
  pahr:=halfcircle rotated 180 xscaled (2ra) yscaled (aspectratio*(2ra));

  %
  % Inner circle for the antenna cross-section.
  %
  pb:=fullcircle xscaled (2rb) yscaled (aspectratio*(2rb));
  pbh:=halfcircle xscaled (2rb) yscaled (aspectratio*(2rb));
  pbhr:=halfcircle rotated 180 xscaled (2rb) yscaled (aspectratio*(2rb));

  %
  % The mantle surface of each of the two parts of the cylindrical dipole antenna.
  %
  pc:=((-ra,0u)--(-ra,-ll)..(pahr shifted (0u,-ll))..(ra,-ll)--(ra,0u)
      ..(reverse pahr shifted (0u,0u))--cycle);
  pd:=((-rb,0u)--(-rb,-ll)..(pbhr shifted (0u,-ll))..(rb,-ll)--(rb,0u)
      ..(reverse pbhr shifted (0u,0u))--cycle);

  %
  % Outer circle for the antenna cross-section, clipped to the inner cylinder.
  %
  v1:=1.15;
  v2:=2.85;
  vmax:=8.0;
  pe:=subpath (v2-vmax,v1) of pa;
  pf:=subpath (v1,v2) of pa;  % Complement of pe

  %
  % Draw the bottom part (z<0) of the dipole antenna.
  %
  fill pc shifted (0u,-zgap/2) withcolor lightgrey;
  fill pa shifted (0u,-zgap/2) withcolor lightergrey;
  fill pd shifted (0u,-zgap/2) withcolor mediumgrey;
  draw pe shifted (0u,-zgap/2-ll) withcolor darkergrey;
  draw pf shifted (0u,-zgap/2-ll) withcolor darkgrey;
  draw pahr shifted (0u,-zgap/2-ll) withcolor black;
  draw pc shifted (0u,-zgap/2) withcolor black;
  draw pbh shifted (0u,-zgap/2-ll) withcolor darkgrey;
  draw pd shifted (0u,-zgap/2) withcolor darkergrey;
  fill pb shifted (0u,-zgap/2) withcolor darkgrey;
  draw pb shifted (0u,-zgap/2) withcolor black;
  draw pa shifted (0u,-zgap/2) withcolor black;

  %
  % Draw the top part (z>0) of the dipole antenna.
  %
  fill pc shifted (0u,zgap/2+ll) withcolor lightgrey;
  fill pa shifted (0u,zgap/2+ll) withcolor lightergrey;
  fill pd shifted (0u,zgap/2+ll) withcolor mediumgrey;
  draw pe shifted (0u,zgap/2) withcolor darkergrey;
  draw pf shifted (0u,zgap/2) withcolor darkgrey;
  draw pahr shifted (0u,zgap/2) withcolor black;
  draw pc shifted (0u,zgap/2+ll) withcolor black;
  draw pbh shifted (0u,zgap/2) withcolor darkgrey;
  draw pd shifted (0u,zgap/2+ll) withcolor darkergrey;
  fill pb shifted (0u,zgap/2+ll) withcolor darkgrey;
  draw pb shifted (0u,zgap/2+ll) withcolor black;
  draw pa shifted (0u,zgap/2+ll) withcolor black;

  %
  % Draw the Cartesian coordinate axes.
  %
  drawarrow (0u,-ll-zgap/2-10u)--(0u,ll+zgap/2+10u);
  label.urt(btex $z$ etex, (0u,ll+zgap/2+10u));
  drawarrow (0u,0u)--(24u,-3u);
  label.urt(btex $y$ etex, (24u,-3u));
  drawarrow (0u,0u)--(-12u,-10u);
  label.ulft(btex $x$ etex, (-12u,-10u));

  %
  % Draw the observation point and attach labels of the quantities of interest.
  %
  qa:=(90u,.9ll);      % Observation point ${\bf x}$
  qb:=(ra-1u,.7ll);    % Source point ${\bf x}'$
  qc:=(0u,0u);         % Origo ${\bf 0}$
  drawarrow qc--qa;
  label.top(btex ${\bf x}$ etex, qc) rotated angle (qa-qc) shifted .5[qa,qc];
  drawarrow qb--qa;
  label.top(btex ${\bf x}-{\bf x}'$ etex, qc) rotated angle (qa-qb) shifted .5[qb,qa];
  drawarrow qc--qb;
  label.lft(btex ${\bf x}'$ etex, (-28u,ypart qb));
  draw (-28u,ypart qb){dir 0}..{dir 0}(.5[qc,qb]+(-1u,0u));

  %
  % Lumped ports for driving the antenna with a harmonic voltage applied across
  % the gap between the elements.
  %
  qa:=(-30u,7u);
  qb:=(xpart qa,-ypart qa);
  dotlabel.lft(btex etex,qa);
  dotlabel.lft(btex etex,qb);
  draw qa{dir 0}..{dir 0}(-ra,zgap/2);
  draw qb{dir 0}..{dir 0}(-ra,-zgap/2);

  drawarrow (qa shifted (0u,-1u))--(qb shifted (0u,1u));
  label.lft(btex $V(t)$ etex, (xpart qa, ypart (qa+qb)/2));

endfig;
end
