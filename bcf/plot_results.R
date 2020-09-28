args <- commandArgs(TRUE)
ntrain <- as.double(args[1])
ncandidate <- as.double(args[2])
n_seqential <- as.double(args[3])
sigma <- as.double(args[4]) # observation noise of y
homogeneous <- as.double(args[5]) # 1 if true
linear <- as.character(args[6]) # 1 if linear
num_cv <- as.character(args[7]) # 1 if linear
which_experiment <- as.double(args[8]) # 1 or 2

fig_name = paste0("exp", which_experiment, "_", "sigma", sigma, "_", ntrain)
data_path = paste0("bcf/results/", fig_name, "_", num_cv, ".csv")
plot_path = paste0("bcf/plots/", fig_name, "/", fig_name, "_", num_cv, ".pdf")

results <- read.csv(data_path)

pdf(plot_path)
plot(0:n_seqential, 
  results$GPMean,
  col = "dodgerblue",
  cex = 0.2,
  ty = "l",
  ylim = c(2.5, 3.5),
  xlab = "x",
  ylab = "y",
  cex.lab = 1.3,
  cex.axis = 1.2,
  lwd = 1
)
polygon(c(0:n_seqential, rev(0:n_seqential)),
        c(
          results$GPMean + 2 * results$GPsd,
          rev(results$GPMean - 2 * results$GPsd)
        ),
        col = adjustcolor("dodgerblue", alpha.f = 0.10),
        border = NA
        # border = "dodgerblue",
        # lty = c("dashed", "solid")
)

points(results$BARTMean, ty = "l", col = "orangered", lwd = 1)
polygon(c(0:n_seqential, rev(0:n_seqential)),
        c(
          results$BARTMean + 2 * results$BARTsd,
          rev(results$BARTMean - 2 * results$BARTsd)
        ),
        col = adjustcolor("orangered", alpha.f = 0.10),
        border = NA
        # border = "orangered",
        # lty = c("dashed", "solid")
)


abline(h = results$actual[1])

legend("topright", legend = c("BART-Int", "GP-BQ", "Actual"),
       col = c("orangered", "dodgerblue", "black"), lty = c(1, 1, 1), cex = 0.8)


points(0:n_seqential, results$GPBQMean, col = 'green')

dev.off()