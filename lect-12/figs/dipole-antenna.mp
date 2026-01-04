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
  zgap:=6u;          % Gap between the two elements
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
  label.top(btex ${\bf E}({\bf x},t),\,{\bf B}({\bf x},t)$ etex, qa);
  label.top(btex Observationspunkt etex, qa shifted (0pt,12pt));
  drawarrow qb--qa;
  label.top(btex ${\bf x}-{\bf x}'$ etex, qc) rotated angle (qa-qb) shifted .5[qb,qa];
  drawarrow qc--qb;
  label.top(btex ${\bf x}'$ etex, (0u,0u)) rotated angle (qb-qc) shifted .3[qb,qc];
  label.lrt(btex K{\"a}llpunkt etex, qb shifted (1u,0u));
%  qa:=(50u,-80u);
%  label.top(btex $\displaystyle\Bigg\{$ etex, qa shifted (-33pt,-1pt));
%  label.top(btex \hbox to 80pt{}$\displaystyle E({\bf x},t)=-\nabla\phi({\bf x},t)
%      -{{\partial{\bf A}({\bf x},t)}\over{\partial t}}$ etex, qa shifted (0u,12pt));
%  label.top(btex \hbox to 36pt{}$\displaystyle
%      B({\bf x},t)=\nabla\times{\bf A}({\bf x},t)$ etex, qa);

  %
  % Lumped ports for driving the antenna with a harmonic voltage applied across
  % the gap between the elements.
  %
  qa:=(50u,15u);
  qb:=(xpart qa,-ypart qa);
  pickup pencircle scaled 2pt; % 1.4pt;
  draw qa{dir 180}..{dir 180}(ra,zgap/2);
  draw qb{dir 180}..{dir 180}(ra,-zgap/2);
  pickup pencircle scaled 1pt;
  fill fullcircle scaled 6pt shifted qa withcolor white;
  draw fullcircle scaled 6pt shifted qa;
  fill fullcircle scaled 6pt shifted qb withcolor white;
  draw fullcircle scaled 6pt shifted qb;
  pickup pencircle scaled 1pt;
  drawarrow (qa shifted (0u,-2u))--(qb shifted (0u,2u));
  label.rt(btex $U(t)$, matningssp{\"a}nning etex, (xpart qa, ypart (qa+qb)/2));

  %
  % Measures of the radii.
  %
  pickup pencircle scaled .7pt;
  draw (-ra,-ll-zgap/2-4u)--(-ra,-ll-zgap/2-4u-26u);
  draw (ra,-ll-zgap/2-4u)--(ra,-ll-zgap/2-4u-26u);
  drawarrow (-ra,-ll-zgap/2-4u-24u)--(ra,-ll-zgap/2-4u-24u);
  drawarrow reverse ((-ra,-ll-zgap/2-4u-24u)--(ra,-ll-zgap/2-4u-24u));
  label.top(btex $a$ etex, (0u,-ll-zgap/2-4u-24u));
  draw (-rb,-ll-zgap/2-4u)--(-rb,-ll-zgap/2-4u-16u);
  draw (rb,-ll-zgap/2-4u)--(rb,-ll-zgap/2-4u-16u);
  drawarrow (-rb,-ll-zgap/2-4u-14u)--(rb,-ll-zgap/2-4u-14u);
  drawarrow reverse ((-rb,-ll-zgap/2-4u-14u)--(rb,-ll-zgap/2-4u-14u));
  label.top(btex $b$ etex, (0u,-ll-zgap/2-4u-14u));

  %
  % Measure of the air gap between the elements.
  %
  pickup pencircle scaled .7pt;
  draw (-ra-4u,zgap/2)--(-ra-26u,zgap/2);
  draw (-ra-4u,-zgap/2)--(-ra-26u,-zgap/2);
  drawarrow (-ra-24u,-zgap/2)--(-ra-24u,zgap/2);
  drawarrow reverse ((-ra-24u,-zgap/2)--(-ra-24u,zgap/2));
  label.lft(btex $g$ etex, (-ra-24u,0u));

  %
  % Measure of the length of the top (z>0) element.
  %
  pickup pencircle scaled .7pt;
  draw (-ra-4u,zgap/2+ll)--(-ra-26u,zgap/2+ll);
  drawarrow (-ra-24u,zgap/2)--(-ra-24u,zgap/2+ll);
  drawarrow reverse ((-ra-24u,zgap/2)--(-ra-24u,zgap/2+ll));
  label.lft(btex $L$ etex, (-ra-24u,zgap/2+ll/2));

  %
  % Measure of the length of the bottom (z<0) element.
  %
  pickup pencircle scaled .7pt;
  draw (-ra-4u,-zgap/2-ll)--(-ra-26u,-zgap/2-ll);
  drawarrow (-ra-24u,-zgap/2)--(-ra-24u,-zgap/2-ll);
  drawarrow reverse ((-ra-24u,-zgap/2)--(-ra-24u,-zgap/2-ll));
  label.lft(btex $L$ etex, (-ra-24u,-zgap/2-ll/2));

  %
  % A few convenient labels.
  %
  pickup pencircle scaled 1pt;
  qa:=((ra,-zgap/2-ll/2) shifted (-1u,0u));
  qb:=(qa shifted (40u,-15u));
  draw qa{dir -10}..{dir -10}qb;
  label.rt(btex ${\bf J}({\bf x}',t)$ etex, qb);

endfig;
end
