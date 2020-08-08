# Matthew Liew Van Keys
# Leonie Kreis


# Exercise 3 -------------------------------------------------------------


# 1) Generating the data -------------------------------------------------
set.seed(1)
# Solution to generate the data
I <- 200
J <- 10000
n <- I*J
sample <- rpois(n, 1)

# 2) Calculation  --------------------------------------------------------

# Solution to calculate the statistic
stat <- function(I,J, sample){
  S <- numeric(length=I)
  for(i in 1:I){
    a <- ((i-1)*J +1)
    e <- i*J
    R <- sample[a:e]
    
    S[i] <- 100*(1/J * sum(R) -1)
  }
  return(S)
}

S <- stat(I,J, sample)

# 3) Plotting 1 ----------------------------------------------------------

# Solution histogram

#plot(1:I, S)
hist(S, freq=F, breaks = 12)



# 4) Plotting 2 ----------------------------------------------------------

# Solution histogram with density

dnorm01 <- function(x){return(dnorm(x,0,1))}
curve(dnorm01, -3, 3, add = TRUE)



# Exercise 4 -------------------------------------------------------------
set.seed(12)
library("tictoc")


# 1) Generating the data -------------------------------------------------
I <- 10000
J <- 1600
data <- matrix(runif(I*J, min= 0, max=1),I,J)

# 2) Calculation and Histo -----------------------------------------------
## Following will take about 2 minutes to run.

S_r <- matrix(0, I, J)

for(i in 1:I){
  for(j in 1:40){
    for(n in 1:40*j){
      S_r[i,n] <- sqrt(n)*(max(data[i,1:n])-1)
    }
  }
}

for(i in 1:4){
  hist(S_r[,i*400], main = i*400, prob = TRUE)
}

# 3) Emp variance and plot -----------------------------------------------

Empvar <- c(1:1600)*0

for(j in 1:40){
  for(n in 1:40*j){
  Empvar[n] <- var(S_r[,n])
  }
}

x <- c(1:1600)
y <- Empvar

plot(x,y,main="Empirical Variance", ylim = c(0,0.02))

# 4) Asymptotic ----------------------------------------------------------
S_A <- matrix(0, 1, 200)

for(i in 1:200){
  for(j in 1:40){
    for(n in 1:40*j){
      S_A[1,i] <- 1000*(1- max(data[i,1:n]))
    }
  }
}

hist(S_A, prob = TRUE, main = "Asymptotic")
curve(dexp(x, rate = 1), col = 2, lty = 2, lwd = 2, add = TRUE)
