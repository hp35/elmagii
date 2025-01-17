%
% MetaPost drawing of the molecular magnetic dipoles of the Gilbert and
% Ampère models.
%
% Copyright (C) 2023, Fredrik Jonsson
%
u = 1mm;

picture magdipole;
magdipole := image(
  pickup pencircle scaled 1pt;
  draw halfcircle rotated (120) xscaled 6u yscaled 2u;
  drawarrow halfcircle rotated (180+70) xscaled 6u yscaled 2u;
  draw (0u,-8u)--(0u,-2u);
  drawarrow (0u,0u)--(0u,8u);
);

beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the electric dipole model
  %
  fill fullcircle scaled 4u shifted (0u,8u) withcolor .9[black,white];
  draw fullcircle scaled 4u shifted (0u,8u);
  fill fullcircle scaled 4u shifted (0u,-8u) withcolor .9[black,white];
  draw fullcircle scaled 4u shifted (0u,-8u);
  label(btex $+$ etex, (0u,8u));
  label(btex $-$ etex, (0u,-8u));
  label.bot(btex \vbox{\hbox{Elektrisk}\hbox{dipol}} etex, (0u,-14u));
  drawarrow (0u,-6u)--(0u,6u);
  label.rt(btex $+q$ etex, (2u,8u));
  label.rt(btex $-q$ etex, (2u,-8u));
  label.rt(btex ${\bf p}$ etex, (1u,0u));

  %
  % Draw the Gilbert model
  %
  fill fullcircle scaled 4u shifted (40u,8u) withcolor .9[black,white];
  draw fullcircle scaled 4u shifted (40u,8u);
  fill fullcircle scaled 4u shifted (40u,-8u) withcolor .9[black,white];
  draw fullcircle scaled 4u shifted (40u,-8u);
  label(btex $+$ etex, (40u,8u));
  label(btex $-$ etex, (40u,-8u));
  label.bot(btex \vbox{\hbox{Gilberts}\hbox{modell}} etex, (40u,-14u));
  drawarrow (40u,-6u)--(40u,6u);
  label.rt(btex N etex, (42u,8u));
  label.rt(btex S etex, (42u,-8u));
  label.rt(btex ${\bf m}$ etex, (41u,0u));

  %
  % Draw the Ampère model
  %
  draw magdipole rotated 0 shifted (80u,0u);
  label.bot(btex \vbox{\hbox{Amp\`eres}\hbox{modell}} etex, (80u,-14u));
  label.rt(btex ${\bf m}$ etex, (81u,6u));
  label.rt(btex $I$ etex, (83u,0u));

endfig;
end
