%
% MetaPost drawing of the electric field produced by a spherical-symmetric
% charge, acting on a test charge q at a radius r form the centre of the
% distribution. The produced electric field acts exactly in the same way
% as a spherical-symmetrical mass distribution and the gravity acting upon
% an observer of mass m.
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
  % Draw the spherical-symmetrical charge distribution.
  %
  ra:=30u;
  rb:=20u;
  fill fullcircle scaled (2*ra) shifted (0u,0u) withcolor .95[black,white];
  draw fullcircle scaled (2*ra) shifted (0u,0u);

  fill fullcircle scaled (2*rb) shifted (0u,0u) withcolor .90[black,white];
  draw fullcircle scaled (2*rb) shifted (0u,0u) dashed evenly;
  drawarrow (0u,0u)--(rb*(cosd(30),sind(30)));
  label.urt(btex $r$ etex,(rb*(cosd(30),sind(30))));
  drawarrow (0u,0u)--(ra*(cosd(60),sind(60)));
  label.urt(btex $R$ etex,(ra*(cosd(60),sind(60))));

  %
  % Label the charge distribution as spherical-symmetric.
  %
  label.bot(btex $V:|{\bf x}'|\le r$ etex,(0u,-10u));

  label.rt(btex \vbox{
      \hbox{Sf{\"a}risk-symmetrisk}
      \hbox{laddningst{\"a}thet}
      \hbox{$\rho({\bf x})=\rho(r)$}} etex,(40u,0u));
  draw (40u,0u){dir 190}..{dir 190}(23u,-10u);

  %
  % Draw the coordinate system.
  %
  xo:=0u;
  yo:=0u;
  drawarrow (xo+2u,yo+1u)--(xo-4u,yo-2u);    % x-axis
  drawarrow (xo-2u,yo+1u)--(xo+4u,yo-2u);    % y-axis
  drawarrow (xo,yo-2u)--(xo,yo+5u);          % z-axis
  label.llft(btex $x$ etex,(xo-4u,yo-2u));
  label.lrt(btex $y$ etex,(xo+4u,yo-2u));
  label.urt(btex $z$ etex,(xo,yo+5u));

endfig;
end
