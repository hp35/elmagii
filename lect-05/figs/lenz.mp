%
% MetaPost drawing of a set of eight geometries and thought-experients
% concerning the interpretation of Lenz law and how to sanity-check
% results in induction problems.
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

vardef drawmagnet(expr posm)=
  begingroup
    wm:=12u; hm:=5u;
    fill ((0u,-hm/2)--(wm/2,-hm/2)--(wm/2,hm/2)--(0u,hm/2)--cycle)
      shifted posm withcolor .85[black,white];
    draw ((-wm/2,-hm/2)--(wm/2,-hm/2)--(wm/2,hm/2)--(-wm/2,hm/2)--cycle)
      shifted posm;
    draw ((0u,-hm/2)--(0u,hm/2)) shifted posm;
    label(btex S etex,(-wm/4,0u) shifted posm);
    label(btex N etex,(wm/4,0u) shifted posm);
  endgroup
enddef;

beginfig(1);
  path wire, loop, endwave;
  pair pos;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;

  % Loop and wire parameters.
  %
  r:=7u; dr:=4u; ll:=40u;

  %
  % First gedanken experiment.
  %
  pos:=(-50u,0u);
  label.top(btex {\bf Tankeexperiment~1} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  loop := fullcircle scaled (2r) shifted (0u,r+dr) shifted pos;
  draw wire withcolor black;
  endwave := (0u,-2u){dir 50}..{dir 50}(0u,2u);
  draw endwave shifted (ll/2,0u) shifted pos;
  draw endwave shifted (-ll/2,0u) shifted pos;
  drawtexarrow subpath (0.3,0.4) of wire;
  label.lrt(btex $I_0=\hbox{konst.}$ etex, point 0.4 of wire);
  draw loop withcolor black;
  drawarrow ((0u,1u)--(0u,5u)) shifted (pos+(0,2r+dr)) withcolor black;
  label.rt(btex ${\bf v}_{\rm loop}$ etex,(0u,5u) shifted (pos+(0u,2r+dr)));
  drawtexarrow subpath (0.9,1.0) of loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 1.0 of loop);
%  label.top(btex \vbox{
%      \hbox{Question: Direction of}
%      \hbox{induced current $I_{\rm loop}$?}} etex, pos shifted (0u,24u));
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));

  %
  % Second gedanken experiment.
  %
  pos:=(0u,0u);
  label.top(btex {\bf Tankeexperiment~2} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  loop := fullcircle scaled (2r) shifted (0u,r+dr) shifted pos;
  draw wire withcolor black;
  endwave := (0u,-2u){dir 50}..{dir 50}(0u,2u);
  draw endwave shifted (ll/2,0u) shifted pos;
  draw endwave shifted (-ll/2,0u) shifted pos;
  drawtexarrow subpath (0.3,0.4) of wire;
  label.lrt(btex $I_0=\hbox{konst.}$ etex, point 0.4 of wire);
  draw loop withcolor black;
  drawarrow ((1u,0u)--(8u,0u)) shifted (pos+(r,r+dr)) withcolor black;
  label.urt(btex ${\bf v}_{\rm loop}$ etex,(8u,0u) shifted (pos+(r,r+dr)));
  drawtexarrow subpath (0.9,1.0) of loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 1.0 of loop);
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));

  %
  % Third gedanken experiment.
  %
  pos:=(50u,0u);
  label.top(btex {\bf Tankeexperiment~3} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  endwave := (0u,-2u){dir 50}..{dir 50}(0u,2u);
  draw endwave shifted (ll/2,0u) shifted pos;
  draw endwave shifted (-ll/2,0u) shifted pos;
  loop := fullcircle scaled (2r) shifted (0u,r+dr) shifted pos;
  draw wire withcolor black;
  drawtexarrow subpath (0.2,0.3) of wire;
  label.lrt(btex $I(t)\hbox{ (increasing)}$ etex, point 0.3 of wire);
  draw loop withcolor black;
  drawtexarrow subpath (0.9,1.0) of loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 1.0 of loop);
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));

  %
  % Fourth gedanken experiment.
  %
  pos:=(-50u,-60u);
  label.top(btex {\bf Tankeexperiment~4} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  endwave := (0u,-2u){dir 50}..{dir 50}(0u,2u);
  draw endwave shifted (ll/2,0u) shifted pos;
  draw endwave shifted (-ll/2,0u) shifted pos;
  loop := ((0u,0u){dir 60}..(r,r)..(2r,0u)..(r,-r)..(0u,0u)
      ..(-r,r)..(-2r,0u)..(-r,-r)..{dir 60}(0u,0u))
    shifted (0u,r+dr) shifted pos;
  draw loop withcolor black;
  pickup pencircle scaled 6pt;
  draw subpath (3.8,4.2) of loop withcolor 1[black,white];
  pickup pencircle scaled 1pt;
  draw subpath (3.5,4.5) of loop withcolor black;
  drawarrow ((0u,1u)--(0u,9u)) shifted (pos+(0,r+dr+2u)) withcolor black;
  label.ulft(btex ${\bf v}_{\rm loop}$ etex,(0u,5u) shifted (pos+(0u,r+dr+2u)));
  draw wire withcolor black;
  drawtexarrow subpath (0.2,0.3) of wire;
  label.lrt(btex $I(t)\hbox{ (increasing)}$ etex, point 0.3 of wire);
  drawtexarrow subpath (6.0,6.7) of reverse loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 6.7 of reverse loop);
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));

  %
  % Fifth gedanken experiment.
  %
  pos:=(0u,-60u);
  label.top(btex {\bf Tankeexperiment~5} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  endwave := (0u,-2u){dir 50}..{dir 50}(0u,2u);
  draw endwave shifted (ll/2,0u) shifted pos;
  draw endwave shifted (-ll/2,0u) shifted pos;
  loop := ((0u,0u){dir 60}..(r,r)..(2r,0u)..(r,-r)..(0u,0u)
      ..(-r,r)..(-2r,0u)..(-r,-r)..{dir 60}(0u,0u))
    shifted (0u,r+dr) shifted pos;
  draw loop withcolor black;
  pickup pencircle scaled 6pt;
  draw subpath (3.8,4.2) of loop withcolor 1[black,white];
  pickup pencircle scaled 1pt;
  draw subpath (3.5,4.5) of loop withcolor black;
  drawarrow ((1u,0u)--(8u,0u)) shifted (pos+(2r,r+dr)) withcolor black;
  label.urt(btex ${\bf v}_{\rm loop}$ etex,(8u,0u) shifted (pos+(r,r+dr)));
  draw wire withcolor black;
  drawtexarrow subpath (0.2,0.3) of wire;
  label.lrt(btex $I(t)\hbox{ (increasing)}$ etex, point 0.3 of wire);
  drawtexarrow subpath (6.0,6.7) of reverse loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 6.7 of reverse loop);
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));

  %
  % Sixth gedanken experiment.
  %
  pos:=(50u,-60u);
  label.top(btex {\bf Tankeexperiment~6} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  endwave := (0u,-2u){dir 50}..{dir 50}(0u,2u);
  draw endwave shifted (ll/2,0u) shifted pos;
  draw endwave shifted (-ll/2,0u) shifted pos;
  loop := ((0u,0u){dir 60}..(r/2,r/2)..(r,0u)..(r/2,-r/2)..(0u,0u)
      ..(-r,r)..(-2r,0u)..(-r,-r)..{dir 60}(0u,0u))
    shifted (0u,r+dr) shifted pos;
  draw loop withcolor black;
  pickup pencircle scaled 6pt;
  draw subpath (3.8,4.2) of loop withcolor 1[black,white];
  pickup pencircle scaled 1pt;
  draw subpath (3.5,4.5) of loop withcolor black;
  drawarrow ((0u,1u)--(0u,9u)) shifted (pos+(0,r+dr+2u)) withcolor black;
  label.ulft(btex ${\bf v}_{\rm loop}$ etex,(0u,5u) shifted (pos+(0u,r+dr+2u)));
  draw wire withcolor black;
  drawtexarrow subpath (0.2,0.3) of wire;
  label.lrt(btex $I(t)\hbox{ (increasing)}$ etex, point 0.3 of wire);
  drawtexarrow subpath (6.0,6.7) of reverse loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 6.7 of reverse loop);
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));

  %
  % Seventh gedanken experiment.
  %
  pos:=(-35u,-120u);
  label.top(btex {\bf Tankeexperiment~7} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  loop := fullcircle scaled (2r) shifted (0u,r+dr) shifted pos;
  draw loop withcolor black;
  drawarrow ((1u,0u)--(8u,0u)) shifted (pos+(r,r+dr)) withcolor black;
  label.urt(btex ${\bf v}_{\rm loop}$ etex,(8u,0u) shifted (pos+(r,r+dr)));
  drawmagnet(pos shifted (-16u,r+dr));
  drawtexarrow subpath (0.9,1.0) of loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 1.0 of loop);
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));
%  label.bot(btex \vbox{
%      \hbox{{\it What if the stationary magnet}}
%      \hbox{{\it is in the plane of the loop?}}} etex, pos shifted (0u,0u));
  label.bot(btex \vbox{
      \hbox{{\it Vad h{\"a}nder om den station{\"a}ra}}
      \hbox{{\it magneten befinner sig i samma}}
      \hbox{{\it plan som slingan?}}
      } etex, pos shifted (0u,0u));

  %
  % Eighth gedanken experiment.
  %
  pos:=(35u,-120u);
  label.top(btex {\bf Tankeexperiment~8} etex, pos shifted (0u,34u));
  wire:=((-ll/2,0u)--(ll/2,0u)) shifted pos;
  loop := ((0u,0u){dir 60}..(r,r)..(2r,0u)..(r,-r)..(0u,0u)
      ..(-r,r)..(-2r,0u)..(-r,-r)..{dir 60}(0u,0u))
    shifted (0u,r+dr) shifted pos;
  draw loop withcolor black;
  pickup pencircle scaled 6pt;
  draw subpath (3.8,4.2) of loop withcolor 1[black,white];
  pickup pencircle scaled 1pt;
  draw subpath (3.5,4.5) of loop withcolor black;
  drawarrow ((1u,0u)--(8u,0u)) shifted (pos+(2r,r+dr)) withcolor black;
  label.urt(btex ${\bf v}_{\rm loop}$ etex,(8u,0u) shifted (pos+(r,r+dr)));
  drawmagnet(pos shifted (-23u,r+dr));
  drawtexarrow subpath (6.0,6.7) of reverse loop withcolor black;
  label.urt(btex $I_{\rm loop}=$? etex, point 6.7 of reverse loop);
  label.top(btex \vbox{
      \hbox{Fr{\aa}ga: Vad {\"a}r riktningen f{\"o}r}
      \hbox{inducerade str{\"o}mmen $I_{\rm loop}$?}
      } etex, pos shifted (0u,24u));
%  label.bot(btex \vbox{
%      \hbox{{\it What if the stationary magnet}}
%      \hbox{{\it is in the plane of the loop?}}} etex, pos shifted (0u,0u));
  label.bot(btex \vbox{
      \hbox{{\it Vad h{\"a}nder om den station{\"a}ra}}
      \hbox{{\it magneten befinner sig i samma}}
      \hbox{{\it plan som slingan?}}
      } etex, pos shifted (0u,0u));

endfig;
end
