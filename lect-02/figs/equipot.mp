%
% MetaPost drawing of electric field lines always being orthogonal to a
% equipotential surface.
%
% Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p;
  pair pv, pn;
  pickup pencircle scaled 1pt;

  p:=(-30u,10u){dir 50}..(0u,4u)..{dir 30}(30u,0u);
  draw p;
  label.rt(btex
      \vbox{
        \hbox{$\phi({\bf x})=\hbox{konstant}$}
        \hbox{(Ekvipotentialyta)}
      } etex,(30u,0u));

  %
  % Define the parameter values where the arrows are to appear.
  %
  numeric t[];
  t1 := 0.1; t2 := 0.4; t3 := 0.7; t4 := 1.0; t5 := 1.3; t6 := 1.6; t7 := 1.9;

  vardef normal_arrow(expr tt) =
    save pp,t,n,ppt,ppn;
    pair pp,t,n,ppt,ppn;
    numeric ll, a;
    ll:=10u;                             % Arrow length
    a:=1.6u;                             % Right-angle marker size
    pp := point tt of p;                 % Base point along path
    t := unitvector(direction tt of p);  % Unit tangent at base point
    n := t rotated 90;                   % Unit normal at base point
    drawarrow pp -- (pp + ll*n);         % Orthogonal arrow at base point
    ppt := pp + a*t;
    ppn := pp + a*n;
    draw ppt -- (ppt + a*n);             % Draw right-angle markers
    draw ppn -- (ppn + a*t);             % Draw right-angle markers
  enddef;

  %
  % Draw the arrows corresponding to the local field lines of the
  % electric field.
  %
  normal_arrow(t1);
  normal_arrow(t2);
  normal_arrow(t3);
  normal_arrow(t4);
  normal_arrow(t5);
  normal_arrow(t6);
  normal_arrow(t7);

  tt := t2;
  pv := point tt of p;
  pn := (unitvector(direction tt of p)) rotated 90;
  label.rt(btex ${\bf E}({\bf x})=-\nabla\phi({\bf x})$ etex,pv+ll*pn);
  
endfig;
end
