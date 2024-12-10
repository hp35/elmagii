%
% MetaPost drawing of the classical linear electric quadrupole geometry.
%
% Copyright (C) 2023, Fredrik Jonsson
%
u = 1mm;
ll := 32u;
beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the z-axis.
  %
  drawarrow (0u,-24u)--(0u,30u);
  label.ulft(btex $z$ etex,(0u,30u));
  draw (-1u,0u)--(1u,0u);
  label.lft(btex $z=0$ etex,(-8u,0u));
%  label.urt(btex $\Delta r \approx b\cos\theta$ etex,(70u,-10u));

  %
  % Draw vectors to the observation point r.
  %
  drawarrow (0u,16u)--(90u,50u);
  label.ulft(btex ${\bf x}-b{\bf e}_z$ etex,(45u,33u));
  drawarrow (0u,0u)--(90u,50u);
  label.ulft(btex ${\bf x}$ etex,(45u,25u));
  label.ulft(btex $r=|{\bf x}|$ etex,(0u,0u)) rotated (90-60.9454)
    shifted (.7[(0u,0u),(45u,25u)]);
  drawarrow (0u,-16u)--(90u,50u);
  label.lrt(btex ${\bf x}+b{\bf e}_z$ etex,(45u,17u));
  dotlabel.urt(btex $\Phi({\bf x})$, ${\bf A}({\bf x})$ etex,(90u,50u));

  draw (5.2u*(0,1)){dir 0}..{dir -60.94}(5.2u*(0.8742,0.4856));
  label.urt(btex $\theta$ etex,(1u,5u));

  dr := (ll/2)*0.4856;
  draw (dr*(0.8742,0.4856))--(0u,ll/2);
  draw (0u,0u)--((0.8*ll/2)*(0.4856,-0.8742));

  label.lrt(btex $\Delta r$ etex,(4u,2.5u));
  label.lrt(btex $\Delta r\approx b\cos\theta$ etex,(4u,-13u));

  path p;
  p := (2u,0u)--(2u,2u)--(0u,2u);
  draw p rotated (90-60.9454) shifted (8u*(0.8742,0.4856));
  draw p rotated (90-60.9454) shifted (6.5u,-10.9u);

  %
  % Draw the charges of the dipole.
  %
  fill fullcircle scaled 5u shifted (0u,ll/2) withcolor .95[black,white];
  draw fullcircle scaled 5u shifted (0u,ll/2);
  label(btex $+$ etex,(0u,ll/2));
  label.ulft(btex $+q$ etex,(-1u,20u));
  label.lft(btex $z=L/2$ etex,(-3u,ll/2));
  label.lft(btex $b$ etex,(-0u,ll/4));
  fill fullcircle scaled 5u shifted (0u,-ll/2) withcolor .95[black,white];
  draw fullcircle scaled 5u shifted (0u,-ll/2);
  label(btex $+$ etex,(0u,-ll/2));
  label.lft(btex $z=-L/2$ etex,(-3u,-ll/2));
  label.lft(btex $b$ etex,(-0u,-ll/4));
  label.llft(btex $+q$ etex,(-1u,-20u));

  fill fullcircle scaled 7u shifted (0u,0u) withcolor .95[black,white];
  draw fullcircle scaled 7u shifted (0u,0u);
  label(btex $-$ etex,(0u,0u));
  label.ulft(btex $-2q$ etex,(-3u,2u));
  
endfig;
end
