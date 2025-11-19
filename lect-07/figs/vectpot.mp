%
% MetaPost drawing of the geometry for extracting the vector potential
% from a magnetized object.
%
% Copyright (C) 2023, Fredrik Jonsson
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
  label.ulft(btex Begr{\"a}nsningsyta $S$ etex,(-26u,4u));

  %
  % Draw the blob of the magnetized object.
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
%  dotlabel.top(btex $$ etex,qo);
%  dotlabel.top(btex $a$ etex,qa);
%  dotlabel.top(btex $b$ etex,qb);
%  dotlabel.top(btex $c$ etex,qc);
%  dotlabel.top(btex $d$ etex,qd);
%  dotlabel.top(btex $e$ etex,qe);
%  dotlabel.top(btex $f$ etex,qf);

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
  % Draw the magnetic moment of the element dV.
  %
  drawarrow ((0u,-6u)--(0u,6u)) shifted qg;
  label.top(btex $d{\bf m}$ etex, qg+(0u,6u));

  %
  % Draw the vector r to the point of observation.
  %
  pair qh;
  qh := (60u,60u);
  drawarrow qo--qh;
  label.ulft(btex ${\bf x}$ etex,.5[qo,qh]);
  dotlabel.top(btex $d{\bf A}({\bf x})$ etex,qh);

  %
  % Draw the vector r-r' between the point of observation and source element.
  %
  drawarrow qg--qh;
  label.rt(btex ${\bf x}-{\bf x}'$ etex,.5[qg,qh]);

  %
  % Indications of magnetization (magnetic dipole density).
  %
  label.rt(btex ${\bf M}({\bf x})$ etex,(2u,-12u));

endfig;
end
