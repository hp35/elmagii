# -*- coding: utf-8 -*-
"""
timeline.py

Generation of a timeline of the principal scientists who formed the classical
theory of electrostatics, magnetostatics and electrodynamics.

Copyright (C) 2024, Fredrik Jonsson, under Gnu General Public License
(GPL) v3. See the enclosed LICENSE for details.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
"""
import matplotlib.pyplot as plt
import numpy as np

"""
As a global standard, use TeX-style labeling for everything graphics-related.
"""
plt.rcParams.update({
    "text.usetex" : True,
    "font.family" : "Computer Modern",
    "font.size"   : 12
})

"""
Data of timelines in the format "(Name, birth_year, death_year)"
"""
people = [
    ("William Gilbert", 1544, 1603),
    ("Fran\c{c}ois de Cisternay du Fay", 1698, 1739),
    ("Benjamin Franklin", 1706, 1790),
    ("Jean le Rond d'Alembert", 1717, 1783),
    ("Charles-Augustin de Coulomb", 1736, 1806),
    ("Pierre-Simon Laplace", 1749, 1827),
    ("Jean-Baptiste Biot", 1774, 1862),
    ("Andr{\\'e}-Marie Amp\`ere", 1775, 1836),
    ("Hans Christian {\OE}rsted", 1777, 1851),
    ("Carl Friedrich Gauss", 1777, 1855),
    ("Siméon Denis Poisson", 1781, 1840),
    ("Felix Savart", 1791, 1841),
    ("Michael Faraday", 1791, 1867),
    ("Franz Ernst Neumann", 1798, 1895),
    ("Emil Lenz", 1804, 1865),
    ("Wilhelm Eduard Weber", 1804, 1891),
    ("George Stokes", 1819, 1903),
    ("Lord Kelvin", 1824, 1907),
    ("Ludvig Lorenz", 1829, 1891),
    ("James Clerk Maxwell", 1831, 1879),
    ("Oliver Heaviside", 1850, 1925),
    ("Hendrik Antoon Lorentz", 1853, 1928),
    ("John Joseph ``J. J.'' Thomson", 1856, 1940),
    ("Nikola Tesla", 1856, 1943),
    ("George Paget Thomson", 1892, 1975),
    ("Louis de Broglie", 1892, 1987),
    ("Richard Feynman", 1918, 1988),
    ("Rickard Wilson", 1930, 2000),
]

names = [p[0] for p in people]
births = [p[1] for p in people]
deaths = [p[2] for p in people]
durations = [d - b for b, d in zip(births, deaths)]

y_pos = range(len(people))

fig, ax = plt.subplots(figsize=(10, 10))

ax.barh(
    y_pos,
    durations,
    left=births,
    color="white",
    edgecolor="black",
    linewidth=1
)

ax.set_yticks(y_pos)
ax.set_yticklabels(names)
ax.set_xlabel("Year")
# ax.set_title("A brief history of classical electromagnetics")

ax.grid(axis="x", linestyle="--", alpha=0.5)
ax.invert_yaxis()

# Add year-span labels
padding = 5  # years of horizontal padding for labels

for i, (b, d) in enumerate(zip(births, deaths)):
    label = f"({b}–{d})"
    if i == 0:
        # First bar: label to the right
        ax.text(
            d + padding,
            i,
            label,
            va="center",
            ha="left"
        )
    else:
        # Other bars: label to the left
        ax.text(
            b - padding,
            i,
            label,
            va="center",
            ha="right"
        )

# Add slight padding to the left of the leftmost bar
min_year = min(births)
max_year = max(deaths)
x_padding = 5  # years
ax.set_xlim(min_year - x_padding, max_year + x_padding)

# Set gridlines every 50 years
start_year = (min_year // 50) * 50 + 50
end_year = ((max_year // 50) + 1) * 50 - 50
ax.set_xticks(np.arange(start_year, end_year + 1, 50))
ax.grid(axis="x", linestyle="--", alpha=0.5)

plt.tight_layout()
plt.show()
plt.savefig("timeline.eps", format="eps")
plt.savefig("timeline.svg", format="svg")

