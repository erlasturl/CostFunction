

# Tobler´s hiking function

Tobler <- function(par, dataset){
  a <- par[1]
  b <- par[2]
  c <- par[3]
  Slope <- dataset$Slope
  Speed <- dataset$Speed
  SpeedPred <- a*exp(b*abs(Slope + c))
  Q <- sum((SpeedPred - Speed)**2, na.rm = T)
}

# Some starting values
par <- c(1.67, -3.5, 0.05)

# Minimizing the function to get parameter estimates
resTob2m <- nlminb(par, Tobler, dataset = mydata, lower = -Inf, upper = Inf)