%
% MetaPost drawing of the surface with charge density over which we apply
% Gauss' law in order to extract boundary conditions for the elektric field
% normal to the surface.
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
  fill p shifted (30u,3u) withcolor white;
  draw p shifted (30u,3u);
  fill p shifted (30u,1u) withcolor .8[black,white];
  draw p shifted (30u,1u) dashed evenly;

  %
  % Lower right side panel.
  %
  p := (10u,-2u)--(16u,1u)--(16u,-1u)--(10u,-4u)--(10u,-2u)--cycle;
  fill p shifted (30u,3u) withcolor white;
  draw p shifted (30u,3u);
  fill p shifted (30u,1u) withcolor .8[black,white];
  draw p shifted (30u,1u) dashed evenly;

  p := (0u,0u)--(10u,-2u)--(16u,1u)--(6u,3u)--(0u,0u)--cycle;
  fill p shifted (30u,3u) withcolor white;
  draw p shifted (30u,3u);

  p := (16u,1u)--(.35[(16u,1u),(6u,3u)]);
  draw p shifted (30u,-1u) dashed evenly;
  p := (0u,0u)--(.35[(0u,0u),(6u,3u)]);
  draw p shifted (30u,-1u) dashed evenly;
  
  label.top(btex $\sigma$ (${\rm C}/{\rm m}^2$) etex,(65u,0u));
  label.urt(btex $\Omega$ etex,(46u,4u));

  drawarrow (38u,4u)--(38u,16u);
  label.rt(btex $E^{\perp}_2$ etex,(38u,16u));
  drawarrow (38u,-13u)--(38u,-2u) dashed evenly;
  label.rt(btex $E^{\perp}_1$ etex,(38u,-13u));

  drawarrow (26u,8u)--(26u,20u);
  pickup pencircle scaled .5pt;
  draw (26u,10u)--(28u,10u)--(28u,8u);
  label.rt(btex ${\bf e}_n$ etex,(26u,20u));

  pickup pencircle scaled .5pt;
  draw (29u,3u)--(20u,3u);
  draw (29u,-1u)--(20u,-1u);
  draw (21u,-10u)--(21u,7u);
  drawarrow (21u,-10u)--(21u,-1u);
  drawarrow (21u,7u)--(21u,3u);
  label.lrt(btex $h\to0$ etex,(21u,-8u))

endfig;
end
