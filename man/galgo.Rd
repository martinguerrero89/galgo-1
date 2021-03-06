% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/galgo_main.R
\name{galgo}
\alias{galgo}
\title{GalgoR main function}
\usage{
galgo(population = 30, generations = 2, nCV = 5, usegpu = FALSE,
  distancetype = "pearson", TournamentSize = 2, period = 1825, OS,
  prob_matrix, res_dir = "results/",
  save_pop_partial_callback = base_save_pop_partial_callback,
  save_pop_final_callback = base_save_pop_final_callback,
  report_callback = base_report_callback,
  start_gen_callback = base_start_gen_callback,
  end_gen_callback = base_end_gen_callback, verbose = 2)
}
\arguments{
\item{population}{a number indicating the number of solutions in the population of solutions that will be evolved}

\item{generations}{a number indicating the number of iterations of the galgo algorithm}

\item{nCV}{number of cross-validation sets}

\item{usegpu}{\code{logical} default to \code{FALSE}, set to \code{TRUE} if you wish to use gpu computing (\code{\link[gpuR]{gpuR}} package must be properly installed and loaded)}

\item{distancetype}{character, it can be \code{'pearson'} (centered pearson), \code{'uncentered'} (uncentered pearson), \code{'spearman'} or \code{'euclidean'}}

\item{TournamentSize}{a number indicating the size of the tournaments for the selection procedure}

\item{period}{a number indicating the outcome period to evaluate the RMST}

\item{prob_matrix}{a \code{matrix} or \code{data.frame}. Must be an expression matrix with features in rows and samples in columns}

\item{res_dir}{a \code{character} string indicating where to save the intermediate and final output of the algorithm}

\item{save_pop_partial_callback}{optional callback function between iterations}

\item{save_pop_final_callback}{optional callback function for the last iteration}

\item{report_callback}{optional callback function}

\item{start_gen_callback}{optional callback function for the beginning of the run}

\item{end_gen_callback}{optional callback function for the end of the run}

\item{verbose}{}
}
\value{
an object of type \code{'galgo.Obj'} that corresponds to a list with the elements \code{$Solutions} and \code{$ParetoFront}. \code{$Solutions} is a \eqn{l x (n + 5)} matrix where \eqn{n} is the number of features evaluated and \eqn{l} is the number of solutions obtained.
The submatrix \eqn{l x n} is a binary matrix where each row represents the chromosome of an evolved solution from the solution population, where each feature can be present (1) or absent (0) in the solution. Column \eqn{n +1} represent the  \eqn{k} number of clusters for each solutions. Column \eqn{n+2} to \eqn{n+5} shows the SC Fitness and Survival Fitness values, the solution rank, and the crowding distance of the solution in the final pareto front respectevely.
For easier interpretation of the \code{'galgo.Obj'}, the output can be reshaped using the \code{\link[galgoR:toList]{toList}} and \code{\link[galgoR:toDataFrame]{toDataFrame}} functions
}
\description{
\code{\link[galgoR:galgo]{galgo}} accepts an expression matrix and a survival object to find robust gene expression signatures related to a given outcome
}
\examples{
rna_luad<-use_rna_luad()
library(Biobase)
prm <- exprs(rna_luad$TCGA)
clinical <- pData(rna_luad$TCGA)
OS <- survival::Surv(time=clinical$time,event=clinical$status)
output <- galgo(generations = 10, population = 30,prob_matrix = prm, OS=OS)
outputDF <- toDataFrame(output)
outputList <- toList(output)
}
\author{
Martin E Guerrero-Gimenez, \email{mguerrero@mendoza-conicet.gob.ar}
}
