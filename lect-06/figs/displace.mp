%
% MetaPost drawing of the more detailed model of the classical single and
% static electric dipole, excited by an externally applied electric field.
%
% Copyright (C) 2024, Fredrik Jonsson, under Gnu General Public License
% (GPL) v3. See the enclosed LICENSE for details.
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
u = 1mm;
beginfig(1);
  pickup pencircle scaled 1pt;

  %
  % Draw the molecule polarized by an external field.
  %
  label.lft(btex ${\bf E}_{\rm ext}$ etex, (-45u,30u));
  for k = -2 upto 1:
    label.top(btex $+$ etex,(24*(k+0.5)*u,37u));
    drawarrow ((24*(k+0.5)*u,37u)--(24*(k+0.5)*u,-37u));
    label.bot(btex $-$ etex,(24*(k+0.5)*u,-37u));
  endfor
  draw fullcircle scaled 64u;
  label(btex $-$ etex,(-24u,0u));
  label(btex $-$ etex,(-16.96u,16.96u));
  label(btex $-$ etex,(0u,24u));
  label(btex $-$ etex,(16.96u,16.96u));
  label(btex $-$ etex,(24u,0u));
  label(btex $-$ etex,(16.96u,-16.96u));
  label(btex $-$ etex,(0u,-24u));
  label(btex $-$ etex,(-16.96u,-16.96u));

  label(btex $-$ etex,.45(-16.96u,16.96u));
  label(btex $-$ etex,.45(16.96u,16.96u));
  label(btex $-$ etex,.45(16.96u,-16.96u));
  label(btex $-$ etex,.45(-16.96u,-16.96u));

  draw fullcircle scaled 30u dashed evenly;
  fill fullcircle scaled 5u shifted (0u,-15u) withcolor .95[black,white];
  draw fullcircle scaled 5u shifted (0u,-15u);
  label(btex $+$ etex,(0u,-15u));
  label.lrt(btex $+q$ etex,(1u,-16u));
  drawarrow ((0u,-12.5u)--(0u,-5u));
  label.rt(btex ${\bf F}_{\rm e}$ etex,(0u,-5u));
  drawarrow ((0u,-17.5u)--(0u,-25u));
  label.rt(btex ${\bf F}_{\rm ext}$ etex,(0u,-25u));
  label.ulft(btex $\Omega$ etex,(-5u,15u));

  drawarrow ((0u,0u)--((64u/2)*(.8660,.5000)));
  label.rt(btex $a$ etex,((64u/2)*(.8660,.5000)) shifted (1u,0u));
  drawarrow ((0u,0u)--((30u/2)*(.8660,.5000)));
  label.rt(btex $r$ etex,((30u/2)*(.8660,.5000)) shifted (1u,0u));

endfig;
end
