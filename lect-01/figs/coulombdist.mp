%
% MetaPost drawing of the classical electric charge distribution used when
% analyzing Coulombs law, with application to the derivation of Gauss' law.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

picture dv;
dv := image(
  draw (-3,-3)--(1,-3)--(1,1)--(-3,1)--(-3,-3);
  draw (-3,1)--(-1,3)--(3,3)--(1,1);
  draw (3,3)--(3,-1)--(1,-3);
  draw (-3,-3)--(-1,-1)--(-1,3);
  draw (-1,-1)--(3,-1);
);

beginfig(1);
  pickup pencircle scaled 1pt;
  label.ulft(btex Volym $V$ etex,(-10u,18u));

  %
  % Draw the blob of the electric charge distribution.
  %
  path p;
  pair qo,qa,qb,qc,qd,qe,qf;
  qo := (0u,0u);
  qa := (0u,14u);
  qb := (20u,4u);
  qc := (30u,-14u);
  qd := (0u,-14u);
  qe := (-20u,-4u);
  qf := (-20u,10u);
  p := qa..{dir 0}qb..qc..qd..qe..qf..qa..cycle;
  fill p withcolor .95[black,white];
  draw p;

  %
  % Draw the x-axis
  %
  draw (1.4[qo,qb])--qb;
  draw qb--(.8[qo,qe]) dashed evenly;
  drawarrow (.8[qo,qe])--(1.6[qo,qe]);
  label.ulft(btex $x$ etex,(1.6[qo,qe]));
  
  %
  % Draw the y-axis
  %
  draw (1.4[qo,qf])--qf;
  draw qf--(.8[qo,qc]) dashed evenly;
  drawarrow (.8[qo,qc])--(1.6[qo,qc]);
  label.urt(btex $y$ etex,(1.6[qo,qc]));
  
  %
  % Draw the z-axis
  %
  draw (1.6[qo,qd])--qd;
  draw qd--(0.8[qo,qa]) dashed evenly;
  drawarrow (0.8[qo,qa])--(2.0[qo,qa]);
  label.ulft(btex $z$ etex,(2.0[qo,qa]));

  %
  % Draw the volume element dV and the vector r' to its location.
  %
  pair qg;
  qg := (22u,-6u);
  drawarrow qo--qg;
  draw dv scaled .7u shifted (qg);
  label.rt(btex $dV'$ etex,qg+(2u,0u));
  label.top(btex ${\bf x'}$ etex,.7[qo,qg]);

  %
  % Draw the vector r to the point of observation.
  %
  pair qh;
  qh := (60u,60u);
  drawarrow qo--qh;
  label.ulft(btex ${\bf x}$ etex,.5[qo,qh]);
  dotlabel.top(btex ${\bf E}({\bf x})$ etex,qh);

  %
  % Draw the vector r-r' between the point of observation and source element.
  %
  drawarrow qg--qh;
  label.rt(btex ${\bf x}-{\bf x}'$ etex,.5[qg,qh]);

  %
  % Indications of charge and current densities.
  %
  label.rt(btex $\rho({\bf x})$ etex,(5u,-12u));
  draw (26u,-3u){dir 10}..{dir 10}(50u,6u);
  label.rt(btex $dq'=\rho({\bf x}')dV'$ etex,(50u,6u));

endfig;
end
