%
% MetaPost drawing of the three principal ways of inducing an electromotoric
% force (EMF) be the Faraday law of induction (flux law), being
%   (1) a closed circuit moving through a stationary inhomogeneous
%       magnetic field,
%   (2) a stationary closed circuit through which an inhomogeneous
%       magnetic field is moving, and
%   (3) a stationary closed circuit through which a the magnetic
%       flux is varying in time.
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

vardef drawinarrow(expr pos) =
  begingroup
    path pcirc;
    pair pa, pb;
    pickup pencircle scaled 1pt;
    r:=1.5u;
    pcirc := fullcircle scaled (2*r) shifted pos;
    fill pcirc withcolor white;
    draw pcirc withcolor black;
    s:=sqrt(2)/2;
    pa := (s*r,s*r);
    pb := -pa;
    draw (pa--pb) shifted pos;
    pa := (-s*r,s*r);
    pb := -pa;
    draw (pa--pb) shifted pos;
  endgroup
enddef;

vardef drawdomain(expr pos, wd, hd, nx, ny, text, nxlabel, nylabel) =
  begingroup
    path pd;
    pair arrowshift;
    color gray;

    gray := .950[black,white];
    pickup pencircle scaled 1pt;
    pd := (-wd/2,-hd/2)--(wd/2,-hd/2)--(wd/2,hd/2)--(-wd/2,hd/2)--cycle;
    fill pd shifted pos withcolor gray;
    draw pd shifted pos withcolor black;

    dxa:=wd/nx;
    dya:=hd/ny;
    for n = 1 step 1 until nx:
      for m = 1 step 1 until ny:
        arrowshift := ((n-1-(nx-1)/2)*dxa, (m-1-(ny-1)/2)*dya) shifted pos;
        drawinarrow(arrowshift);
      endfor
    endfor
    arrowshift := ((nxlabel-1-(nx-1)/2)*dxa, (nylabel-1-(ny-1)/2)*dya)
      shifted pos;
    label(text, arrowshift);

  endgroup
enddef;

beginfig(1);
  path p;
  pair pos, ps;
  color gray;
  gray := .8[black,white];
  pickup pencircle scaled 1pt;
  casesepx:=56u;

  %=======================================================================
  % Draw the first case of induction, in which a closed circuit
  % is moving through a stationary inhomogeneous magnetic field.
  %=======================================================================
  pos:=(-casesepx,0u);
  wd:=30u;
  hd:=40u;
  nx:=4;
  ny:=5;
  drawdomain(pos, wd, hd, nx, ny, btex ${\bf B}_0$ etex, 1.5, 3.5);

  %
  % Define the closed path Gamma along which the EMF is generated.
  %
  w:=26u;
  h:=26u;
  dxp:=-7u;
  p := (-w/2,-h/2)--(w/2,-h/2)--(w/2,h/2)--(-w/2,h/2)--cycle;
  pickup pencircle scaled 2pt;
  draw p shifted pos shifted (dxp,0u) withcolor black;
  pickup pencircle scaled 1pt;
  ps:=pos shifted (-w/2,0u) shifted (dxp,0u);;
  drawarrow ps--(ps shifted (-7u,0u));
  label.ulft(btex ${\bf v}$ etex,(ps shifted (-7u,0u)));
  label.top(btex $\Gamma$ etex,(point 3.0 of p) shifted pos shifted (dxp,0u));

  %
  % Draw the direction of the generated current.
  %
  dd:=2u;
  p := ((0u,-h/2+dd)--(w/2-2dd,-h/2+dd){dir 0}
        ..{dir 90}(w/2-dd,-h/2+2dd)--(w/2-dd,h/2-2dd){dir 90}
        ..{dir 180}(w/2-2dd,h/2-dd)--(-w/2+2dd,h/2-dd){dir 180}
        ..{dir 270}(-w/2+dd,h/2-2dd)--(-w/2+dd,-h/2+2dd){dir 270}
        ..{dir 0}(-w/2+2dd,-h/2+dd)--(0u,-h/2+dd)
        --cycle) shifted pos shifted (dxp,0u);
  drawtexarrow reverse subpath(0.2,2.4) of p;
  drawtexarrow reverse subpath(2.6,4.4) of p;
  drawtexarrow reverse subpath(4.6,6.4) of p;
  drawtexarrow reverse subpath(6.6,8.8) of p;
  label.rt(btex $I$ etex, point 6.75 of p);

  %
  % Labeling the case.
  %
  label.top(btex \vbox{
      \hbox{{\bf Fall 1:} R{\"o}rlig slinga $\Gamma$}
      \hbox{r{\"o}r sig i ett station{\"a}rt}
      \hbox{inhomogent magnetf{\"a}lt ${\bf B}_0$}} etex,
      pos shifted (0u,hd/2+3u));

  %=======================================================================
  % Draw the second case of induction, in which we have a stationary
  % closed circuit through which an inhomogeneous magnetic field is moving.
  %=======================================================================
  pos:=(0u,0u);
  drawdomain(pos shifted (dxp,0u), wd, hd, nx, ny, btex ${\bf B}_0$ etex,
      3.5, 3.5);

  %
  % Define the closed path Gamma along which the EMF is generated.
  %
%  dxp:=-11u;
  p := (-w/2,-h/2)--(w/2,-h/2)--(w/2,h/2)--(-w/2,h/2)--cycle;
  pickup pencircle scaled 2pt;
  draw p shifted pos shifted (0u,0u) withcolor black;
  pickup pencircle scaled 1pt;
  ps:=pos shifted (-wd/2,0u) shifted (dxp,0u);;
  drawarrow ps--(ps shifted (-7u,0u));
  label.ulft(btex ${\bf v}$ etex,(ps shifted (-7u,0u)));
  label.top(btex $\Gamma$ etex,(point 2.0 of p) shifted pos shifted (0u,0u));

  %
  % Draw the direction of the generated current.
  %
  dd:=2u;
  p := ((0u,-h/2+dd)--(w/2-2dd,-h/2+dd){dir 0}
        ..{dir 90}(w/2-dd,-h/2+2dd)--(w/2-dd,h/2-2dd){dir 90}
        ..{dir 180}(w/2-2dd,h/2-dd)--(-w/2+2dd,h/2-dd){dir 180}
        ..{dir 270}(-w/2+dd,h/2-2dd)--(-w/2+dd,-h/2+2dd){dir 270}
        ..{dir 0}(-w/2+2dd,-h/2+dd)--(0u,-h/2+dd)
        --cycle) shifted pos shifted (0u,0u);
  drawtexarrow reverse subpath(0.2,2.4) of p;
  drawtexarrow reverse subpath(2.6,4.4) of p;
  drawtexarrow reverse subpath(4.6,6.4) of p;
  drawtexarrow reverse subpath(6.6,8.8) of p;
  label.rt(btex $I$ etex, point 6.75 of p);

  %
  % Labeling the case.
  %
  label.top(btex \vbox{
      \hbox{{\bf Fall 2:} Station{\"a}r slinga $\Gamma$}
      \hbox{i ett r{\"o}rligt inhomogent}
      \hbox{magnetf{\"a}lt ${\bf B}_0$}} etex,
      pos shifted (0u,hd/2+3u));

  %=======================================================================
  % Draw the third case of induction, in which we have a stationary
  % closed circuit in which an time-varying (dynamic) magnetic field
  % is present.
  %=======================================================================
  pos:=(casesepx,0u);
  wd:=40u;
  hd:=40u;
  nx:=5;
  ny:=5;
  drawdomain(pos shifted (0u,0u), wd, hd, nx, ny, btex ${\bf B}(t)$ etex,
      3.5, 3.5);

  %
  % Define the closed path Gamma along which the EMF is generated.
  %
%  dxp:=-11u;
  p := (-w/2,-h/2)--(w/2,-h/2)--(w/2,h/2)--(-w/2,h/2)--cycle;
  pickup pencircle scaled 2pt;
  draw p shifted pos shifted (0u,0u) withcolor black;
  pickup pencircle scaled 1pt;
  ps:=pos shifted (-w/2,0u) shifted (0u,0u);;
%  drawarrow ps--(ps shifted (-10u,0u));
%  label.ulft(btex ${\bf v}$ etex,(ps shifted (-10u,0u)));
  label.top(btex $\Gamma$ etex,(point 3.0 of p) shifted pos);

  %
  % Draw the direction of the generated current.
  %
  dd:=2u;
  p := ((0u,-h/2+dd)--(w/2-2dd,-h/2+dd){dir 0}
        ..{dir 90}(w/2-dd,-h/2+2dd)--(w/2-dd,h/2-2dd){dir 90}
        ..{dir 180}(w/2-2dd,h/2-dd)--(-w/2+2dd,h/2-dd){dir 180}
        ..{dir 270}(-w/2+dd,h/2-2dd)--(-w/2+dd,-h/2+2dd){dir 270}
        ..{dir 0}(-w/2+2dd,-h/2+dd)--(0u,-h/2+dd)
        --cycle) shifted pos shifted (0u,0u);
  drawtexarrow subpath(0.2,2.4) of p;
  drawtexarrow subpath(2.6,4.4) of p;
  drawtexarrow subpath(4.6,6.4) of p;
  drawtexarrow subpath(6.6,8.8) of p;
  label.rt(btex $I$ etex, point 6.75 of p);

  %
  % Labeling the case.
  %
  label.top(btex \vbox{
      \hbox{{\bf Fall 3:} Station{\"a}r slinga $\Gamma$}
      \hbox{i ett tidsvarierande magnet-}
      \hbox{f{\"a}lt ${\bf B}(t)$}} etex,
      pos shifted (0u,hd/2+3u));

endfig;
end
