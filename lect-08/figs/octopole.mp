%
% MetaPost drawing of the classical electric octopole geometry.
%
% Copyright (C) 2022, Fredrik Jonsson
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the classic, cube electric octopole.
  %
  draw ((0u,-7u)--(14u,-7u)--(14u,7u)--(0u,7u)--(0u,-7u)) shifted (7u,7u);
  draw (0u,-7u)--(14u,-7u)--(14u,7u)--(0u,7u)--(0u,-7u);
  draw (0u,-7u)--(7u,0u);
  draw (0u,7u)--(7u,14u);
  draw (14u,7u)--(21u,14u);
  draw (14u,-7u)--(21u,0u);

  fill fullcircle scaled 4u shifted (0u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (0u,-7u);
  label(btex $+$ etex,(0u,-7u));
  label.lft(btex $+q$ etex,(-3u,-7u));

  fill fullcircle scaled 4u shifted (14u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (14u,-7u);
  label(btex $-$ etex,(14u,-7u));
  label.rt(btex $-q$ etex,(17u,-7u));

  fill fullcircle scaled 4u shifted (14u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (14u,7u);
  label(btex $+$ etex,(14u,7u));
%  label.rt(btex $+q$ etex,(17u,7u));

  fill fullcircle scaled 4u shifted (0u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (0u,7u);
  label(btex $-$ etex,(0u,7u));
  label.lft(btex $-q$ etex,(-3u,7u));

  fill fullcircle scaled 4u shifted (7u,14u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (7u,14u);
  label(btex $+$ etex,(7u,14u));
  label.lft(btex $+q$ etex,(4u,14u));

  fill fullcircle scaled 4u shifted (21u,14u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (21u,14u);
  label(btex $-$ etex,(21u,14u));
  label.rt(btex $-q$ etex,(24u,14u));

  fill fullcircle scaled 4u shifted (21u,0u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (21u,0u);
  label(btex $+$ etex,(21u,0u));
  label.rt(btex $+q$ etex,(24u,0u));

  fill fullcircle scaled 4u shifted (7u,0u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (7u,0u);
  label(btex $-$ etex,(7u,0u));
%  label.rt(btex $-q$ etex,(7u,0u));
  
  label.bot(btex 3D kubisk elektrisk oktopol etex,(10.5u,-15u));

  %
  % Draw the double-square electric octopole.
  %
  draw (60u,-7u)--(102u,-7u)--(102u,7u)--(60u,7u)--(60u,-7u);
  draw (74u,-7u)--(74u,7u);
  draw (88u,-7u)--(88u,7u);

  fill fullcircle scaled 4u shifted (60u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (60u,-7u);
  label(btex $+$ etex,(60u,-7u));
  label.bot(btex $+q$ etex,(60u,-10u));

  fill fullcircle scaled 4u shifted (74u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (74u,-7u);
  label(btex $-$ etex,(74u,-7u));
  label.bot(btex $-q$ etex,(74u,-10u));

  fill fullcircle scaled 4u shifted (74u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (74u,7u);
  label(btex $+$ etex,(74u,7u));
  label.top(btex $+q$ etex,(74u,10u));

  fill fullcircle scaled 4u shifted (60u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (60u,7u);
  label(btex $-$ etex,(60u,7u));
  label.top(btex $-q$ etex,(60u,10u));

  fill fullcircle scaled 4u shifted (88u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (88u,-7u);
  label(btex $-$ etex,(88u,-7u));
  label.bot(btex $-q$ etex,(88u,-10u));

  fill fullcircle scaled 4u shifted (102u,-7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (102u,-7u);
  label(btex $+$ etex,(102u,-7u));
  label.bot(btex $+q$ etex,(102u,-10u));

  fill fullcircle scaled 4u shifted (102u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (102u,7u);
  label(btex $-$ etex,(102u,7u));
  label.top(btex $-q$ etex,(102u,10u));

  fill fullcircle scaled 4u shifted (88u,7u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (88u,7u);
  label(btex $+$ etex,(88u,7u));
  label.top(btex $+q$ etex,(88u,10u));

  label.bot(btex Plan{\"a}r dubbel-kvadratisk elektrisk oktopol etex,(81u,-15u));
  
endfig;
end
