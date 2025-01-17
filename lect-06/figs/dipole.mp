%
% MetaPost drawing of the classical single and static electric dipole, excited
% by an externally applied electric field.
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
  % Draw the unpolarized molecule.
  %
  draw fullcircle scaled 32u shifted (0u,0u);
  label(btex $-$ etex,(-12u,0u));
  label(btex $-$ etex,(-8.48u,8.48u));
  label(btex $-$ etex,(0u,12u));
  label(btex $-$ etex,(8.48u,8.48u));
  label(btex $-$ etex,(12u,0u));
  label(btex $-$ etex,(8.48u,-8.48u));
  label(btex $-$ etex,(0u,-12u));
  label(btex $-$ etex,(-8.48u,-8.48u));
  fill fullcircle scaled 4u shifted (0u,0u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (0u,0u);
  label(btex $+$ etex,(0u,0u));
  label.lft(btex ${\bf E}_{\rm ext}={\bf 0}$ etex, (-10u,20u));

  %
  % Draw the molecule polarized by an external field.
  %
  for k = -2 upto 1:
    label.top(btex $+$ etex,(12*(k+0.5)*u,27u) shifted (70u,0u));
    drawarrow ((12*(k+0.5)*u,27u)--(12*(k+0.5)*u,-27u)) shifted (70u,0u);
    label.bot(btex $-$ etex,(12*(k+0.5)*u,-27u) shifted (70u,0u));
  endfor
  draw fullcircle scaled 32u shifted (70u,7u);
  label(btex $-$ etex,(-12u,0u) shifted (70u,7u));
  label(btex $-$ etex,(-8.48u,8.48u) shifted (70u,7u));
  label(btex $-$ etex,(0u,12u) shifted (70u,7u));
  label(btex $-$ etex,(8.48u,8.48u) shifted (70u,7u));
  label(btex $-$ etex,(12u,0u) shifted (70u,7u));
  label(btex $-$ etex,(8.48u,-8.48u) shifted (70u,7u));
  label(btex $-$ etex,(0u,-12u) shifted (70u,7u));
  label(btex $-$ etex,(-8.48u,-8.48u) shifted (70u,7u));
  fill fullcircle scaled 4u shifted (70u,0u) withcolor .95[black,white];
  draw fullcircle scaled 4u shifted (70u,0u);
  label(btex $+$ etex,(70u,0u));
  label.lft(btex ${\bf E}_{\rm ext}\ne{\bf 0}$ etex, (45u,20u));
  drawarrow ((0u,7u)--(0u,0u)) shifted (70u,0u);
  label.rt(btex ${\bf p}$ etex,(0u,4u) shifted (70u,0u));

  draw ((12u,10u){dir 60}..{dir 60}(30u,20u)) shifted (70u,0u);
  dotlabel("",(12u,10u) shifted (70u,0u));
  label.urt("Latt elektronmoln,", (24u,24u) shifted (70u,0u));
  label.urt("flyttas mot `+'", (24u,20u) shifted (70u,0u));
  
endfig;
end
