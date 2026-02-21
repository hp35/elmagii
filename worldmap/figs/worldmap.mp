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
% Employing the TeX-arrow package by Tommy Ekola.
%
input ../macros/cmarrows/cmarrows.mp
setup_cmarrows(
  arrow_name = "texarrow";
  parameter_file = "cmr12.mf";
  macro_name = "drawtexarrow");

%
% Macro for drawing the boxes of electromagnetic theorems and relations.
%
vardef drawbox(expr eqn, labeltext, cpos, w, h, r, lectno) =
  begingroup
    pair p[];
    path box;
    xc := xpart cpos;        % X-coordinate of centre position of box
    yc := ypart cpos;        % Y-coordinate of centre position of box
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
    draw fullcircle scaled 3.8u shifted (xc+wh-r,yc+hh-r);
    pickup pencircle scaled 1pt;
  endgroup
enddef;

%
% Macro for drawing the connectors between the boxes of electromagnetic
% theorems and relations.
%
vardef connect(expr posa, posb, ha, hb, da, db) =
  begingroup
    boolean use_texarrows;
    use_texarrows := true;
    if use_texarrows:
      drawtexarrow (posa shifted (0u,-ha/2)){dir da}
        ..{dir db}(posb shifted (0u,hb/2));
    else:
      drawarrow (posa shifted (0u,-ha/2)){dir da}
        ..{dir db}(posb shifted (0u,hb/2));
    fi
  endgroup
enddef;

%
% Macro for drawing a labeled dashed box for compilation of boxes.
%
vardef drawlabeledbox(expr labeltext, cpos, w, h, r) =
  begingroup
    pair p[];
    path box;
    xc := xpart cpos;        % X-coordinate of centre position of box
    yc := ypart cpos;        % Y-coordinate of centre position of box
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
    draw box dashed evenly;
    label.top(labeltext, (xc,yc+hh));
    pickup pencircle scaled 1pt;
  endgroup
enddef;

beginfig(1);
  path p;
  pair poscoulombforce, poscoulombgen, posscalpot,
    posscalarpotential, posbiotsavarti, posbiotsavartj,
    posmagmonopoles, posampere, posvecpot, posamperepot, posamperepotint,
    poslorentzforce, posfaradayinduc, posfaradaylaw, posneumann,
    posmultipole, posdipoleapprox,
    poscontinuity, posdispcurr, poselecpoldens, poselecdispfield,
    posmagnetiz, posmagfieldstrength, possurfcurr,
    posmaxwelldifferential, posmaxwellintegral, poselecwaveeq,
    posplanewaveexp, posdalembert,
    posgaussintegral, posgaussdifferential, pospoisson, posmirrorcharges,
    posretardedpots, posgauge;
  ws := 52u;  % Standard box width
  hs := 12u;  % Standard box height
  rs := 3u;   % Standard corner rounding, radius
  dxb:=62u;   % Pitch between boxes along x-axis % 60u
  dyb:=16u;   % Pitch between boxes along y-axis
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
  draw fullcircle scaled 4u shifted (-0.1u,-3.1u) withcolor red;
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
      {Skal{\"a}r potential, integrall{\"o}sning} etex,
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
      {Poissons ekv., skal{\"a}r potential} etex,
      pospoisson, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{2} etex);

  %
  % Poisson's equation in differential form.
  %
  posmirrorcharges:=(0u,-7dyb);
  drawbox(btex
      \font\textfont=cmss8\textfont
      \hskip-10pt
      \vbox{
        \hbox{- Entydighetsteoremet, extremv{\"a}rden}
	\vskip-2pt
        \hbox{- Spegelladdningar}
      }
      etex,
      btex \font\labelfont=cmssi8\labelfont
      {Spegelladdningar} etex,
      posmirrorcharges, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{3} etex);

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
  % The divergence theorem for magnetostatics, allowing us to draw the
  % conclusion that magnetic monopoles do not exist.
  %
  posmagmonopoles:=(dxb,-2dyb);
    drawbox(btex $\nabla\cdot{\bf B}({\bf x})=0$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Ingen magnetisk laddning} etex,
      posmagmonopoles, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{4} etex);

  %
  % Ampere's law.
  %
  posampere:=(dxb,-3dyb);
    drawbox(btex $\nabla\times{\bf B}({\bf x})=\mu_0{\bf J}_{\rm f}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Amp\`eres lag} etex,
      posampere, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{4} etex);

  %
  % Existence of a vector potential.
  %
  posvecpot:=(dxb,-4dyb);
    drawbox(btex ${\bf B}({\bf x})=\nabla\times{\bf A}({\bf x})$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Vektorpotential} etex,
      posvecpot, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{4} etex);

  %
  % Amp\`eres law for the vactor potential.
  %
  posamperepot:=(dxb,-5dyb);
    drawbox(btex $\nabla^2{\bf A}({\bf x})=-\mu_0{\bf J}_{\rm f}({\bf x})$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Amp\`eres lag, vektorpotential} etex,
      posamperepot, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{4} etex);

  %
  % Explicit integral solution for the vactor potential.
  %
  posamperepotint:=(dxb,-6dyb);
    drawbox(btex $
            \def\iiint{\mathop{\int\kern-5pt\int\kern-5pt\int}}
            {\bf A}({\bf x})={{\mu_0}\over{4\pi}}
	    \iiint{{{\bf J}_{\rm f}({\bf x}')}\over{|{\bf x}-{\bf x}'|}}\,dV'$
	    etex,
      btex \font\labelfont=cmssi8\labelfont
      {Vektorpotential, integrall{\"o}sning} etex,
      posamperepotint, ws, hs, rs,
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

  %
  % Faraday's law of induction.
  %
  posfaradayinduc:=(2*dxb,-dyb);
    drawbox(btex ${\cal E}=-{{d\Phi_{\rm M}}/{dt}}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Faradays induktionslag} etex,
      posfaradayinduc, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{5} etex);

  %
  % Faraday's law.
  %
  posfaradaylaw:=(2*dxb,-2dyb);
    drawbox(btex $\nabla\times{\bf E}({\bf r},t)
                   =-{{\partial{\bf B}({\bf x},t)}\over{\partial t}}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Faradays lag} etex,
      posfaradaylaw, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{5} etex);

  %
  % Mutual inductance.
  %
%  posneumann:=(2*dxb,-3dyb);
%    drawbox(btex $M_{\Gamma\Gamma'}={{\mu_0}\over{4\pi}}
%          \oint_{\Gamma}\oint_{\Gamma'}
%          {{d{\bf l}'\cdot d{\bf l}}\over{|{\bf x}-{\bf x}'|}}$ etex,
%      btex \font\labelfont=cmssi8\labelfont
%      {{\"O}msesidig induktans, Neumann} etex,
%      posneumann, ws, hs, rs,
%      btex \font\labelfont=cmssi8\labelfont{5} etex);
  posneumann:=(2*dxb+(0.25/2)*ws,-3dyb);
    drawbox(btex $M_{\Gamma\Gamma'}={{\mu_0}\over{4\pi}}
          \oint_{\Gamma}\oint_{\Gamma'}
          {{d{\bf l}'\cdot d{\bf l}}\over{|{\bf x}-{\bf x}'|}}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {{\"O}msesidig induktans} etex,
      posneumann, ws-0.25ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{5} etex);

  %
  % Continuity equation for electric charge.
  %
  poscontinuity:=(2*dxb,-4dyb);
    drawbox(btex $\nabla\cdot{\bf J}=-{{\partial\rho}\over{\partial t}}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Kontinuitetsekvation f{\"o}r laddning} etex,
      poscontinuity, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{5} etex);

  %
  % The displacement current.
  %
  posdispcurr:=(2*dxb,-5dyb);
    drawbox(btex ${\bf J}_{\rm tot}={\bf J}_{\rm f}
                      +{{\partial{\bf D}}\over{\partial t}}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {F{\"o}rskjutningsstr{\"o}m} etex,
      posdispcurr, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{5} etex);

  connect(poscoulombforce, poscoulombgen, hs, hs, 270, 270);
  connect(poscoulombgen, posscalarpotential, hs, hs, 270, 270);

  %
  % Electric polarization density.
  %
  poselecpoldens:=(0*dxb,-8.5dyb);
    drawbox(btex ${\bf P} \equiv \big\langle{{d{\bf p}}\over{dV}}\big\rangle
      = \varepsilon_0\chi_{\rm e}{\bf E}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Elektrisk polarisationsdensitet} etex,
      poselecpoldens, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{6} etex);

  %
  % Electric displacement field.
  %
  poselecdispfield:=(0*dxb,-9.5dyb);
    drawbox(btex ${\bf D}\equiv\varepsilon_0{\bf E}+{\bf P}
        % =\varepsilon_0(1+\chi_{\rm e}){\bf E}
        =\varepsilon_0\varepsilon_{\rm r}{\bf E}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Elektrisk fl{\"o}dest{\"a}thet} etex,
      poselecdispfield, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{6} etex);

  %
  % Magnetization.
  %
  posmagnetiz:=(0*dxb,-10.5dyb);
    drawbox(btex ${\bf M}\equiv\big\langle{{d{\bf m}}\over{dV}}\big\rangle
      = {{1}\over{\mu_0}}\Big(1-{{1}\over{\mu_{\rm r}}}\Big){\bf B}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Magnetisering} etex,
      posmagnetiz, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{7} etex);

  %
  % Magnetic field strength.
  %
  posmagfieldstrength:=(0*dxb,-11.5dyb);
    drawbox(btex $ {\bf H}\equiv{{\bf B}\over{\mu_0}}-{\bf M}
      % ={{\bf B}\over{\mu_0\mu_{\rm r}}}
      \ \Leftrightarrow\ 
      {\bf B}=\mu_0\mu_{\rm r}{\bf H}$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Magnetisk f{\"a}ltstyrka} etex,
      posmagfieldstrength, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{7} etex);

  %
  % Surface and volume currents.
  %
  possurfcurr:=(0*dxb,-12.5dyb);
    drawbox(btex ${\bf J}_{\rm b}=\nabla\times{\bf M}$,\quad
                 ${\bf K}_{\rm b}={\bf M}\times{\bf e}_n$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Bundnda yt- och volymstr{\"o}mmar} etex,
      possurfcurr, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{7} etex);

  %
  % Multipole expansion of fields.
  %
  posmultipole:=(1*dxb,-8.0dyb);
    drawbox(btex
        \vbox{
          \hbox{$\phi({\bf x})={{1}\over{4\pi\varepsilon_0}}
            \big({{1}\over{|{\bf x}|}}q+\sum_k{{x_k}\over{|{\bf x}|^3}}p_k$}
          \hbox{\hskip20pt$+{{1}\over{2}}\sum_j\sum_k
            {{(3 x_j x_k - \delta_{jk}|{\bf x}|^2)}\over{|{\bf x}|^5}}Q_{jk}$}
          \hbox{\hskip20pt$+\ldots\big)$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
      \hskip-10pt{Monopol, dipol, kvadrupol, oktopol} etex,
      posmultipole, ws, 2*hs, rs,
      btex \font\labelfont=cmssi8\labelfont{8} etex);

  %
  % The dipole approximation.
  %
  posdipoleapprox:=(1*dxb,-9.5dyb);
    drawbox(btex
        \vbox{
          \hbox{$\phi({\bf x})\approx{{1}\over{4\pi\varepsilon_0}}\big(
              {{q}\over{|{\bf x}|}}
	        +{{{\bf p}\cdot{\bf x}}\over{|{\bf x}|^3}}\big)$}
          \hbox{${\bf A}({\bf x})\approx{{\mu_0}\over{4\pi}}
              {{{\bf m}\times{\bf x}}\over{|{\bf x}|^3}}$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
      {Dipolapproximationen} etex,
      posdipoleapprox, ws, 1.4*hs, rs,
      btex \font\labelfont=cmssi8\labelfont{8} etex);

  %
  % Maxwell's equations in integral form.
  %
  posmaxwellintegral:=(2dxb,-7dyb);
    drawbox(btex
        \def\iiint{\mathop{\int\kern-5pt\int\kern-5pt\int}}
        \def\iint{\mathop{\int\kern-5pt\int}}
        \def\oiint{\mathop{\int\kern-5pt\int\kern-10.7pt%
          {\scriptstyle\bigcirc}\kern2pt}}
        \vbox{
          \hbox{$\oiint{\bf D}\cdot d{\bf S}=\iiint\rho\,dV$}
          \hbox{$\oiint{\bf B}\cdot d{\bf S}=0$}
          \hbox{$\oint{\bf E}\cdot d{\bf l}
               =-{{\partial}\over{\partial t}}\iint{\bf B}\cdot d{\bf S}$}
          \hbox{$\oint{\bf H}\cdot d{\bf l}=\iint\big({\bf J}_{\rm f}
               +{{\partial{\bf D}}\over{\partial t}}\big)\cdot d{\bf S}$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
      {Maxwells ekvationer, int.form} etex,
      posmaxwellintegral, ws, 2*hs, rs,
      btex \font\labelfont=cmssi8\labelfont{9} etex);

  %
  % Maxwell's equations in differential form.
  %
  posmaxwelldifferential:=(2dxb, ypart posmaxwellintegral-1dyb-0.75hs);
    drawbox(btex
        \vbox{
          \hbox{$\nabla\times{\bf E}
                    =-{{\partial{\bf B}}\over{\partial t}}$,\hskip19pt
                $\nabla\cdot{\bf D}=\rho$}
          \hbox{$\nabla\times{\bf H}={\bf J}_{\rm f}
                    +{{\partial{\bf D}}\over{\partial t}}$,\
                $\nabla\cdot{\bf B}=0$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
      {Maxwells ekvationer, diff.form} etex,
      posmaxwelldifferential, ws, 1.5*hs, rs,
      btex \font\labelfont=cmssi8\labelfont{9} etex);

  %
  % The electromagnetic wave equations for the electric (E) and
  % magnetic (B) fields, as derived from Maxwell's equations.
  %
  poselecwaveeq:=(2dxb, ypart posmaxwelldifferential-dyb-0.85hs);
    drawbox(btex
        \vbox{
          \hbox{$\nabla\times\nabla\times{\bf E}
                  +{{1}\over{c^2}}{{\partial^2{\bf E}}\over{\partial t^2}}$}
          \hbox{\hskip10pt$=-\mu_0{{\partial}\over{\partial t}}
                   \big({\bf J}_{\rm f}
                       +{{\partial{\bf P}}\over{\partial t}}
                       +\nabla\times{\bf M}
                   \big)$}
          \vskip4pt
          \hbox{$\nabla\times\nabla\times{\bf B}
                  +{{1}\over{c^2}}{{\partial^2{\bf B}}\over{\partial t^2}}$}
          \hbox{\hskip10pt$=\mu_0\nabla\times
                   \big({\bf J}_{\rm f}
                       +{{\partial{\bf P}}\over{\partial t}}
                       +\nabla\times{\bf M}
                   \big)$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
        {Elektromagnetiska v{\aa}gekvationer}
      etex,
      poselecwaveeq, ws, 2.2*hs, rs,
      btex \font\labelfont=cmssi8\labelfont{9} etex);

  %
  % D'Alembert solution for traveling waves.
  %
  posdalembert:=(2*dxb, ypart poselecwaveeq -1dyb-0.6hs);
    drawbox(btex $E(z,t)=f(z-ct)+g(z+ct)$ etex,
      btex \font\labelfont=cmssi8\labelfont
      {D'Alemberts l{\"o}sningsmetod} etex,
      posdalembert, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{10} etex);

  %
  % Plane wave expansion of electromagnetic waves.
  %
  posplanewaveexp:=(2*dxb, ypart posdalembert-1dyb-0.2hs);
    drawbox(btex
        \def\Re{\mathop{\rm Re}\nolimits}
        \vbox{
          \hbox{${\bf E}=\sum_{\bf k}
            \Re[{\bf E}_{\bf k}\exp(i{\bf k}\cdot{\bf x}-i\omega t)]$}
          \hbox{${\bf B}=\sum_{\bf k}
            \Re[{\bf B}_{\bf k}\exp(i{\bf k}\cdot{\bf x}-i\omega t)]$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
      {Planv{\aa}guppdelning av f{\"a}lt} etex,
      posplanewaveexp, ws, 1.4*hs, rs,
      btex \font\labelfont=cmssi8\labelfont{10} etex);

  %
  % The gauge transformation in electrodynamics.
  %
  posgauge:=(1dxb,-11.2dyb);
    drawbox(btex
        \vbox{
          \hbox{$\phi'({\bf x},t)=\phi({\bf x},t)
                  -{{\partial\psi({\bf x},t)}\over{\partial t}}$}
          \hbox{${\bf A}'({\bf x},t)={\bf A}({\bf x},t)+\nabla\psi({\bf x},t)$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
        {Gauge-transformation}
      etex,
      posgauge, ws, hs, rs,
      btex \font\labelfont=cmssi8\labelfont{11} etex);

  %
  % The retarded potentials in electrodynamics.
  %
  posretardedpots:=(1dxb, ypart posgauge -1dyb-0.5hs);
    drawbox(btex
        \def\iiint{\mathop{\int\kern-5pt\int\kern-5pt\int}}
        \vbox{
          \hbox{$\phi({\bf x},t)={{1}\over{4\pi\varepsilon_0}}\iiint
            {{\rho({\bf x}',t')}\over{|{\bf x}-{\bf x}'|}}\,dV'$}
          \vskip2pt
          \hbox{${\bf A}({\bf x},t)={{\mu_0}\over{4\pi}}\iiint
            {{{\bf J}({\bf x}',t')}\over{|{\bf x}-{\bf x}'|}}\,dV'$}
          \vskip2pt
          \hbox{Ret.~tid: $t'=t-|{\bf x}-{\bf x}'|/c$}
        }
      etex,
      btex \font\labelfont=cmssi8\labelfont
        {Retarderade potentialer}
      etex,
      posretardedpots, ws, 2.0*hs, rs,
      btex \font\labelfont=cmssi8\labelfont{11} etex);

  %
  % Connectors in the Electrostatics block.
  %
  connect(poscoulombforce, poscoulombgen, hs, hs, 270, 270);
  connect(poscoulombgen, posscalarpotential, hs, hs, 270, 270);
  connect(posscalarpotential, posscalpot, hs, hs, 270, 270);
  connect(posscalpot, posgaussintegral, hs, hs, 270, 270);
  connect(posgaussintegral, posgaussdifferential, hs, hs, 270, 270);
  connect(posgaussdifferential, pospoisson, hs, hs, 270, 270);
  connect(pospoisson, posmirrorcharges, hs, hs, 270, 270);

  %
  % Connectors in the Magnetostatics block.
  %
  connect(posbiotsavarti, posbiotsavartj, hs, hs, 270, 270);
  connect(posbiotsavartj, posmagmonopoles, hs, hs, 270, 270);
  connect(posmagmonopoles, posampere, hs, hs, 270, 270);
  connect(posampere, posvecpot, hs, hs, 270, 270);
  connect(posvecpot, posamperepot, hs, hs, 270, 270);
  connect(posamperepot, posamperepotint, hs, hs, 270, 270);

  %
  % Connectors in the Electrodynamics block.
  %
  connect(poslorentzforce, posfaradayinduc, hs, hs, 270, 270);
  connect(posfaradayinduc, posfaradaylaw, hs, hs, 270, 270);
  connect(posfaradaylaw, posneumann, hs, hs, 270, 270);
  pickup pencircle scaled .7pt;
  drawtexarrow (posfaradaylaw shifted (0u,-hs/2)){dir 270}
              ..{dir 180}(posfaradaylaw shifted (0u,-hs/2) shifted (-2u,-2u))
              ..{dir 180}(posfaradaylaw shifted (0u,-hs/2) shifted (-18u,-2u))
              ..{dir 270}(posfaradaylaw shifted (0u,-hs/2) shifted (-22u,-6u))
              ..{dir 270}(poscontinuity shifted (0u,hs/2) shifted (-22u,6u))
              ..{dir 0}(poscontinuity shifted (0u,hs/2) shifted (-18u,2u))
              ..{dir 0}(poscontinuity shifted (0u,hs/2) shifted (-2u,2u))
              ..{dir 270}(poscontinuity shifted (0u,hs/2));
  connect(poscontinuity, posdispcurr, hs, hs, 270, 270);

  %
  % Connectors in the Constitutive Relations block.
  %
  connect(poselecpoldens, poselecdispfield, hs, hs, 270, 270);
  connect(posmagnetiz, posmagfieldstrength, hs, hs, 270, 270);

  %
  % Connectors in the Wave Propagation block.
  %
  connect(posmaxwellintegral, posmaxwelldifferential, 2hs, 1.5hs, 270, 270);
  connect(posmaxwelldifferential, posmaxwellintegral, -1.5hs, -2hs, 90, 90);
  connect(posmaxwelldifferential, poselecwaveeq, 1.5hs, 2.2hs, 270, 270);
  connect(poselecwaveeq, posmaxwelldifferential, -2.2hs, -1.5hs, 90, 90);
  connect(poselecwaveeq, posdalembert, 2.2hs, hs, 270, 270);
  connect(posdalembert, posplanewaveexp, hs, 1.4hs, 270, 270);

  %
  % Connectors in the Multipole Expansion block.
  %
  connect(posmultipole, posdipoleapprox, 2hs, 1.4hs, 270, 270);

  %
  % Connectors in the Explicit Solution to Maxwell Equations block.
  %
  connect(posgauge, posretardedpots, hs, 2.0hs, 270, 270);

  drawlabeledbox(btex \font\labelfont=cmssbx10 scaled 800\labelfont
        {Elektrostatik} etex,
	(0dxb,-3.5dyb), ws+4u, 7dyb+hs+4u, rs);
  drawlabeledbox(btex \font\labelfont=cmssbx10 scaled 800\labelfont
        {Magnetostatik} etex,
	(dxb,-3.0dyb), ws+4u, 6dyb+hs+4u, rs);
  drawlabeledbox(btex \font\labelfont=cmssbx10 scaled 800\labelfont
        {Elektrodynamik} etex,
	(2dxb,-2.5dyb), ws+4u, 5dyb+hs+4u, rs);
  drawlabeledbox(btex \font\labelfont=cmssbx10 scaled 800\labelfont
        {Konstitutiva relationer} etex,
	(0dxb,-10.5dyb), ws+4u, 4dyb+hs+4u, rs);
  drawlabeledbox(btex \font\labelfont=cmssbx10 scaled 800\labelfont
        {Multipolutveckling av potentialer} etex,
	(1dxb,-8.75dyb+0.15hs), ws+4u, 1.5dyb+1.7hs+4u, rs);

  ywpmax := ypart posmaxwellintegral + 1hs;
  ywpmin := ypart posplanewaveexp - 0.7hs;
  drawlabeledbox(btex \font\labelfont=cmssbx10 scaled 800\labelfont
        {Elektromagnetisk v{\aa}gutbredning} etex,
	(2dxb,.5[ywpmin,ywpmax]), ws+4u, ywpmax-ywpmin+4u, rs);

  ywpmax := ypart posgauge + 0.5hs;
  ywpmin := ypart posretardedpots - 1.0hs;
  drawlabeledbox(btex \font\labelfont=cmssbx10 scaled 800\labelfont
        {Explicit l{\"o}sning till Maxwells ekvationer} etex,
	(dxb,.5[ywpmin,ywpmax]), ws+4u, ywpmax-ywpmin+4u, rs);

  %
  % Connecting the Electrodynamic block to the Electromagnetic Wave
  % Propagation block.
  %
  drawtexarrow (posdispcurr shifted (0u,-hs/2)){dir 270}
    ..{dir 180}(posdispcurr shifted (0u,-hs/2) shifted (-4u,-4u))
    ..{dir 180}(posdispcurr shifted (0u,-hs/2) shifted (-20u,-4u))
    ..(posdispcurr shifted (0u,-hs/2) shifted (-24u,-8u))
    ..{dir 270}(posmaxwellintegral shifted (0u,hs) shifted (-22u,2u))
    ..{dir 270}(posmaxwellintegral shifted (0u,hs) shifted (-22u,0u));

  %
  % Connecting the scalar potential box to the Multipole Expansion block.
  %
  drawtexarrow (posscalpot shifted (ws/2-rs,-hs/2+rs)
      shifted (.7071(rs,-rs))){dir 315}
    ..{dir 270}(.5[0u,dxb], ypart posscalpot - hs/2 - 10u){dir 270}
    ..{dir 270}(.5[0u,dxb], ypart posmultipole + hs + 10u){dir 270}
    ..{dir 315}(posmultipole shifted (-ws/2+rs,hs-rs) shifted (.7071(-rs,rs)));

  %
  % Connecting the scalar potential box to the Explicit Solutions to
  % Maxwell's Equations (Retarded Potentials) block.
  %
  drawtexarrow (posscalpot shifted (ws/2-rs,-hs/2+rs)
      shifted (.7071(rs,-rs))){dir 315}
    ..{dir 270}(.5[0u,dxb], ypart posscalpot - hs/2 - 10u){dir 270}
    ..{dir 270}(.5[0u,dxb], ypart posscalpot - hs/2 - 24u);
  drawtexarrow (.5[0u,dxb], ypart posscalpot - hs/2 - 24u){dir 270}
    ..{dir 270}(.5[0u,dxb], ypart posgauge + hs + 34u);
  drawtexarrow (.5[0u,dxb], ypart posgauge + hs + 34u){dir 270}
    ..{dir 270}(.5[0u,dxb], ypart posgauge + hs + 10u){dir 270}
    ..{dir 315}(posgauge shifted (-ws/2+rs,hs/2-rs) shifted (.7071(-rs,rs)));

  %
  % Connecting the vector potential box to the Multipole Expansion block.
  %
  drawtexarrow (posamperepotint shifted (0u,-hs/2)){dir 270}
    ..{dir 180}(posamperepotint shifted (0u,-hs/2) shifted (-4u,-4u))
    ..{dir 180}(posamperepotint shifted (0u,-hs/2) shifted (-20u,-4u))
    ..(posamperepotint shifted (0u,-hs/2) shifted (-24u,-8u))
    ..{dir 270}(posmultipole shifted (0u,hs) shifted (-22u,2u))
    ..{dir 270}(posmultipole shifted (0u,hs) shifted (-22u,0u));

  %
  % Connecting the Ampere's law box to the Electromagnetic Wave
  % Propagation block.
  %
  drawtexarrow (posampere shifted (ws/2-rs,-hs/2+rs)
      shifted (.7071(rs,-rs))){dir 315}
    ..{dir 270}(.5[dxb,2dxb], ypart posampere - hs/2 - 10u){dir 270}
    ..{dir 270}(.5[dxb,2dxb], ypart posampere - hs/2 - 24u);
  drawtexarrow (.5[dxb,2dxb], ypart posampere - hs/2 - 24u){dir 270}
    ..{dir 270}(.5[dxb,2dxb], ypart posmaxwellintegral + hs + 10u){dir 270}
    ..{dir 315}(posmaxwellintegral shifted (-ws/2+rs,hs-rs) shifted (.7071(-rs,rs)));

  %
  % Connecting the "no magnetic monopoles" box to the Electromagnetic Wave
  % Propagation block.
  %
  drawtexarrow (posmagmonopoles shifted (ws/2-rs,-hs/2+rs)
      shifted (.7071(rs,-rs))){dir 315}
    ..{dir 270}(.5[dxb,2dxb], ypart posmagmonopoles - hs/2 - 10u){dir 270}
    ..{dir 270}(.5[dxb,2dxb], ypart posmagmonopoles - hs/2 - 14u);
  drawtexarrow (.5[dxb,2dxb], ypart posmagmonopoles - hs/2 - 14u){dir 270}
    ..{dir 270}(.5[dxb,2dxb], ypart posmaxwellintegral + hs + 10u){dir 270}
    ..{dir 315}(posmaxwellintegral shifted (-ws/2+rs,hs-rs) shifted (.7071(-rs,rs)));

  %
  % Connecting the constitutive relations for the polarization density
  % and magnetization to the Electromagnetic Wave Propagation block.
  %
  drawtexarrow (poselecdispfield shifted (ws/2-rs,-hs/2+rs)
      shifted (.7071(rs,-rs))){dir 315}
    ..{dir 270}(.5[0u,dxb], ypart poselecdispfield - hs/2 - 10u){dir 270};
  drawtexarrow (.5[0u,dxb], ypart poselecdispfield - hs/2 - 10u){dir 270}
    ..{dir 270}(.5[0u,dxb], ypart poselecdispfield - hs/2 - 55u){dir 270}
    ..{dir 0}(.5[0u,dxb]+5u, ypart poselecdispfield - hs/2 - 55u - 5u)
    ..{dir 0}(.5[dxb,2dxb]-5u, ypart poselecdispfield - hs/2 - 55u - 5u)
    ..{dir 90}(.5[dxb,2dxb], ypart poselecdispfield - hs/2 - 55u)
    ..{dir 90}(.5[dxb,2dxb], ypart posmaxwellintegral + hs/2 - rs - 10u)
    ..{dir 0}(posmaxwellintegral shifted (-ws/2, hs-rs));
  drawtexarrow (posmagfieldstrength shifted (ws/2-rs,-hs/2+rs)
      shifted (.7071(rs,-rs))){dir 315}
    ..{dir 270}(.5[0u,dxb], ypart posmagfieldstrength - hs/2 - 10u){dir 270}
    ..{dir 270}(.5[0u,dxb], ypart poselecdispfield - hs/2 - 55u){dir 270};
  drawtexarrow (.5[0u,dxb]+5u, ypart poselecdispfield - hs/2 - 55u - 5u){dir 0}
    ..{dir 0}(.5[dxb,2dxb]-5u, ypart poselecdispfield - hs/2 - 55u - 5u)
    ..{dir 90}(.5[dxb,2dxb], ypart poselecdispfield - hs/2 - 55u)
    ..{dir 90}(.5[dxb,2dxb], ypart posmaxwellintegral + hs/2 - rs - 10u)
    ..{dir 0}(posmaxwellintegral shifted (-ws/2, hs-rs));


label.bot(btex \font\labelfont=cmssi8\labelfont Koppling till materialegenskaper etex,(dxb,ypart poselecdispfield - hs/2 - 55u - 5u));
      
  endfig;
end
