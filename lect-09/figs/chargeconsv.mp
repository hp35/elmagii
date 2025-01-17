%
% MetaPost drawing of the charge conservation law.
%
% Copyright (C) 2024, Fredrik Jonsson
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;

  fill fullcircle shifted (0u,0u) scaled 2u withcolor .95[black,white];
  draw fullcircle shifted (0u,0u) scaled 2u;
  for phi = 0 step 45 until 359:
    drawarrow (6u*cosd(phi),6u*sind(phi))--(19u*cosd(phi),19u*sind(phi));
    label(btex $e^-$ etex,(24u*cosd(phi),24u*sind(phi)));
    dotlabel(btex etex,(21u*cosd(phi),21u*sind(phi)));
  endfor
  for phi = 22.5 step 45 until 359:
    drawarrow (14u*cosd(phi),14u*sind(phi))--(9u*cosd(phi),9u*sind(phi));
    label(btex ${\bf J}$ etex,(17u*cosd(phi),17u*sind(phi)));
  endfor
  draw fullcircle shifted (0u,0u) scaled 18u dashed evenly;
  label.urt(btex $q$ etex,(0.5u,0.5u));
  label.rt(btex
    $\displaystyle\nabla\cdot{\bf J}
      =-{{\partial\rho}\over{\partial t}}
    $ etex,(40u,18u));
  label.rt(btex
             \def\iint{\mathop{\int\kern-8pt\int}}
             \def\iiint{\mathop{\int\kern-8pt\int\kern-8pt\int}}
             \def\oiint{\mathop{\int\kern-8pt\int\kern-13.2pt{\bigcirc}}}
    $\displaystyle
      \Bigg(\hbox{Gauss}
        \Rightarrow
        \iiint\nabla\cdot{\bf J}\,dV
          \equiv\underbrace{\oiint{\bf J}\cdot d{\bf S}}_{\hbox{C/s}}
          =-\iiint{{\partial\rho}\over{\partial t}}\,dV
          =-{{\partial}\over{\partial t}}
              \underbrace{\iiint\rho\,dV}_{\hbox{``$q$'', C}}
      \Bigg)
    $ etex,(30u,0u));
  label.rt(btex $\displaystyle{{\partial\rho({\bf x},t)}\over{\partial t}}>0
     \qquad\Leftrightarrow\qquad\nabla\cdot{\bf J}({\bf x},t)<0$ etex,(40u,-18u));

endfig;
end
