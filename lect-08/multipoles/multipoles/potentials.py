# import dblquad from scipy integrate
from math import sqrt, pi, cos, sin
from scipy import ndimage
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors

'''
Compute the scalar potential in point (x,y) given a set of N point sources
of charge q_k located at (xs_k,ys_k).
'''
def phi(x, y, q, xs, ys):
    nn = len(q)
    scalpot = np.zeros((len(y),len(x)))
    for jx in range(len(x)):
        for jy in range(len(y)):
            for k in range(nn):
                scalpot[jy,jx] += q[k]/sqrt(pow(x[jx]-xs[k],2)+pow(y[jy]-ys[k],2))
    return scalpot

def plotPotential(x, y, q, xs, ys, clevels, text, streamline=False, streamseeds=np.array([])):
    scalpot = phi(x, y, q, xs, ys)

    # Get x- and y-gradients of the potential and compute the gradient.
#    dx = (max(x)-min(x))/(len(x)-1)
#    dy = (max(y)-min(y))/(len(y)-1)
#    yy, xx = np.mgrid[np.linspace(min(y),max(y),len(y)), np.linspace(min(x),max(x),len(x))]

    xx, yy = np.meshgrid(x,y)
    sx = ndimage.sobel(scalpot,axis=0,mode='constant')
    sy = ndimage.sobel(scalpot,axis=1,mode='constant')
    sobel=np.hypot(sy,sx)

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
    ctrplt = plt.contour(scalpot, clevels,
                      extent=extent, colors='grey',negative_linestyles='solid',
                      linewidths=1)
    if streamline:
        if len(streamseeds) == 0:
            strplt = plt.streamplot(xx,yy, -sy, -sx, broken_streamlines=False, 
                                density=0.3, linewidth=1, color='black')
        else:
            strplt = plt.streamplot(xx,yy, -sy, -sx, broken_streamlines=False, 
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

''' Computational domain for the potential '''
xmin, xmax, nx = -2.0, 2.0, 200
ymin, ymax, ny = -2.0, 2.0, 200
x = np.linspace(xmin, xmax, num=nx)
y = np.linspace(ymin, ymax, num=ny)

''' Levels at which equipotential contours are to be extracted '''
cntrlevels = [-1.6,-0.8,-0.4,-0.2,-0.1,0.0,0.1,0.2,0.4,0.8,1.6]

''' Point charges and their positions '''
# Electric dipole with E-field mapped (streamlines of potential)
text = r'Equipotential levels and ${\bf E}(x,y)=-\nabla\Phi(x,y)$ of electric dipole'
q = np.array([1, -1])   # Charges '+q' and '-q'
xs = np.array([0, 0])
ys = np.array([1, -1])
thetaseeds0 = np.linspace(0.0,2*pi-pi/8.0,16)
thetaseeds1 = np.linspace(pi+pi/8,2*pi-pi/8.0,8)
xseeds = np.concatenate([xs[0]+0.4*np.cos(thetaseeds0), xs[1]+0.4*np.cos(thetaseeds1)])
yseeds = np.concatenate([ys[0]+0.4*np.sin(thetaseeds0), ys[1]+0.4*np.sin(thetaseeds1)])
streamseeds = np.array([xseeds, yseeds])
p = plotPotential(x, y, q, xs, ys, cntrlevels, text, streamline=True, streamseeds=streamseeds)
p.savefig("lindipole-str.eps", format='eps')
p.savefig("lindipole-str.png", format='png')

# Electric dipole with only potential (no streamlines)
text = r'Equipotential levels of $\Phi(x,y)$ from electric dipole'
q = np.array([1, -1])   # Charges '+q' and '-q'
xs = np.array([0, 0])
ys = np.array([1, -1])
p = plotPotential(x, y, q, xs, ys, cntrlevels, text, streamline=False)
p.savefig("lindipole.eps", format='eps')
p.savefig("lindipole.png", format='png')

# Linear electric quadrupole with E-field mapped (streamlines of potential)
text = r'Equipotential levels and ${\bf E}(x,y)=-\nabla\Phi(x,y)$ of linear electric quadrupole'
q = np.array([1, -2, 1])   # Charges '+q', '-2q' and '+q'
xs = np.array([0, 0, 0])
ys = np.array([-1, 0, 1])
thetaseeds = np.linspace(0.0,2*pi-pi/8.0,16)
xseeds = np.concatenate([xs[0]+0.2*np.cos(thetaseeds),
                         xs[2]+0.2*np.cos(thetaseeds),
                         np.array([-1.0, 1.0])])
yseeds = np.concatenate([ys[0]+0.2*np.sin(thetaseeds),
                         ys[2]+0.2*np.sin(thetaseeds),
                         np.array([0.0, 0.0])])
streamseeds = np.array([xseeds, yseeds])
p = plotPotential(x, y, q, xs, ys, cntrlevels, text, streamline=True, streamseeds=streamseeds)
p.savefig("linquadrupole-str.eps", format='eps')
p.savefig("linquadrupole-str.png", format='png')

# Linear electric quadrupole with only potential (no streamlines)
text = r'Equipotential levels of $\Phi(x,y)$ from linear electric quadrupole'
q = np.array([1, -2, 1])   # Charges '+q', '-2q' and '+q'
xs = np.array([0, 0, 0])
ys = np.array([-1, 0, 1])
p = plotPotential(x, y, q, xs, ys, cntrlevels, text, streamline=False)
p.savefig("linquadrupole.eps", format='eps')
p.savefig("linquadrupole.png", format='png')

# Quadratic electric quadrupole with E-field mapped (streamlines of potential)
text = r'Equipotential levels and ${\bf E}(x,y)=-\nabla\Phi(x,y)$ of quadratic electric quadrupole'
q = np.array([1, -1, 1, -1])   # Charges '+q', '-q', '+q' and '-q'
xs = np.array([-1, 1, 1, -1])
ys = np.array([-1, -1, 1, 1])
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
p = plotPotential(x, y, q, xs, ys, cntrlevels, text, streamline=True, streamseeds=streamseeds)
p.savefig("quadquadrupole-str.eps", format='eps')
p.savefig("quadquadrupole-str.png", format='png')

# Quadratic electric quadrupole with only potential (no streamlines)
text = r'Equipotential levels of $\Phi(x,y)$ from quadratic electric quadrupole'
q = np.array([1, -1, 1, -1])   # Charges '+q', '-q', '+q' and '-q'
xs = np.array([-1, 1, 1, -1])
ys = np.array([-1, -1, 1, 1])
p = plotPotential(x, y, q, xs, ys, cntrlevels, text, streamline=False)
p.savefig("quadquadrupole.eps", format='eps')
p.savefig("quadquadrupole.png", format='png')
