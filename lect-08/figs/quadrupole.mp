%
% MetaPost drawing of the classical electric quadrupole geometry.
%
% Copyright (C) 2023, Fredrik Jonsson
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the linear electric quadrupole.
  %
  draw (-14u,0u)--(14u,0u);
  fill fullcircle scaled 4u shifted (-14u,0u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (-14u,0u);
  label(btex $+$ etex,(-14u,0u));
  label.top(btex $+q$ etex,(-14u,4u));

  fill fullcircle scaled 6u shifted (0u,0u) withcolor .95[black,white];
  draw fullcircle scaled 6u shifted (0u,0u);
  label(btex $-$ etex,(0u,0u));
  label.top(btex $-2q$ etex,(0u,4u));

  fill fullcircle scaled 4u shifted (14u,0u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (14u,0u);
  label(btex $+$ etex,(14u,0u));
  label.top(btex $+q$ etex,(14u,4u));

  label.bot(btex Linj{\"a}r elektrisk kvadrupol etex,(0u,-11u));
  
  %
  % Draw the classic, square electric quadrupole.
  %
  draw (60u,-7u)--(74u,-7u)--(74u,7u)--(60u,7u)--(60u,-7u);

  fill fullcircle scaled 4u shifted (60u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (60u,-7u);
  label(btex $+$ etex,(60u,-7u));
  label.lft(btex $+q$ etex,(56u,-7u));

  fill fullcircle scaled 4u shifted (74u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (74u,-7u);
  label(btex $-$ etex,(74u,-7u));
  label.rt(btex $-q$ etex,(78u,-7u));

  fill fullcircle scaled 4u shifted (74u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (74u,7u);
  label(btex $+$ etex,(74u,7u));
  label.rt(btex $+q$ etex,(78u,7u));

  fill fullcircle scaled 4u shifted (60u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (60u,7u);
  label(btex $-$ etex,(60u,7u));
  label.lft(btex $-q$ etex,(56u,7u));

  label.bot(btex Kvadratisk elektrisk kvadrupol etex,(67u,-11u));
  
endfig;
end
