%
% MetaPost drawing of our World Map of electrodynamics, and how Coulomb's
% law together with Biot-Savart's law interlinked with constitutive relations
% result in Maxwell's equations, finally producing the electromagnetic wave
% equation.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
input TEX;
u := 1mm;

vardef drawbox(expr eqn, labeltext, cpos, w, h, r) =
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
    draw box;
    label.bot(labeltext, (xc,yc+hh));
    label(eqn, (xc,yc));
  endgroup
enddef;

vardef connect(expr posa, posb, wa, ha, wb, hb, da, db) =
  begingroup
    drawarrow (posa shifted (0u,-ha/2)){dir da}
      ..{dir db}(posb shifted (0u,hb/2));
  endgroup
enddef;

beginfig(1);
  path p;
  pair poscoulombgen, posbiotsavarti, posb;
  ws := 60u;  % Standard box width
  hs := 20u;  % Standard box height
  rs := 3u;   % Standard corner rounding
  pickup pencircle scaled 1pt;

  poscoulombgen:=(0u,220u);
  drawbox(btex 
      $\def\iiint{\mathop{\int\kern-8pt\int\kern-8pt\int}}
       \displaystyle
      {\bf E}({\bf x})={{1}\over{4\pi\varepsilon_0}}\iiint_V
      \rho({\bf x}')
          {{({\bf x}-{\bf x}')}
            \over{|{\bf x}-{\bf x}'|^3}}\,dV'.
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Coulombs generaliserade lag} etex, poscoulombgen, ws, hs, rs);
  posb:=(60u,180u);
  connect(poscoulombgen,posb,ws,hs,ws,hs,270,270);
  
  posbiotsavarti:=(0u,180u);
  drawbox(btex
	$\displaystyle
          {\bf B}({\bf x})={{\mu_0}\over{4\pi}}\int^{{\bf x}_b}_{{\bf x}_a}
          {{{\bf I}({\bf x}')\times({\bf x}-{\bf x}')}
            \over{|{\bf x}-{\bf x}'|^3}}\,dl'.
      $ etex,
      btex \font\labelfont=cmssi8\labelfont
      {Biot--Savarts lag} etex, posbiotsavarti, ws, hs, rs);
  posb:=(60u,140u);
  connect(posbiotsavarti,posb,ws,hs,ws,hs,270,270);
  
endfig;
end
