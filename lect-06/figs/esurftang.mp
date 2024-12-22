%
% MetaPost drawing of the surface with charge density over which we apply
% Gauss' law in order to extract boundary conditions for the elektric field
% tangential to the surface.
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

  path p;
  p:=((0u,0u)--(50u,-10u){dir 45}..{dir 45}(80u,5u)
      --(30u,15u){dir 225}..{dir 225}(0u,0u)--cycle);
  fill p withcolor .9[black,white];
  draw p;

  %
  % Lower left side panel.
  %
  p := (0u,0u)--(10u,-2u)--(10u,-4u)--(0u,-2u)--(0u,0u)--cycle;
  draw p shifted (34u,5u);
  p := (10u,-2u)--(10u,-4u)--(0u,-2u)--(0u,0u);
  draw p shifted (34u,3u) dashed evenly;

  label.top(btex $\sigma$ (${\rm C}/{\rm m}^2$) etex,(65u,0u));
  label.ulft(btex $\Sigma$ etex,(42u,5u));

  drawarrow ((0u,0u)--(10u,-2u)) shifted (39u,3u);
  label.urt(btex $E^{\parallel}_2$ etex,(49u,1u));
  drawarrow ((0u,0u)--(10u,-2u)) shifted (39u,1u);
  label.lrt(btex $E^{\parallel}_1$ etex,(49u,-1u));

  drawarrow (31u,8u)--(31u,20u);
  pickup pencircle scaled .5pt;
  draw (31u,10u)--(33u,10u)--(33u,8u);
  label.rt(btex ${\bf e}_n$ etex,(33u,20u));

  pickup pencircle scaled .5pt;
  draw ((29u,3u)--(20u,3u)) shifted (4u,2u);
  draw ((29u,-1u)--(20u,-1u)) shifted (4u,2u);
  draw ((21u,-10u)--(21u,7u)) shifted (4u,2u);
  drawarrow ((21u,-10u)--(21u,-1u)) shifted (4u,2u);
  drawarrow ((21u,7u)--(21u,3u)) shifted (4u,2u);
  label.llft(btex $h\to0$ etex,(25u,-6u))
  
endfig;
end
