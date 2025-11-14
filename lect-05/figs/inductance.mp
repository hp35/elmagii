%
% MetaPost drawing of the geometry used in deriving the mutual inductance
% between two conducting loops Gamma and Gamma'.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

%
% Employing the TeX-arrow package by Tommy Ekola.
%
input ../macros/cmarrows/cmarrows.mp
setup_cmarrows(
  arrow_name = "texarrow";
  parameter_file = "cmr12.mf";
  macro_name = "drawtexarrow");

beginfig(1);
  path p, gammap, gamma;
  pair pa, pb, pl, pal, palp;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;

  %
  % Draw the first loop (Gamma').
  %
  gammap:=(0u,0u){dir 0}..(0u,20u)..(20u,30u)..(-10u,40u)
    ..(-10u,10u)..{dir 0}(0u,0u)--cycle;
  draw gammap withcolor black;
  drawtexarrow subpath (0.0,0.6) of gammap;
  label.ulft(btex $I'(t)$ etex, point 0.6 of gammap shifted (-1u,-1u));
  drawtexarrow subpath (3.0,3.1) of gammap;
  label.lft(btex $I'(t)$ etex, point 3.1 of gammap);
  label.top(btex Prim{\"a}r loop $\Gamma'$ etex,
      point 2.7 of gammap shifted (0u,2u));

  %
  % Draw the second loop (Gamma).
  %
  gamma:=((0u,0u){dir 0}..(10u,-17u)..(20u,10u)..(20u,40u)
    ..(0u,20u)..(-10u,30u)
    ..(-10u,10u)..{dir 0}(0u,0u)--cycle) shifted (60u,30u);
  draw gamma withcolor black;
  drawtexarrow subpath (1.0,1.8) of gamma;
  label.urt(btex $I(t)$ etex, point 1.8 of gamma);
  drawtexarrow subpath (5.0,5.1) of gamma;
  label.ulft(btex $I(t)$ etex, point 5.1 of gamma);
  label.top(btex Sekund{\"a}r loop $\Gamma$ etex,
      point 3.0 of gamma shifted (0u,2u));

  %
  % Field lines, starting from the top.
  %
  p:=(-30u,40u){dir 20}..{dir 50}(95u,70u);
  draw subpath (0.0,0.184) of p withcolor black;
  draw subpath (0.184,0.270) of p withcolor gray;
  draw subpath (0.270,0.569) of p withcolor black;
  draw subpath (0.569,0.63) of p withcolor gray;
  drawarrow subpath (0.63,1.0) of p withcolor black;

  p:=((-30u,30u){dir 10}..{dir 55}(105u,60u));
  draw subpath (0.0,0.115) of p withcolor black;
  draw subpath (0.115,0.230) of p withcolor gray;
  draw subpath (0.230,0.566) of p withcolor black;
  draw subpath (0.566,0.65) of p withcolor gray;
  drawarrow subpath (0.65,0.9) of p withcolor black;

  p:=((-30u,20u){dir 0}..{dir 60}(115u,50u));
  draw subpath (0.0,0.104) of p withcolor black;
  draw subpath (0.104,0.141) of p withcolor gray;
  draw subpath (0.141,0.591) of p withcolor black;
  draw subpath (0.591,0.65) of p withcolor gray;
  drawarrow subpath (0.65,0.8) of p withcolor black;

  p:=((-30u,10u){dir -10}..{dir 65}(130u,40u));
  draw subpath (0.0,0.113) of p withcolor black;
  draw subpath (0.113,0.147) of p withcolor gray;
  drawarrow subpath (0.147,0.7) of p withcolor black;
  label.rt(btex ${\bf B}({\bf x},t)$ etex,(90u,55u));

  %
  % Draw the coordinate system.
  %
  pa:=(40u,-20u);
  pb:=(pa shifted (0u,10u));
  drawarrow pa--pb;
  label.urt(btex $z$ etex, pb);
  pb:=(pa shifted (-8u,-3u));
  drawarrow pa--pb;
  label.ulft(btex $x$ etex, pb);
  pb:=(pa shifted (9u,-1u));
  drawarrow pa--pb;
  label.urt(btex $y$ etex, pb);

  %
  % Draw the line segment dl' at the primary loop.
  %
  dlp:=16u;
  palp:=point 1.1 of gammap;
  phi:=55;
  pb:=palp+(dlp*(cosd(phi),sind(phi)));
  drawarrow palp--pb;
  label.ulft(btex $d{\bf l}'$ etex, pb);
  pickup pencircle scaled 3pt;
  pb:=palp+(2u*(cosd(phi),sind(phi)));
  draw palp--pb;
  pl:= point .5 of (palp--pb);
  pickup pencircle scaled 1pt;
  label.ulft(btex $dl'$ etex, palp);

  %
  % Draw the line segment dl at the secondary loop.
  %
  dl:=14u;
  pal:=point 0.22 of gamma;
  phi:=-55;
  pb:=pal+(dl*(cosd(phi),sind(phi)));
  drawarrow pal--pb;
  label.urt(btex $d{\bf l}'$ etex, pb);
  pickup pencircle scaled 3pt;
  pb:=pal+(2u*(cosd(phi),sind(phi)));
  draw pal--pb;
  pl:= point .5 of (pal--pb);
  pickup pencircle scaled 1pt;
  label.urt(btex $dl'$ etex, pal);

  drawarrow pa--palp withcolor black;
  label.urt(btex ${\bf x}'$ etex, .6[pa,palp]);
  drawarrow pa--pal withcolor black;
  label.ulft(btex ${\bf x}$ etex, .6[pa,pal]);
  drawarrow palp--pal withcolor black;
  label.top(btex ${\bf x}-{\bf x}'$ etex, (0u,0u))
    rotated (180 + angle (palp-pal)) shifted (.5[pal,palp]);
  label.bot(btex $|{\bf x}-{\bf x}'|$ etex, (0u,0u))
    rotated (180 + angle (palp-pal)) shifted (.5[pal,palp]);

  draw gammap withcolor black;
  draw gamma withcolor black;

endfig;
end
