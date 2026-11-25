%
% MetaPost drawing of a harmonic wave traveling in the positive z-direction.
%
% Copyright (C) 2026, Fredrik Jonsson
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;
  label.urt(btex Fram{\aa}tpropagerande harmonisk l{\"o}sning: etex,(-40u,16u));
  drawarrow (-10u,0u)--(96u,0u);
  label.urt(btex $z$ etex,(96u,0u));

  %
  % Generate and draw the cosine path corresponding to a harmonic wave.
  %
  numeric pi, sx, sy;
  path p;
  pi := 3.141592653589793;
  xmax:=70u;
  sy := 30;
  p := (0,sy*cosd(0))
    for x=0.0 step 0.1 until xmax:
      .. (x, sy*cosd(x*0.2*(180/pi)))
    endfor;

  pickup pencircle scaled 1.5pt;
  draw p;
  pickup pencircle scaled 1pt;
  drawarrow (60u,4u)--(79u,4u);
  label.urt(btex $c$ (m/s) etex,(79u,4u));
    label.top(btex $f(z-ct)=\cos(k(z-ct))$ etex,(40u,11u));

endfig;
end
