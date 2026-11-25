%
% MetaPost drawing of an arbitrary wave traveling in the positive z-direction,
% following the general solution by the d'Alembert ansatz.
%
% Copyright (C) 2026, Fredrik Jonsson
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;
  label.urt(btex Fram{\aa}tpropagerande l{\"o}sning: etex,(-40u,46u));
  drawarrow (-20u,30u)--(80u,30u);
  label.urt(btex $z$ etex,(80u,30u));
  pickup pencircle scaled 1.5pt;
  draw (0u,30u){dir 0}..(20u,40u)..{dir -70}(30u,30u)..(40u,20u)
    ..{dir 50}(50u,30u)..{dir 0}(70u,30u);
  pickup pencircle scaled 1pt;
  drawarrow (20u,34u)--(35u,34u);
  label.urt(btex $c$ (m/s) etex,(35u,34u));
  label.top(btex $f(z-ct)$ etex,(20u,40u));

  label.urt(btex Bak{\aa}tpropagerande l{\"o}sning: etex,(-40u,16u));
  drawarrow (-20u,0u)--(80u,0u);
  label.urt(btex $z$ etex,(80u,0u));
  pickup pencircle scaled 1.5pt;
  draw (0u,0u){dir 0}..(20u,15u)..(30u,5u)..(40u,5u)
    ..{dir 20}(50u,-10u)..{dir 0}(70u,0u);
  pickup pencircle scaled 1pt;
  drawarrow (10u,4u)--(-10u,4u);
  label.urt(btex $c$ (m/s) etex,(-13u,4u));
  label.top(btex $g(z-ct)$ etex,(20u,16u));
endfig;
end
