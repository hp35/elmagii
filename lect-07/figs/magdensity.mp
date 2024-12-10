%
% MetaPost drawing of the molecular magnetic dipoles of the Gilbert and
% Ampère models.
%
% Copyright (C) 2023, Fredrik Jonsson
%
u = 1mm;

picture magdipole;
magdipole := image(
  draw halfcircle rotated (120) xscaled 6u yscaled 2u;
  drawarrow halfcircle rotated (180+70) xscaled 6u yscaled 2u;
  draw (0u,-4u)--(0u,-2u);
  drawarrow (0u,0u)--(0u,4u);
);

beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the unpolarized/random molecules.
  %
  draw magdipole rotated 45 shifted (-20u,0u);
  draw magdipole rotated -20 shifted (-6u,7u);
  draw magdipole rotated -160 shifted (-3u,-6u);
  draw magdipole rotated -60 shifted (-16u,-16u);
  draw magdipole rotated 150 shifted (-30u,-8u);
  draw magdipole rotated 80 shifted (-6u,-18u);
  label.lft(btex ${\bf B}={\bf 0}$ etex, (-20u,14u));

  %
  % Draw the molecule polarized by an external field.
  %
  for k = -2 upto 1:
    label.top(btex ``$+$'' etex,(8*(k+0.5)*u,20u) shifted (46u,-6u));
    drawarrow ((8*(k+0.5)*u,20u)--(8*(k+0.5)*u,-20u)) shifted (46u,-6u);
    label.bot(btex ``$-$'' etex,(8*(k+0.5)*u,-20u) shifted (46u,-6u));
  endfor
  draw magdipole rotated 175 shifted (-20u,0u) shifted (60u,0u);
  draw magdipole rotated 185 shifted (-6u,7u) shifted (60u,0u);
  draw magdipole rotated 180 shifted (-3u,-6u) shifted (60u,0u);
  draw magdipole rotated 185 shifted (-16u,-16u) shifted (60u,0u);
  draw magdipole rotated 175 shifted (-30u,-8u) shifted (60u,0u);
  draw magdipole rotated 180 shifted (-6u,-18u) shifted (60u,0u);
  label.rt(btex ${\bf B}\ne{\bf 0}$ etex,(8*(1+0.5)*u,14u) shifted (50u,0u));

endfig;
end
