%
% MetaPost drawing of two inertial systems S and S', with the latter moving
% at a constant velocity relative the former, along the z-axis.
%
% Copyright (C) 2026, Fredrik Jonsson
%
u := 1mm;

%
% Routine for the drawing of a single inertial frame.
%
vardef draw_inertial_frame(expr origo, xlabel, ylabel, zlabel) =
  pair ex, ey, ez;
  path xaxis, yaxis, zaxis;

  ex := unitvector(-5,-3);
  ey := unitvector(0,1);
  ez := unitvector(1,0);
  xaxis := (origo-2u*ex)--(origo+12u*ex);
  yaxis := (origo-3u*ey)--(origo+14u*ey);
  zaxis := (origo-3u*ez)--(origo+14u*ez);

  drawarrow xaxis;  label.ulft(xlabel, point 1.0 of xaxis);
  drawarrow yaxis;  label.ulft(ylabel, point 1.0 of yaxis);
  drawarrow zaxis;  label.urt(zlabel, point 1.0 of zaxis);
enddef;

beginfig(1);
  pickup pencircle scaled 1pt;
  pair origo_s, origo_sp;

  origo_s := (0u,0u);
  draw_inertial_frame(origo_s, btex $x$ etex, btex $y$ etex, btex $z$ etex);
  label.urt(btex $S$ etex,(8u,15u)) shifted origo_s;

  origo_sp := (50u,0u);
  draw_inertial_frame(origo_sp, btex $x'$ etex, btex $y'$ etex, btex $z'$ etex);
  label.urt(btex $S'$ etex,(8u,15u)) shifted origo_sp;

  drawarrow ((-10u,5u)--(40u,5u)) shifted origo_sp;
  label.top(btex ${\bf v}=v\,{\bf e}_z$ etex, (20u,5u)) shifted origo_sp;

  draw (origo_s shifted (0u,-8u))--(origo_s shifted (0u,-20u));
  draw (origo_sp shifted (0u,-8u))--(origo_sp shifted (0u,-20u));
  drawarrow (origo_s shifted (0u,-18u))--(origo_sp shifted (0u,-18u));
  drawarrow reverse ((origo_s shifted (0u,-18u))--(origo_sp shifted (0u,-18u)));
  label.top(btex $vt$ etex,
      .5[(origo_s shifted (0u,-18u)),(origo_sp shifted (0u,-18u))]);
  draw (origo_s+(18u,0u))--(origo_sp+(-5u,0u)) dashed evenly;

endfig;
end
