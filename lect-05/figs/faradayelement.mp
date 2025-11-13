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
  pb := pa shifted (60u*(cosd(45),sind(45)));
  pc := pa shifted (6u,48u);
  pd := pc shifted (60u*(cosd(45),sind(45)));

%  fill pa--pb--pd--pc--cycle withcolor gray;
  drawarrow pa--pb dashed evenly withcolor gray;
  label.rt(btex ${\bf v}({\bf x},t)dt$ etex,pb);
%  drawarrow pc--pd dashed evenly withcolor black;
%  label.ulft(btex ${\bf v}dt$ etex,.5[pc,pd]);
  drawarrow pa--pc dashed evenly withcolor gray;
  label.lft(btex $d{\bf l}({\bf x},t)$ etex,pc);
%  drawarrow pb--pd;
%  label.rt(btex $d{\bf l}(t+dt)$ etex,.5[pb,pd]);
%  p := (pa+4u*(pb-pa)/abs(pb-pa)){dir 135}..{dir 180}(pa+4u*(pc-pa)/abs(pc-pa));
%  draw p;
%  label.urt(btex $\vartheta$ etex,point .75 of p);

  ppa:=pa;
  ppb := ppa shifted (30u*(cosd(45),sind(45)));
  ppc := ppa shifted (3u,24u);
  ppd := ppc shifted (30u*(cosd(45),sind(45)));
  
%  fill pa--pb--pd--pc--cycle withcolor gray;
  drawarrow ppa--ppb;
  label.lrt(btex ${\bf v}({\bf x},t)$ etex,.5[ppa,ppb]);
%  drawarrow ppc--ppd;
%  label.ulft(btex ${\bf v}dt$ etex,.5[ppc,ppd]);
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
%  label.rt(btex $d{\bf l}(t+dt)$ etex,.5[ppb,ppd]);
%  p := (ppa+4u*(ppb-ppa)/abs(ppb-ppa)){dir 135}..{dir 180}(ppa+4u*(ppc-ppa)/abs(ppc-ppa));
%  draw p;
%  label.urt(btex $\vartheta$ etex,point .75 of p);


%  label.top(btex $d{\bf A}=({\bf v}dt)\times(d{\bf l})
%                          ={\bf v}\times d{\bf l}\,dt$ etex,(88u,34u));
%  label.top(btex $\big(dA=|{\bf v}||d{\bf l}|\,dt\sin(\vartheta)\big)$ etex,
%      (88u,40u));
%  draw (88u,34u){dir 280}..{dir 280}(100u,10u);

endfig;
end
