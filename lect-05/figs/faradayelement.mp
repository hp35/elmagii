%
% MetaPost drawing of the enlarged area element dA, being part of the
% "ribbon" between the closed trajectory Gamma(t) and Gamma(t+dt) in
% the formal and general derivation of Faradays law of induction (the
% "flux law"). This figure is part of the figure drawn by the MetaPost
% code in faradayrib.mp.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path pgamma, pgammap, p, ps;
  pair pa, pb, pc, pd, ppa, ppb, ppc, ppd;
  color gray;
  gray := .6[black,white];
  pickup pencircle scaled 1pt;

  %
  % The area element between the two trajectories Gamma(t) and Gamma(t+dt).
  %
  pa := (0u,0u);
  pb := pa shifted (45u*(cosd(45),sind(45)));
  pc := pa shifted (4.5u,36u);
  pd := pc shifted (45u*(cosd(45),sind(45)));
%  pb := pa shifted (60u*(cosd(45),sind(45)));
%  pc := pa shifted (6u,48u);
%  pd := pc shifted (60u*(cosd(45),sind(45)));

  drawarrow pa--pb dashed evenly withcolor gray;
  label.rt(btex ${\bf v}({\bf x},t)dt$ etex,pb);
  drawarrow pa--pc dashed evenly withcolor gray;
  label.lft(btex $d{\bf l}({\bf x},t)$ etex,pc);

  %
  % The corresponding velocity components u and v of a charge traversing
  % the path of Gamma(t)-Gamma(t+dt).
  %
  ppa:=pa;
  ppb := ppa shifted (30u*(cosd(45),sind(45)));
  ppc := ppa shifted (3u,24u);
  ppd := ppc shifted (30u*(cosd(45),sind(45)));
  
  drawarrow ppa--ppb;
  label.lrt(btex ${\bf v}({\bf x},t)$ etex,.5[ppa,ppb]);
  drawarrow ppa--ppc;
  label.lft(btex ${\bf u}({\bf x},t)$ etex,.5[ppa,ppc]);
  drawarrow ppa--ppd;
  label.top(btex ${\bf w}={\bf u}+{\bf v}$ etex,ppd);
  draw ppc--ppd dashed evenly withcolor gray;
  draw ppb--ppd dashed evenly withcolor gray;

  label.bot(btex \vbox{
      \hbox{Hastighet ${\bf u}({\bf x},t)$ f{\"o}r laddning}
      \hbox{l{\"a}ngs med trajektorian $\Gamma(t)$}} etex,(-40u,-10u));
  draw (-40u,-10u){dir 70}..{dir 70}(-6u,9u);

  label.bot(btex \vbox{
      \hbox{Hastighet ${\bf v}({\bf x},t)$ f{\"o}r}
      \hbox{trajektorian $\Gamma(t)$}} etex,(40u,-10u));
  draw (40u,-10u){dir 110}..{dir 110}(17u,6u);

  label.top(btex \vbox{
      \hbox{Resulterande hastighet ${\bf w}({\bf x},t)$ f{\"o}r laddningens}
      \hbox{transport l{\"a}ngs den r{\"o}rliga trajektorian $\Gamma(t)$}} etex,
      (40u,64u));
  draw (40u,64u){dir 260}..{dir 260}(18u,50u);

endfig;
end
