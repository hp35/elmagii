# -*- coding: utf-8 -*-
"""
potentials.py

Generation of maps of potentials for various configurations of multipoles
displayed in Lecture 8 of the series on Electromagnetics II (1TE626), for
Engineering Physics (MSc level), Uppsala Universitet, 2022--.

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
from math import sqrt, pi
from scipy import ndimage
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors

def phi(x, y, q, xs, ys):
    """
    Compute the scalar potential in point (x,y) given a set of N point sources
    of charge q_k located at (xs_k,ys_k).
    """
    nn = len(q)
    scalpot = np.zeros((len(y),len(x)))
    for jx in range(len(x)):
        for jy in range(len(y)):
            for k in range(nn):
                scalpot[jy,jx] += q[k]/sqrt(pow(x[jx]-xs[k],2)+pow(y[jy]-ys[k],2))
    return scalpot

def plotPotential(x, y, q, xs, ys, clevels, text,
                  streamline=False,
                  streamseeds=np.array([])):
    scalpot = phi(x, y, q, xs, ys)
    xx, yy = np.meshgrid(x,y)
    sx = ndimage.sobel(scalpot,axis=0,mode='constant')
    sy = ndimage.sobel(scalpot,axis=1,mode='constant')

    plt.figure(text)
    params = {"ytick.color" : "black",
              "xtick.color" : "black",
              "axes.labelcolor" : "black",
              "axes.edgecolor" : "black",
              "text.usetex" : True,
              "font.family" : "serif",
              "font.serif" : ["Computer Modern Serif"]}
    plt.rcParams.update(params)

    dx = (x[1]-x[0])/2.0
    dy = (y[1]-y[0])/2.0
    extent = [x[0]-dx, x[-1]+dx, y[0]-dy, y[-1]+dy]
    h = plt.imshow(np.flipud(scalpot), extent=extent, norm=colors.SymLogNorm(0.1))
    h.set_cmap('turbo')
    plt.contour(scalpot, clevels, extent=extent, colors='grey',
                negative_linestyles='solid', linewidths=1)
    if streamline:
        if len(streamseeds) == 0:
            plt.streamplot(xx,yy, -sy, -sx, broken_streamlines=False, 
                           density=0.3, linewidth=1, color='black')
        else:
            plt.streamplot(xx,yy, -sy, -sx, broken_streamlines=False, 
                           density=0.3, start_points=streamseeds.T,
                           linewidth=1, color='black')

    for k in range(len(q)):
        plt.plot(xs[k], ys[k], marker="o", markersize=4, 
                 markeredgecolor="black", markerfacecolor="black")
        qi = round(q[k])
        if qi == 1:
            chargetext = "$+q$"
        elif qi == -1:
            chargetext = "$-q$"
        else:
            chargetext = "$%+dq$"%q[k]
        plt.text(xs[k]+.18, ys[k], chargetext)
    plt.title(text)
    plt.xlabel(r"$x$ [m]")
    plt.ylabel(r"$y$ [m]")
    return plt

def mapPotentialForDipole(xg, yg, cntrlevels):
    """
    Map the scalar potential and associated electrostatic field for a dipole
    pair of charges placed at locations (x,y)=(0,-1) (negative charge) and
    (x,y)=(0,1) (positive charge).
    """

    """
    Define the charges and locations of the charges of the dipole.
    """
    q = np.array([1, -1])   # Charges '+q' and '-q'
    xs, ys = np.array([0, 0]), np.array([1, -1])

    """
    Electric dipole with E-field mapped (streamlines of potential).
    """
    text = r'Equipotential levels and ${\bf E}(x,y)=-\nabla\phi(x,y)$ of '\
            'electric dipole'
    thetaseeds0 = np.linspace(0.0,2*pi-pi/8.0,16)
    thetaseeds1 = np.linspace(pi+pi/8,2*pi-pi/8.0,8)
    xseeds = np.concatenate([xs[0]+0.4*np.cos(thetaseeds0),
                             xs[1]+0.4*np.cos(thetaseeds1)])
    yseeds = np.concatenate([ys[0]+0.4*np.sin(thetaseeds0),
                             ys[1]+0.4*np.sin(thetaseeds1)])
    streamseeds = np.array([xseeds, yseeds])
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels, text,
                      streamline=True, streamseeds=streamseeds)
    p.savefig("lindipole-str.eps", format='eps')
    p.savefig("lindipole-str.png", format='png')
    
    """
    Electric dipole with only potential (no streamlines).
    """
    text = r'Equipotential levels of $\phi(x,y)$ from electric dipole'
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels, text, streamline=False)
    p.savefig("lindipole.eps", format='eps')
    p.savefig("lindipole.png", format='png')
    return

def mapPotentialForLinearQuadrupole(xg, yg, cntrlevels):
    """
    Map the scalar potential and electric field for a linear quadrupole of
    charges placed at locations (x,y)=(0,-1) (positive charge +q), (x,y)=(0,0)
    (negative charge -2q), and (x,y)=(0,1) (positive charge +q).
    """

    """
    Define the charges and locations of the charges of the linear quadrupole.
    """
    q = np.array([1, -2, 1])   # Charges '+q', '-2q' and '+q'
    xs, ys = np.array([0, 0, 0]), np.array([-1, 0, 1])

    """
    Linear electric quadrupole with E-field mapped (streamlines of potential).
    """
    text = r'Equipotential levels and ${\bf E}(x,y)=-\nabla\phi(x,y)$ of '\
            'linear electric quadrupole'
    thetaseeds = np.linspace(0.0,2*pi-pi/8.0,16)
    xseeds = np.concatenate([xs[0]+0.2*np.cos(thetaseeds),
                             xs[2]+0.2*np.cos(thetaseeds),
                             np.array([-1.0, 1.0])])
    yseeds = np.concatenate([ys[0]+0.2*np.sin(thetaseeds),
                             ys[2]+0.2*np.sin(thetaseeds),
                             np.array([0.0, 0.0])])
    streamseeds = np.array([xseeds, yseeds])
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels, text,
                      streamline=True, streamseeds=streamseeds)
    p.savefig("linquadrupole-str.eps", format='eps')
    p.savefig("linquadrupole-str.png", format='png')
    
    """
    Linear electric quadrupole with only potential (no streamlines).
    """
    text = r'Equipotential levels of $\phi(x,y)$ from linear electric quadrupole'
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels, text, streamline=False)
    p.savefig("linquadrupole.eps", format='eps')
    p.savefig("linquadrupole.png", format='png')
    return

def mapPotentialForQuadraticQuadrupole(xg, yg, cntrlevels):
    """
    Map the scalar potential and electric field for a quadratic quadrupole of
    charges placed at locations (x,y)=(-1,-1) (positive charge +q),
    (x,y)=(1,-1) (negative charge -q), (x,y)=(1,1) (positive charge +q), and
    (x,y)=(-1,1) (negative charge -q).
    """

    """
    Define the charges and locations of the charges of the quadratic quadrupole.
    """
    q = np.array([1, -1, 1, -1])   # Charges '+q', '-q', '+q' and '-q'
    xs, ys = np.array([-1, 1, 1, -1]), np.array([-1, -1, 1, 1])

    """
    Quadratic electric quadrupole with E-field mapped (streamlines of potential).
    """
    text = r'Equipotential levels and ${\bf E}(x,y)=-\nabla\phi(x,y)$ of '\
            'quadratic electric quadrupole'
    thetaseeds0 = np.linspace(0.0,2*pi-pi/8.0,16)
    thetaseeds1 = np.linspace(pi+3.0*pi/8.0,3.0*pi-2.0*pi/8.0,12)
    thetaseeds2 = np.linspace(-pi/8.0,10.0*pi/8.0,12)
    thetaseeds3 = np.linspace(3.0*pi/8.0,9.0*pi/8.0,6)
    xseeds = np.concatenate([xs[0]+0.2*np.cos(thetaseeds0),
                             xs[1]+0.2*np.cos(thetaseeds1),
                             xs[2]+0.2*np.cos(thetaseeds2),
                             xs[3]+0.2*np.cos(thetaseeds3)])
    yseeds = np.concatenate([ys[0]+0.2*np.sin(thetaseeds0),
                             ys[1]+0.2*np.sin(thetaseeds1),
                             ys[2]+0.2*np.sin(thetaseeds2),
                             ys[3]+0.2*np.sin(thetaseeds3)])
    streamseeds = np.array([xseeds, yseeds])
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels, text,
                      streamline=True, streamseeds=streamseeds)
    p.savefig("quadquadrupole-str.eps", format='eps')
    p.savefig("quadquadrupole-str.png", format='png')
    
    """
    Quadratic electric quadrupole with only potential (no streamlines).
    """
    text = r'Equipotential levels of $\phi(x,y)$ from quadratic electric quadrupole'
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels, text, streamline=False)
    p.savefig("quadquadrupole.eps", format='eps')
    p.savefig("quadquadrupole.png", format='png')
    return

def main() -> None:
    """
    Generation of maps of potentials for various configurations of multipoles
    displayed in Lecture 8 of the series on Electromagnetics II (1TE626), for
    Engineering Physics (MSc level), Uppsala Universitet, 2022--.
    """

    """
    Define the grid over which the map of potentials is to be generated.
    """
    xmin, xmax, nx =-2.0, 2.0, 200
    ymin, ymax, ny =-2.0, 2.0, 200
    xg, yg = np.linspace(xmin, xmax, num=nx), np.linspace(ymin, ymax, num=ny)

    """
    Define the levels at which equipotential contours are to be extracted.
    """
    cntrlevels = [-1.6,-0.8,-0.4,-0.2,-0.1,0.0,0.1,0.2,0.4,0.8,1.6]

    """
    Generate maps of the scalar potential and static electric field lines
    for the electric dipole, the electric linear quadrupole and the electric
    quadratic quadrupole.
    """
    mapPotentialForDipole(xg, yg, cntrlevels)
    mapPotentialForLinearQuadrupole(xg, yg, cntrlevels)
    mapPotentialForQuadraticQuadrupole(xg, yg, cntrlevels)

    return

if __name__ == "__main__":
    main()
