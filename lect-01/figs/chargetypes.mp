%
% MetaPost drawing of three types of charge distributions: Line charges,
% surface charges and volume charges.
%
% Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
%
u := 1mm;

beginfig(1);
  path p, ps;
  pair shift;
  pickup pencircle scaled 1pt;

  %
  % Line charges.
  %
  p := (-10u,0u){dir 20}..(0u,0u)..{dir 20}(10u,4u);
  shift := (-50u,0u);
  draw p shifted shift;
  pickup pencircle scaled 3pt;
  draw subpath (0.6,0.8) of p shifted shift;
  pickup pencircle scaled 1pt;
  label.bot(btex $dl$ etex,(0u,0u) shifted (shift+(0u,5u)));
  draw ((-15u,20u){dir -80}..{dir -80}(-3u,1u)) shifted shift;
  label.top(btex $dq=\lambda dl$ etex,(-15u,20u) shifted shift);
  label.bot(btex
      \vbox{
        \hbox{Linjeladdning}
        \hbox{$\lambda$ (${\rm C}/{\rm m}$)}}
      etex,shift shifted (0u,-5u));

  %
  % Surface charges.
  %
  p := (0u,0u){dir 30}..{dir 10}(17u,5u){dir 160}..{dir 170}(-2u,12u){dir 190}
    ..{dir 200}(-17u,7u){dir -20}..{dir -30}(0u,0u)--cycle;
  shift := (0u,0u);
  fill p shifted shift withcolor .975[black,white];
  draw p shifted shift;
  pickup pencircle scaled 3pt;
  pickup pencircle scaled 1pt;
  draw ((0u,0u)--(3u,1u)--(1u,2u)--(-2u,1u)--(0u,0u)) shifted (shift+(0u,5u));
  label.rt(btex $dA$ etex,(3u,1u) shifted (shift+(0u,5u)));
  draw ((-15u,20u){dir -60}..{dir -60}(0.5u,6u)) shifted shift;
  label.top(btex $dq=\sigma dA$ etex,(-15u,20u) shifted shift);
  label.bot(btex
      \vbox{
        \hbox{Ytladdning}
        \hbox{$\sigma$ (${\rm C}/{\rm m}^2$)}}
      etex,shift shifted (0u,-5u));

  %
  % Volume charges.
  %
  p := (0u,0u){dir 0}..{dir 90}(14u,7u)..{dir 220}(-7u,15u)
    ..(-17u,7u)..{dir 0}(0u,0u)--cycle;
  shift := (50u,0u);
  fill p shifted shift withcolor .975[black,white];
  draw p shifted shift;
  pickup pencircle scaled 3pt;
  pickup pencircle scaled 1pt;
  draw ((0u,0u)--(3u,1u)--(1u,2u)--(-2u,1u)--(0u,0u)) shifted (shift+(0u,5u));
  draw ((0u,0u)--(3u,1u)--(1u,2u)--(-2u,1u)--(0u,0u)) shifted (shift+(0u,8u));
  draw ((0u,0u)--(0u,3u)) shifted (shift+(0u,5u));
  draw ((3u,1u)--(3u,4u)) shifted (shift+(0u,5u));
  draw ((-2u,1u)--(-2u,4u)) shifted (shift+(0u,5u));
  draw ((1u,2u)--(1u,5u)) shifted (shift+(0u,5u));
  label.rt(btex $dV$ etex,(3u,2u) shifted (shift+(0u,5u)));
  draw ((-15u,20u){dir -60}..{dir -60}(-1u,10u)) shifted shift;
  label.top(btex $dq=\rho dV$ etex,(-15u,20u) shifted shift);
  label.bot(btex
      \vbox{
        \hbox{Volymladdning}
        \hbox{$\rho$ (${\rm C}/{\rm m}^3$)}}
      etex,shift shifted (0u,-5u));

endfig;
end
