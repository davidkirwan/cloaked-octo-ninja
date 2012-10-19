# mandel.R
# code to compute the mandelbrot set in R
# Copyright (c) 2009 Darren Wilkinson

imin=-1; imax=1; rmin=-2; rmax=0.5
rows=500; cols=500
xmat=matrix(0,nrow=rows,ncol=cols)
cmat=(imin+(imax-imin)*col(xmat)/cols)*(1i)+(rmin+(rmax-rmin)*row(xmat)/rows)
for (i in 1:100) {
	xmat=xmat*xmat+cmat
	xmat[abs(xmat)>50]=50
}
image(abs(xmat),axes=FALSE)
# eof

