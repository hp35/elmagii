%
% MetaPost drawing of our World Map of Classical Electromagnetics, and how
% Coulomb's law together with Biot-Savart's law and the Lorentz force,
% interlinked with constitutive relations, result in Maxwell's equations,
% finally producing the electromagnetic wave equation.
%
% Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
%
% input TEX;
u := 1mm;

%
% Macro for drawing the boxes of electromagnetic theorems and relations.
%
vardef drawbox(expr eqn, labeltext, cpos, w, h, r, lectno) =
  begingroup
    pair p[];
    path box;
    xc := xpart cpos;        % X-coordinate of centre position
    yc := ypart cpos;        % Y-coordinate of centre position
    wh := w/2;               % Half-width of box
    hh := h/2;               % Half-height of box
    p1 := (xc-wh+r, yc-hh);
    p2 := (xc+wh-r, yc-hh);
    p3 := (xc+wh, yc-hh+r);
    p4 := (xc+wh, yc+hh-r);
    p5 := (xc+wh-r, yc+hh);
    p6 := (xc-wh+r, yc+hh);
    p7 := (xc-wh, yc+hh-r);
    p8 := (xc-wh, yc-hh+r);
    box := p1--p2{dir 0}..{dir 90}p3
              --p4{dir 90}..{dir 180}p5
              --p6{dir 180}..{dir 270}p7
              --p8{dir 270}..{dir 0}p1--cycle;
    pickup pencircle scaled .7pt;
    draw box;
    label.bot(labeltext, (xc,yc+hh));
    label(eqn, (xc,yc-1.5u));
    label(lectno,(xc+wh-r,yc+hh-r));
    draw fullcircle scaled 3.6u shifted (xc+wh-r,yc+hh-r);
    pickup pencircle scaled 1pt;
  endgroup
enddef;

%
% Macro for drawing the connectors between the boxes of electromagnetic
% theorems and relations.
%
vardef connect(expr posa, posb, ha, hb, da, db) =
  begingroup
    drawarrow (posa shifted (0u,-ha/2)){dir da}
      ..{dir db}(posb shifted (0u,hb/2));
  endgroup
enddef;

beginfig(1);
  path p;
  pair poscoulombforce, poscoulombgen, posscalpot,
    posscalarpotential, posbiotsavarti, posbiotsavartj,
    poslorentzforce, posgaussintegral, posgaussdifferential, pospoisson;
  ws := 52u;  % Standard box width
  hs := 12u;  % Standard box height
  rs := 3u;   % Standard corner rounding
  dxb:=60u;   % Pitch between boxes along x-axis
  dyb:=18u;   % Pitch between boxes along y-axis
  pickup pencircle scaled 1pt;

  %
  % Coulomb's force law.
  %
  poscoulombforce:=(0u,0u);
  drawbox(btex $
      {\bf F}={{q q'}\over{4\pi\varepsilon_0}}
          {{({\bf x}-{\bf x}')}\over{|{\bf x}-{\bf x}'|^3}}
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Coulombs kraftlag} etex,
      poscoulombforce, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{1} etex);
  pickup pencircle scaled .7pt;
  draw fullcircle scaled 4u shifted (-3.1u,-2.95u) withcolor red;
  pickup pencircle scaled 1pt;

  %
  % Coulomb's generalized law.
  %
  poscoulombgen:=(0u,-dyb);
  drawbox(btex $
      \def\iiint{\mathop{\int\kern-5pt\int\kern-5pt\int}}
      {\bf E}({\bf x})={{1}\over{4\pi\varepsilon_0}}\iiint%_V
      \rho({\bf x}')
          {{({\bf x}-{\bf x}')}
            \over{|{\bf x}-{\bf x}'|^3}}\,dV'
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Coulombs generaliserade lag} etex,
      poscoulombgen, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{1} etex);
  pickup pencircle scaled .7pt;
  draw fullcircle scaled 4u shifted (-6.75u,-.5u) shifted (dxb,0) withcolor red;
  pickup pencircle scaled 1pt;

  %
  % Existence of a scalar potential, derived from the form of Coulomb's
  % generalized law.
  %
  posscalarpotential:=(0u,-2dyb);
  drawbox(btex ${\bf E}=-\nabla\phi$ etex,
      btex \font\labelfont=cmssi8
      \font\eightsy=cmsy8
      \labelfont{Existens av skal{\"a}r potential $\eightsy\phi$} etex,
      posscalarpotential, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{1} etex);

  %
  % Explicit integral solution for the electrostatic potential.
  %
  posscalpot:=(0u,-3dyb);
  drawbox(btex $
      \def\iiint{\mathop{\int\kern-5pt\int\kern-5pt\int}}
      \phi({\bf x})\equiv{{1}\over{4\pi\varepsilon_0}}\iiint%_V
          {{\rho({\bf x}')}
            \over{|{\bf x}-{\bf x}'|}}\,dV'
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Elektrostatisk potential} etex,
      posscalpot, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{1} etex);

  %
  % Gauss' law in integral form.
  %
  %  \def\oiintop{%
  %    \vcenter{%
  %      \offinterlineskip
  %      \halign{##\cr
  %        \hfil$\scriptscriptstyle\circ$\hfil\cr
  %        \noalign{\kern-0.6ex}
  %        $\displaystyle\iint$\cr
  %      }%
  %    }%
  %  }
  %  \def\oiint{\mathop{\oiintop}\displaylimits}
  %
  posgaussintegral:=(0u,-4dyb);
  drawbox(btex $
      \def\iiint{\mathop{\int\kern-5pt\int\kern-5pt\int}}
      \def\oiint{\mathop{\int\kern-5pt\int\kern-10.7pt%
        {\scriptstyle\bigcirc}\kern2pt}}
      \oiint {\bf E}({\bf x}')\cdot d{\bf S}'
         ={{1}\over{\varepsilon_0}}\iiint\rho({\bf x}')\,dV'
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Gauss lag p{\aa} integralform} etex,
      posgaussintegral, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{1} etex);

  %
  % Gauss' law in differential form.
  %
  posgaussdifferential:=(0u,-5dyb);
  drawbox(btex $\nabla\cdot{\bf E}=\rho/\varepsilon_0$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Gauss lag p{\aa} differentialform} etex,
      posgaussdifferential, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{1} etex);

  %
  % Poisson's equation in differential form.
  %
  pospoisson:=(0u,-6dyb);
  drawbox(btex $\nabla^2\phi=-\rho/\varepsilon_0$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Poissons ekvation, skal{\"a}r pot.} etex,
      pospoisson, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{2} etex);

  %
  % Biot--Savart's law.
  %
  posbiotsavarti:=(dxb,0u);
    drawbox(btex $
          {\bf B}({\bf x})={{\mu_0}\over{4\pi}}\int%^{{\bf x}_b}_{{\bf x}_a}
          {{{\bf I}({\bf x}')\times({\bf x}-{\bf x}')}
            \over{|{\bf x}-{\bf x}'|^3}}\,dl'
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Biot--Savarts lag} etex,
      posbiotsavarti, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{4} etex);

  %
  % Biot--Savart's law for current densities.
  %
  posbiotsavartj:=(dxb,-dyb);
    drawbox(btex $
          \def\iiint{\mathop{\int\kern-5pt\int\kern-5pt\int}}
          {\bf B}({\bf x})={{\mu_0}\over{4\pi}}\iiint
          {{{\bf J}({\bf x}')\times({\bf x}-{\bf x}')}
            \over{|{\bf x}-{\bf x}'|^3}}\,dV'
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Biot--Savarts lag, str{\"o}mt{\"a}thet} etex,
      posbiotsavartj, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{4} etex);

  %
  % The Lorentz force, fundamental and independent of the laws of Coulomb
  % and Biot--Savart.
  %
  poslorentzforce:=(2*dxb,0u);
    drawbox(btex ${\bf F}=q({\bf E}+{\bf v}\times{\bf B})$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Lorentz kraftlag} etex,
      poslorentzforce, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{4} etex);

  connect(poscoulombforce, poscoulombgen, hs, hs, 270, 270);
  connect(poscoulombgen, posscalarpotential, hs, hs, 270, 270);

endfig;
end
