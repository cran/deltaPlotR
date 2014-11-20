\name{adjustExtreme}
\alias{adjustExtreme}

\title{Adjusting the proportions of correct responses for extreme cases}

\description{
 This command modifies the proportions of correct responses when these equal either zero or one, for compatibility 
 with the Delta plot.  
}

\usage{
adjustExtreme(data = NULL, group = NULL, focal.name = NULL, prop, 
 method = "constraint", const.range = c(0.001, 0.999), nrAdd = 1)
}

\arguments{
 \item{data}{numeric: the data matrix: one row per subject, one column per item, with possible entries 0, 1 or NA. Default value is \code{NULL}.}
 \item{group}{numeric or character: a vector of the same length as \code{nrow(data)} with two different values, one for the reference group, one for the focal group. Values can be either numeric or character. Default value is \code{NULL}.}
 \item{focal.name}{numeric or character: the value used in the \code{group} vector to refer to the focal group. Default
                   value is \code{NULL}.}
 \item{prop}{numeric: a matrix with one row per item and two columns. The first column holds the percentage of correct responses for each item in the reference group, and the second column holds the same percentages but for the focal group.}
 \item{method}{character: the method used to modify the extreme proportions. Possible values are \code{"constraint"} (default) or \code{"add"}. See \bold{Details}.}
 \item{const.range}{numeric: a vector of two constraining proportions. Default values are 0.001 and 0.999. Ignored if \code{method} is \code{"add"}.}
 \item{nrAdd}{integer: the number of successes and the number of failures to add to the data in order to adjust the proportions. Default value is 1. Ignored if \code{method} is \code{"constraint"}.}
}

\value{
 A list with the following arguments:
  \item{adj.prop}{the restricted proportions, in the same format as the input \code{prop} matrix.}
  \item{method}{the value of the \code{method}argument or \code{"constraint"} if the latter was applied by lack of data.}
  \item{range}{the value of the \code{const.range} argument.}
  \item{nrAdd}{the value of the \code{nrAdd} argument.}
 }

\details{
The Delta plot method requires the computation of the proportions o correct responses per item and per group. However, these proportions must be stricly greater than zero and smaller than one, since they are transformed onto \emph{z}-scores. Thus, extreme proportions must be adjusted for proper use of the Delta plot. 

Two approaches are currently implemented and set to \code{adjustExtreme} by the \code{method} argument.

The first method is the \emph{constraint} method and is set by \code{method="constraint"}. It simply consists in constraining the proportions within a specified range of values in (0,1). This restricted range of values is set by the \code{const.range} argument and takes the default value \code{c(0.001, 0.999)}.

The second method is the so-called \emph{add} method and is specified by \code{method="add"}. It consists in rabitrarily
adding some successes and the same number of failures to the data, in order to get a modified proportion of successes. 
This number of extra successes is set by the \emph{nrAdd} argument, with default value one. In sum, by default one success one failure is added to the item responses, so that the newly computed proportion of successes is not extreme anymore, yet close to the original value. This default values refers to the so-called Laplace rule (see e.g. Jaynes, 2003). 

The input arguments are: the data matrix of item responses (ith possible entries 0, 1 and \code{NA} for missing data), 
the vector of group memebership and the numeric (or character) value coding for the focal group. By default they take the
\code{NULL} value so they can be left unassigned, but then only the "constraint" method can be applied. In any case, the
matrix of proportions of correct responses per item and per group of respondents must be specified through the 
\code{prop} argument.
}

\references{
Angoff, W. H. and Ford, S. F. (1973). Item-race interaction on a test of scholastic aptitude. \emph{Journal of
Educational Measurement}, 10, 95-106.

Jaynes, E.T. (2003). \emph{Probability theory: The logic of science}. Cambridge, UK: Cambridge University Press.

Magis, D., and Facon, B. (2012). Angoff's Delta method revisited: improving the DIF detection under small samples.
\emph{British Journal of Mathematical and Statistical Psychology, 65}, 302-321.

Magis, D. and Facon, B. (2014). \emph{deltaPlotR}: An R Package for Differential Item Functioning Analysis with Angoff's Delta Plot. \emph{Journal of Statistical Software, Code Snippets, 59(1)}, 1-19. URL \url{http://www.jstatsoft.org/v59/c01/}
}
 

\seealso{
\code{\link{deltaPlot}}
}

\author{
    David Magis \cr
    Post-doc Fellow of the National Funds for Scientific Research (FNRS, Belgium) \cr
    University of Liege \cr
    \email{David.Magis@ulg.ac.be}, \url{http://ppw.kuleuven.be/okp/home/} \cr
    Bruno Facon\cr
    Professor, Department of Psychology \cr
    Universite Lille-Nord de France\cr
    \email{bruno.facon@univ-lille3.fr}, \cr 
    }

\examples{

 # Loading of the verbal data
 data(verbal)
 attach(verbal)

 # Excluding the "Anger" variable
 verbal <- verbal[colnames(verbal)!="Anger"]

 # Computing the proportions of correct answers per group
 prop <- matrix(NA, 24, 2)
 for (i in 1:24){
  prop[i,1] <- mean(verbal[verbal[,25]==0,i], na.rm=TRUE)
  prop[i,2] <- mean(verbal[verbal[,25]==1,i], na.rm=TRUE)
 }

 # "constraint" method
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop)

 # "constraint" method with differently specified range
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop,
  const.range=c(0.01,0.99))

 # "add" method
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop,
  method="add")

 # "add" method with different number of successes added
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop,
  method="add", nrAdd=2)

 # "constraint" method because of lack of provided data
 adjustExtreme(prop=prop)
}



