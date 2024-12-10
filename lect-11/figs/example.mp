%
% MetaPost drawing of the geometry of the half-wave antenna.
%
% Copyright (C) 2022, Fredrik Jonsson
%
u = 1mm;
ll := 64u;
beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the half-wave antenna as such.
  %
  draw ((0u,-ll/4)--(0u,ll/4)) withpen pencircle scaled 6pt
    withcolor .7[black,white];
  draw (-1u,-ll/4)--(1u,-ll/4);
  draw (-1u,ll/4)--(1u,ll/4);
  label.lft(btex $z=\lambda/4$ etex,(-3u,ll/4));
  label.lft(btex $z=-\lambda/4$ etex,(-3u,-ll/4));

  %
  % Draw the z-axis.
  %
  drawarrow (0u,-24u)--(0u,30u);
  label.ulft(btex $z$ etex,(0u,30u));
  draw (-1u,0u)--(1u,0u);
  label.lft(btex $z=0$ etex,(-3u,0u));

  %
  % Draw vectors to the observation point r.
  %
  drawarrow (0u,0u)--(110u,0u);
  label.urt(btex $x$ etex,(110u,0u));
  dotlabel.top(btex ${\bf x}=x{\bf e}_x$ etex,(90u,0u));

  drawarrow (20u,20u){dir -170}..{dir -170}(2u,10u);
  label.rt(btex
        \vbox{
          \hbox{$I(z,t)=I_0\cos(2\pi z/\lambda)\sin(\omega t)$,}
          \hbox{(d{\"a}r $\omega/c = 2\pi/\lambda$)}}
      etex,(20u,18u));

  drawarrow (70u,-20u){dir 10}..{dir 40}(88u,-2u);
  label.lft(btex \hbox{Vi s{\"o}ker ${\bf E}({\bf x},t)$ och
                       ${\bf B}({\bf x},t)$ h{\"a}r} etex,(70u,-20u));

endfig;
end
