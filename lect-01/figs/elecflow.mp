%
% MetaPost drawing of electric flow through a surface, including a displayed
% equation with the definition of electric flow.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;
  p := (-18u,-5u){dir 0}..{dir 0}(6u,-12u){dir 70}..{dir 70}(14u,1u){dir 180}
    ..{dir 180}(-6u,5u){dir 250}..{dir 250}(-18u,-5u)--cycle;
  fill p withcolor .975[black,white];
  draw p;

  %
  % First fieldline, counting from left.
  %
  p := (-17u,-14u)..{dir 90}(-10u,0u){dir 90}..(-17u,14u);
  drawarrow p withcolor black;
  ps := subpath (0.61,0.85) of p;
  draw ps withcolor gray;
  
  %
  % Second fieldline, counting from left.
  %
  p := (-10u,-20u)..{dir 90}(-5u,0u){dir 90}..(-10u,20u);
  drawarrow p withcolor black;
  ps := subpath (0.60,0.85) of p;
  draw ps withcolor gray;
  
  %
  % Third fieldline, counting from left.
  %
  p := (-3u,-22u)..{dir 90}(0u,0u){dir 90}..(-3u,22u);
  drawarrow p withcolor black;
  ps := subpath (0.53,0.85) of p;
  draw ps withcolor gray;
  
  %
  % Fifth fieldline, counting from left.
  %
  p := (6u,-23u)..{dir 90}(5u,0u){dir 90}..(6u,23u);
  drawarrow p withcolor black;
  ps := subpath (0.49,0.85) of p;
  draw ps withcolor gray;
  
  %
  % Fifth fieldline, counting from left.
  %
  p := (16u,-21u)..{dir 90}(10u,0u){dir 90}..(16u,21u);
  drawarrow p withcolor black;
  ps := subpath (0.78,0.85) of p;
  draw ps withcolor gray;
  
  %
  % Normal to the surface.
  %
  drawarrow (-14u,-4u)--(-18u,4u);
  draw (-14.5u,-3u)--(-13.5u,-2.5u)--(-13.0u,-3.5u);
  label.ulft(btex ${\bf n}$ etex,(-18u,4u));

  %
  % Definition of the electric flow.
  %
  label.top(btex ${\bf E}({\bf x})$ etex, (-9u,22u));
  label.lft(btex $A$ etex,(-18u,-4u));
  label.rt(btex
      \def\iint{\mathop{\int\kern-8pt\int}}
	$\displaystyle{\bf\Phi}_{\rm E}=\iint_A{\bf E}({\bf x})\cdot d{\bf A}$
	etex,(30u,14u));
    draw (30u,14u){dir 190}..{dir 190}(8u,-1u);
endfig;
end
