%
% MetaPost drawing of the analogy between potential energy and electrostatic
% potential.
%
% Copyright (C) 2022, Fredrik Jonsson
%
u = 1mm;
ll := 64u;
beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the path of a rolling ball.
  %
  draw (-10u,24u)--(0u,24u){dir 0}..{dir 20}(20u,14u)
    ..{dir 0}(40u,4u)--(50u,4u) withpen pencircle scaled 1.4pt;

  %
  % Draw the rolling ball as such, at z=h.
  %
  draw fullcircle scaled 4u shifted (0u,24u+2u);
  drawarrow (0u,24u+2u)--(10u,24u+2u);
  label.urt(btex $v_0$ etex, (10u,24u+2u));
  drawarrow (0u,24u+2u)--(0u,24u+2u-8u);
  label.bot(btex $F=mg$ etex, (0u,24u+2u-8u));

  %
  % Draw the rolling ball at z=0.
  %
  draw fullcircle scaled 4u shifted (46u,4u+2u);
  drawarrow (46u,4u+2u)--(56u,4u+2u);
  label.urt(btex $v=?$ etex, (56u,4u+2u));
  drawarrow (46u,4u+2u)--(46u,4u+2u-8u);
  label.bot(btex $F=mg$ etex, (46u,4u+2u-8u));

  % Draw coordinate system.
  %
  drawarrow (-18u,-10u)--(56u,-10u);         % x-axis
  label.urt(btex $x$ etex,(56u,-10u));     % x-axis
  drawarrow (-14u,-14u)--(-14u,36u);      % z-axis
  label.ulft(btex $z$ etex,(-14u,36u));  % z-axis
  draw (-15u,4u)--(-13u,4u); label.lft(btex $z=0$ etex,(-15u,4u));
  draw (-15u,24u)--(-13u,24u); label.lft(btex $z=h$ etex,(-15u,24u));
endfig;
end
