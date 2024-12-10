%
% MetaPost drawing of the molecular polarizability building up the
% polarization density.
%
% Copyright (C) 2022, Fredrik Jonsson
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the unpolarized molecule.
  %
  draw fullcircle scaled 16u shifted (0u,0u);
  label(btex $-$ etex,(-6u,0u));
  label(btex $-$ etex,(-4.24u,4.24u));
  label(btex $-$ etex,(0u,6u));
  label(btex $-$ etex,(4.24u,4.24u));
  label(btex $-$ etex,(6u,0u));
  label(btex $-$ etex,(4.24u,-4.24u));
  label(btex $-$ etex,(0u,-6u));
  label(btex $-$ etex,(-4.24u,-4.24u));
  fill fullcircle scaled 4u shifted (0u,0u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (0u,0u);
  label(btex $+$ etex,(0u,0u));
  label.lft(btex ${\bf E}={\bf 0}$ etex, (0u,14u));

  %
  % Draw the molecule polarized by an external field.
  %
  for k = -2 upto 1:
    label.top(btex $+$ etex,(8*(k+0.5)*u,20u) shifted (40u,0u));
    drawarrow ((8*(k+0.5)*u,20u)--(8*(k+0.5)*u,-20u)) shifted (40u,0u);
    label.bot(btex $-$ etex,(8*(k+0.5)*u,-20u) shifted (40u,0u));
  endfor
  label.rt(btex ${\bf E}\ne{\bf 0}$ etex,(8*(1+0.5)*u,14u) shifted (40u,0u));
  draw fullcircle xscaled 16u yscaled 24u shifted (40u,3u);
  label(btex $-$ etex,(-6u,0u) shifted (40u,3u));
  label(btex $-$ etex,(-4.24u,6.36u) shifted (40u,3u));
  label(btex $-$ etex,(0u,9u) shifted (40u,3u));
  label(btex $-$ etex,(4.24u,6.36u) shifted (40u,3u));
  label(btex $-$ etex,(6u,0u) shifted (40u,3u));
  label(btex $-$ etex,(4.24u,-6.36u) shifted (40u,3u));
  label(btex $-$ etex,(0u,-9u) shifted (40u,3u));
  label(btex $-$ etex,(-4.24u,-6.36u) shifted (40u,3u));
  fill fullcircle scaled 4u shifted (40u,-3u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (40u,-3u);
  label(btex $+$ etex,(40u,-3u));
  drawarrow ((0u,3u)--(0u,-3u)) shifted (40u,3u);
  label.rt(btex ${\bf p}$ etex,(0u,0u) shifted (40u,3u));

endfig;
end
