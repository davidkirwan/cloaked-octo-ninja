#https://stat.ethz.ch/pipermail/r-help/2008-July/168230.html
#fill in area between 2 lines with a color

age <- 1:10
y.low <- rnorm(length(age), 150, 25) + 10*age
y.high <- rnorm(length(age), 250, 25) + 10*age

plot(age,y.high,type = 'n', ylim = c(100, 400),
     ylab = 'Y Range', xlab = 'Age (years)')
lines(age, y.low, col = 'grey')
lines(age, y.high, col = 'grey')

polygon(c(age, rev(age)), c(y.high, rev(y.low)),
     col = "grey30", border = NA)
