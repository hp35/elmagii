%
% MetaPost drawing of a two-dimensional map of a potential as height curves,
% including arrows locally pointing towards the steepest descent in the map.
% As an analogy to the electric field, as defined in terms of a negative
% gradient of the scalar potential, the arrows are drawn for the negative
% gradient of the height in the map.
%
% Besides providing an illustration of the gradient operator, this specific
% figure also provides a rather nice example on the vector character of
% MetaPost drawings as such.
%
% Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
%
u:=1mm;

%
% Routine for the drawing of an inward-pointing arrow at
% a given path parameter.
%
vardef draw_outward_arrow(expr p, t, arrowlen) =

  save pt, tang, normal;
  pair pt, tang, normal;
  pt := point t of p;                      % Point along the path
  tang := direction t of p;                % Tangential direction
  normal := unitvector (tang rotated 90);  % Normal direction

  %
  % Ensure that the normal points inward. For a path describing a
  % counterclockwise contour, the left normal is directed inward
  % from the path.
  %
  if (pt + normal) intersectiontimes p = (-1,-1): fi;
  drawarrow pt--(pt-arrowlen*normal);      % Draw arrow outwards

enddef;

beginfig(1);

  pickup pencircle scaled 1pt;
  path p;
  pair origo;
  origo:=(-40u,-32u);
  numarrows:=8;
  arrowlen:=3u;

  %
  % Draw the coordinate system and origo, just as a reference on
  % the two-dimensional plane coordinates.
  %
  drawarrow (origo shifted (-4u,0u))--(origo shifted (7u,0u));
  label.urt(btex $x$ etex,(origo shifted (7u,0u)));
  drawarrow (origo shifted (0u,-4u))--(origo shifted (0u,7u));
  label.urt(btex $y$ etex,(origo shifted (0u,7u)));
  p:=fullcircle scaled 3u shifted origo;
  fill p withcolor white;
  draw p;
  p:=fullcircle scaled .8u shifted origo;
  fill p withcolor black;
  label.llft(btex $z$ etex,origo shifted (-1u,-1u));

  %
  % Highest level contour with steepest slope indicated by arrows,
  % left peak.
  %
  p:=(0u,-7u){dir 20}..(3u,-2u)..(7u,0u)..(0u,7u)..(-7u,0u)
    ..{dir 20}(0u,-7u);
  draw p;
  for k=0 upto numarrows:
    draw_outward_arrow(p, (k/numarrows)*(length p), arrowlen);
  endfor;
  label.ulft(btex $h_3$ etex,(point 0 of p));

  %
  % Highest level contour with steepest slope indicated by arrows,
  % right peak.
  %
  p:=((0u,-7u){dir 40}..(7u,0u)..(-4u,4u)..(-4u,14u)..(-7u,0u)
    ..{dir 40}(0u,-7u)) shifted (32u,0u);
  draw p;
  for k=0 upto numarrows:
    draw_outward_arrow(p, (k/numarrows)*(length p), arrowlen);
  endfor;
  label.ulft(btex $h_3$ etex,(point 0.25 of p));

  %
  % Next lower contour with steepest slope indicated by arrows,
  % left peak.
  %
  p:=(0u,-16u){dir 20}..(7u,-7u)..(12u,0u)..(0u,12u)..(-12u,0u)
    ..{dir 20}(0u,-16u);
  draw p;
  for k=0 upto numarrows:
    draw_outward_arrow(p, (k/numarrows)*(length p), arrowlen);
  endfor;
  label.ulft(btex $h_2$ etex,(point 0 of p));

  %
  % Next lower contour with steepest slope indicated by arrows,
  % right peak.
  %
  p:=((3u,-11u){dir 40}..(12u,0u)..(4u,10u)..(-8u,20u)..(-12u,0u)
    ..{dir 40}(3u,-11u)) shifted (32u,0u);
  draw p;
  for k=0 upto numarrows:
    draw_outward_arrow(p, (k/numarrows)*(length p), arrowlen);
  endfor;
  label.ulft(btex $h_2$ etex,(point 0.25 of p));

  %
  % Next lower contour with steepest slope indicated by arrows.
  %
  p:=((3u,-22u){dir 30}..(15u,-11u)..(32u,-18u)..(52u,0u)..(42u,16u)
      ..(30u,24u)..(14u,21u)..(-8u,16u)
    ..{dir 30}(3u,-22u));
  draw p;
  for k=0 upto numarrows:
    draw_outward_arrow(p, (k/numarrows)*(length p), arrowlen);
  endfor;
  label.ulft(btex $h_1$ etex,(point 0 of p));

  %
  % Next lower contour with steepest slope indicated by arrows.
  %
  p:=((3u,-22u){dir 30}..(10u,-11u)..(24u,-22u)..(42u,0u)..(42u,16u)
      ..(30u,24u)..(14u,21u)..(-8u,16u)
    ..{dir 30}(3u,-22u)) scaled 1.4 shifted (0u,0u);
  draw p;
  for k=0 upto numarrows:
    draw_outward_arrow(p, (k/numarrows)*(length p), arrowlen);
  endfor;
  label.ulft(btex $z=h_0$ etex,(point 0 of p));

  %
  % Add a few labels for the negative gradient, in analogy with the negative gradient as used for the electric field as defined in terms of the scalar potential.
  %
  label.rt(btex $-\nabla h(x,y)$ etex,(61u,24u));
  label.rt(btex $-\nabla h(x,y)$ etex,(43.5u,18u));
  label.rt(btex $-\nabla h(x,y)$ etex,(62u,-1u));
  label.top(btex $-\nabla h(x,y)$ etex,(-14u,26u));

endfig;
end
