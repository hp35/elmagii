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
  path pa, pb, pc, pd, pah, pbh, pahr, pbhr;
  pair qa,qb,qc,qd,qe,qf;
  color lightgrey, lightergrey, mediumgrey, darkgrey, darkergrey;
  lightergrey=.95[black,white];
  lightgrey=.9[black,white];
  mediumgrey=.8[black,white];
  darkgrey=.7[black,white];
  darkergrey=.6[black,white];

  %
  % Definitions of the geometry to be drawn.
  %
  rb:=5u;            % Inner radius r_b of the antenna tube
  ra:=8u;            % Outer radius r_a of the antenna tube
  ll:=30u;           % Length L of each antenna tube
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
  % Draw the top part (z>0) of the dipole antenna.
  %
  fill pa shifted (0u,zgap/2+ll) withcolor lightgrey;
  draw pa shifted (0u,zgap/2+ll) withcolor black;
  draw pb shifted (0u,zgap/2+ll) withcolor black;
  fill pc shifted (0u,zgap/2+ll) withcolor mediumgrey;
  draw pc shifted (0u,zgap/2+ll) withcolor black;
  fill pd shifted (0u,zgap/2+ll) withcolor darkgrey;
  draw pd shifted (0u,zgap/2+ll) withcolor black;
  draw pah shifted (0u,zgap/2) withcolor black;
  draw pbh shifted (0u,zgap/2) withcolor black;
  draw pahr shifted (0u,zgap/2+ll) withcolor black;

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
  qa:=(50u,30u);
  qb:=(ra-1u,20u);
  qc:=(0u,0u);
  drawarrow qc--qa;
  label.top(btex ${\bf x}$ etex, qc) rotated angle (qa-qc) shifted .5[qa,qc];
  drawarrow qb--qa;
  label.top(btex ${\bf x}-{\bf x}'$ etex, qc) rotated angle (qa-qb) shifted .5[qb,qa];
  drawarrow qc--qb;
  label.lft(btex ${\bf x}'$ etex, (-28u,20u));
  draw (-28u,20u){dir 0}..{dir 0}(.5[qc,qb]+(-1u,0u));


endfig;
end
