%
% MetaPost drawing of Faraday's cage, being a special case of the uniqueness
% configuration.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;
input hatching;

picture blixt;
blixt := image(
  draw (0,-4)--(0,6)--(2,4)--(2,12)--(3,1)--(1,3)--(0,-2);
);

picture gubbe;
gubbe := image(
  pickup pencircle scaled 1pt;
  draw (0,1){dir 95}..{dir 85}(0,6);  % kropp
  draw (0,5.7){dir -50}..{dir -40}(2,4)--(3,1); % höger arm
  draw (0,5.7){dir -140}..{dir -150}(-2,4)--(-4,2.0); % vänster arm
  draw fullcircle scaled 2 shifted (0,7); % huvud
  draw (0,1)--(2,-5)--(1.3,-5.2); % höger ben
  draw (0,1)--(-2,-5)--(-2.7,-4.8); % vänster ben
);

beginfig(1);
  path p, ps;
  pair pa;
  color gray;
  gray := .975[black,white];
  pickup pencircle scaled 1pt;

  p:= (0u,0u){dir 0}..{dir 90}(35u,6u)..{dir 180}(10u,10u)
    ..{dir 180}(-12u,36u)..(-35u,6u)..{dir 0}(0u,0u)--cycle;
  fill p withcolor gray;
  draw p;
  label.rt(btex Volym $V$ etex, (6u,44u));
  draw (6u,44u){dir 180}..{dir 190}(point 2.5 of p shifted (-4u,0u));
  label(btex $\nabla^2\phi({\bf x})=0$ etex,(-16u,28u));
  label(btex $\Updownarrow$ etex,(-16u,23u));
  label(btex $\phi({\bf x})=\phi_0$, ${\bf x}\in V$ etex, (-16u,18u));
  label(btex $\Updownarrow$ etex,(-16u,13u));
  label(btex ${\bf E}=-\nabla\phi={\bf 0}$, ${\bf x}\in V$ etex, (-16u,8u));
  label.lft(btex
      \vbox{
      \hbox{Randyta $S$ med}
      \hbox{skal{\"a}r potential}
      \hbox{$\phi=\phi_0=\hbox{konst.}$}}
      etex, (-34u,42u));
  draw (-34u,42u){dir -20}..{dir -20}(point 3.4 of p shifted (-1u,0u));

  %
  % The special case of a grounded perfect conductor
  %
  p:= ((0u,0u){dir 0}..{dir 90}(15u,7u)..{dir 180}(10u,18u)
    ..{dir 180}(-10u,12u)..(-15u,6u)..{dir 0}(0u,0u)--cycle);
  hatchfill p shifted (60u,6u) withcolor (45, 1u, -.5bp);
  draw p shifted (60u,6u);
  label.top(btex \vbox{\hbox{{\bf Till{\"a}mpning}}\hbox{(Faradays bur)}} etex, (52u,38u));
  fill p scaled 0.8 shifted (60u,7.2u) withcolor white;
  draw p scaled 0.8 shifted (60u,7.2u);
  pa:= (point 0.7 of p) shifted (60u,6u);
  draw pa--(pa shifted (5u,0u))--(pa shifted (5u,-10u));
  pa := pa shifted (5u,-10u);
  draw (pa shifted (-2.5u,0u))--(pa shifted (2.5u,0u));
  draw (pa shifted (-1.5u,-1u))--(pa shifted (1.5u,-1u));
  draw (pa shifted (-0.5u,-2u))--(pa shifted (0.5u,-2u));
  label.llft(btex ``$\phi=0$'' etex,(pa shifted (-4u,0u)));
  label.top(btex \vbox{\hbox{Perfekt}\hbox{ledare}} etex,(82u,35u));
  draw (82u,35u){dir -90}..((point 1.2 of p) shifted (60u-1u,6u));

  pickup pencircle scaled .5pt;
  draw blixt rotated 20 scaled .7u shifted (54u,26u);
  draw blixt rotated 10 scaled .7u shifted (60u,27u);
  draw blixt rotated 0 scaled .7u shifted (66u,28u);

  pickup pencircle scaled 1pt;
  draw gubbe scaled .6u shifted (60u,12u);
  draw gubbe scaled .6u shifted (66u,12u);

endfig;
end
