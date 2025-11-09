# -*- coding: utf-8 -*-
"""
potentials.py

    Generation of maps of potentials illustrating the methof of images,
    displayed in Lecture 3 of the series on Electromagnetics II (1TE626),
    for Engineering Physics (MSc level), Uppsala Universitet, 2022--.

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

def phi(x, y, q, xs, ys, pottype=""):
    """
    Compute the scalar potential in point (x,y) given a set of N point sources
    of charge q_k located at (xs_k,ys_k).
    """
    nn = len(q)
    scalpot = np.zeros((len(y),len(x)))
    for jx in range(len(x)):
        for jy in range(len(y)):
            for k in range(nn):
                if pottype == "pointcharge":
                    scalpot[jy,jx] += q[k]/sqrt(pow(x[jx]-xs[k],2)+pow(y[jy]-ys[k],2))
                elif pottype == "linecharge":
                    scalpot[jy,jx] += q[k]*np.log(1.0/sqrt(pow(x[jx]-xs[k],2)+pow(y[jy]-ys[k],2)))
                else:
                    raise Exception("Unidentified option '%s'"%pottype)
    return scalpot

def plotPotential(x, y, q, xs, ys, clevels, pottype="", 
                  qlabels = [""], xlabel="", ylabel="",
                  text="", streamline=False, streamseeds=np.array([])):
    scalpot = phi(x, y, q, xs, ys, pottype=pottype)
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
        plt.text(xs[k]+.18, ys[k], qlabels[k])
    plt.title(text)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    return plt

def mapPotentialForPlanarMirror(filename):
    """
    Map the scalar potential and associated electrostatic field for a dipole
    pair of charges placed at locations (x,y)=(0,-1) (negative charge) and
    (x,y)=(0,1) (positive charge).
    """

    """
    Define the levels at which equipotential contours are to be extracted.
    """
    xmin, xmax, nx =-2.0, 2.0, 200
    ymin, ymax, ny =-2.0, 2.0, 200
    xg, yg = np.linspace(xmin, xmax, num=nx), np.linspace(ymin, ymax, num=ny)
    cntrlevels = [-1.6,-0.8,-0.4,-0.2,-0.1,0.0,0.1,0.2,0.4,0.8,1.6]

    """
    Define the charges and locations of the charges of the dipole.
    """
    q = np.array([1, -1])   # Charges '+q' and '-q'
    qlabels = ["$+q$","$-q$"]
    xs, ys = np.array([0, 0]), np.array([1, -1])

    """
    Electric dipole with E-field mapped (streamlines of potential).
    """
    text = r"Equipotential levels and ${\bf E}(x,y)=-\nabla\Phi(x,y)$ (planar mirror)"
    thetaseeds0 = np.linspace(0.0,2*pi-pi/8.0,16)
    thetaseeds1 = np.linspace(pi+pi/8,2*pi-pi/8.0,8)
    xseeds = np.concatenate([xs[0]+0.4*np.cos(thetaseeds0),
                             xs[1]+0.4*np.cos(thetaseeds1)])
    yseeds = np.concatenate([ys[0]+0.4*np.sin(thetaseeds0),
                             ys[1]+0.4*np.sin(thetaseeds1)])
    streamseeds = np.array([xseeds, yseeds])
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels,
                      pottype="pointcharge",
                      qlabels = qlabels,
                      xlabel = r"$x$ [m]",
                      ylabel = r"$z$ [m]",
                      text = text,
                      streamline=True, streamseeds=streamseeds)
    p.plot([-2,2],[0,0],'r--',lw=2)
    p.savefig(filename+"-efield.eps", format='eps')
    p.savefig(filename+"-efield.png", format='png')
    
    """
    Electric dipole with only potential (no streamlines).
    """
    text = r'Equipotential levels of $\phi(x,y)$ (planar mirror)'
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels,
                      pottype="pointcharge",
                      qlabels = qlabels,
                      xlabel = r"$x$ [m]",
                      ylabel = r"$z$ [m]",
                      text = text,
                      streamline=False)
    p.plot([-2,2],[0,0],'r--',lw=2)
    p.savefig(filename+"-potential.eps", format='eps')
    p.savefig(filename+"-potential.png", format='png')
    return

def mapPotentialForCylindricalMirror(filename):
    """
    Map the scalar potential and associated electrostatic field for a dipole
    pair of charges placed at locations (x,y)=(0,-1) (negative charge) and
    (x,y)=(0,1) (positive charge).
    """

    """
    Define the levels at which equipotential contours are to be extracted.
    """
    xmin, xmax, nx =-2.0, 2.0, 200
    ymin, ymax, ny =-1.0, 3.0, 200
    xg, yg = np.linspace(xmin, xmax, num=nx), np.linspace(ymin, ymax, num=ny)
    cntrlevels = [-1.6,-0.8,-0.4,-0.2,-0.1,0.0,0.1,0.2,0.4,0.8,1.6]

    """
    Define the line charges and locations.
    """
    h = 1.5
    r = 0.7
    d = r*r/(r+h)
    q = np.array([1, -1])   # Line charges '+lambda' and '-lambda'
    qlabels = ["$+\\lambda$","$-\\lambda$"]
    xs, ys = np.array([0, 0]), np.array([r+h, d])

    """
    Electric dipole with E-field mapped (streamlines of potential).
    """
    text = r"Equipotential levels and ${\bf E}(x,y)=-\nabla\Phi(x,y)$ (cylindric mirror)"
    thetaseeds0 = np.linspace(0.0,2*pi-pi/8.0,16)
    thetaseeds1 = np.linspace(pi+pi/8,2*pi-pi/8.0,8)
    xseeds = np.concatenate([xs[0]+0.4*np.cos(thetaseeds0),
                             xs[1]+0.4*np.cos(thetaseeds1)])
    yseeds = np.concatenate([ys[0]+0.4*np.sin(thetaseeds0),
                             ys[1]+0.4*np.sin(thetaseeds1)])
    streamseeds = np.array([xseeds, yseeds])
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels,
                      pottype="linecharge",
                      qlabels = qlabels,
                      xlabel = r"$y$ [m]",
                      ylabel = r"$x$ [m]",
                      text = text,
                      streamline=True, streamseeds=streamseeds)
    theta = np.linspace(0,2*3.141592652489793,1000)
    xcirc, ycirc = r*np.cos(theta), r*np.sin(theta)
    p.plot(xcirc,ycirc,'r--',lw=2)
    p.savefig(filename+"-efield.eps", format='eps')
    p.savefig(filename+"-efield.png", format='png')
    
    """
    Electric dipole with only potential (no streamlines).
    """
    text = r'Equipotential levels of $\phi(x,y)$ (cylindric mirror)'
    p = plotPotential(xg, yg, q, xs, ys, cntrlevels,
                      pottype="linecharge",
                      qlabels = qlabels,
                      xlabel = r"$y$ [m]",
                      ylabel = r"$x$ [m]",
                      text = text,
                      streamline=False)
    p.plot(xcirc,ycirc,'r--',lw=2)
    p.savefig(filename+"-potential.eps", format='eps')
    p.savefig(filename+"-potential.png", format='png')
    return

def main() -> None:
    """
    Generate maps of the scalar potential and static electric field lines
    for the imaging of a point charge in a perfectly conducting plane at z=0.
    """
    mapPotentialForPlanarMirror("planarmirror")

    """
    Generate maps of the scalar potential and static electric field lines
    for the imaging of a line charge in a perfectly conducting cylinder,
    centered at (x,y)=(0,0).
    """
    mapPotentialForCylindricalMirror("cylindricmirror")

    return

if __name__ == "__main__":
    main()
