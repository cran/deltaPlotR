\name{deltaPlot}
\alias{deltaPlot}
\alias{print.deltaPlot}

\title{Delta Plot method for dichotomous DIF}

\description{
 This command computes the Delta plot statistics for dichotomous differential item functioning, with all associated
 output (Delta points, perpendicular distances). The modified Delta plot is also available, as well as several item
 purification techniques.
}

\usage{

deltaPlot(data, type="response", group, focal.name, thr="norm", purify=FALSE, 
 purType="IPP1", maxIter=10, alpha=0.05,extreme="constraint", 
 const.range = c(0.001, 0.999), nrAdd = 1, save.output=FALSE,
 output=c("out","default"))
\method{print}{deltaPlot}(x, only.final=TRUE, ...)
}

\arguments{
 \item{data}{numeric: either (a) the data matrix with item responses and group membership, (b) the two-column matrix
             of proportions of correct responses per item and per group, or (c) the two-column matrix of Delta scores.
             See \bold{Details}.}
 \item{type}{character: the type of \code{data} argument. Possible values are \code{"response"} (default), \code{"prop"}
             and \code{"delta"}. See \bold{Details}.}
 \item{group}{integer or character: a single value for locating the group membership column in the \code{data} argument.
             Ignored if \code{type} is not \code{"response"}. See \bold{Details}.}
 \item{focal.name}{numeric or character: the value used in the group membership column to refer to the focal group.
                   Ignored if \code{type} is not \code{"response"}. See \bold{Details}.}
 \item{thr}{numeric or character: the threshold for flagging items as DIF. Can be a positive numeric value or 
            \code{"norm"}. See \bold{Details}.}
 \item{purify}{logical: should item purification be performed? (Default is code{FALSE}). See \bold{Details}.}
 \item{purType}{character: the type of purification process to be run. Possible values are \code{"IPP1"} (default),
                \code{"IPP2"} and \code{"IPP3"}. Ignored if \code{purify} is \code{FALSE}. See \bold{Details}.}
 \item{maxIter}{integer: the maximum number of iteration in the purification process (default is 10). Ignored if
                \code{purify} is \code{FALSE}.}
 \item{alpha}{numeric: the significance level for calculating the detection threshold (default is 0.05). Ignored if 
              \code{thr} is numeric.}
 \item{extreme}{character: the method used to modify the extreme proportions. Possible values are \code{"constraint"}
               (default) or \code{"add"}. See \bold{Details}.}
 \item{const.range}{numeric: a vector of two constraining proportions. Default values are 0.001 and 0.999. Ignored if
                    \code{extreme} is \code{"add"}.}
 \item{nrAdd}{integer: the number of successes and the number of failures to add to the data in order to adjust the
              proportions. Default value is 1. Ignored if \code{extreme} is \code{"constraint"}.}
 \item{save.output}{logical: should the output be saved into a text file? (Default is \code{FALSE}).}
 \item{output}{character: a vector of two components. The first component is the name of the output file (\code{"out"}
               by default), the second component is either the file path or \code{"default"} (default value). See 
               \bold{Details}.}
 \item{x}{an object of class \code{"deltaPlot"}, typically the output of the \code{deltaPlot} function.}
 \item{only.final}{logical: should only the first and last steps of the purification process be printed? (default is 
                   \code{TRUE}. If \code{FALSE} all perpendicular distances, parameters of the major axis, and 
                   detection thresholds are printed additionally. Ignored if \code{purify} is \code{FALSE}.}
 \item{...}{other generic parameters for the \code{plot} or the \code{print} functions.}
}

\value{
 A list of class \code{"deltaPlot"} with the following arguments:
  \item{Props}{the matrix of proportions of correct responses, or \code{NA} if \code{type} is \code{"delta"}.}
  \item{adjProps}{the restricted proportions, in the same format as the output \code{Props} matrix, or \code{NA}
                  if \code{type} is \code{"delta"}.}
  \item{Deltas}{the matrix of Delta scores.}
  \item{Dist}{a matrix with perpendicular distances, one row per item and one column per run of the Delta plot. If
              \code{purify} is \code{FALSE}, only a single column is returned.}
  \item{axis.par}{a matrix with two columns, holding respectively the intercepts and the slope parameters of the major
                 axis. Each row refers to one step of the purification process. If \code{purify} is \code{FALSE},
                 only a single row is returned.}
  \item{nrIter}{the number of iterations invloved in the purification process. Returned only if \code{purify} is 
                \code{TRUE}.}
  \item{maxIter}{the value of the \code{maxIter} argument. Returned only if \code{purify} is \code{TRUE}.}
  \item{convergence}{a logical value indicating whether convergence was reached in the purification process. Returned 
                     only if \code{purify} is \code{TRUE}.}
  \item{difPur}{a matrix with one column per item and one row per iteration in the purification process, holding zeros
                and ones to indicate which items were flagged as DIF or not at each step of the process. Returned only
                if \code{purify} is \code{TRUE}.}
  \item{thr}{a vector of successive threshold values used during the purification process. If \code{purify} is
             \code{FALSE}, a single value is returned.}
  \item{rule}{a character value indicating whether the threshold was \code{"fixed"} by the user (i.e. by setting 
             \code{thr} to a numeric value) or whether it was computed by normal approximation (i.e. by setting
             \code{thr} to \code{"norm"}).}
  \item{purType}{the value of the \code{purType} argument. Returned only if \code{purify} is \code{TRUE}.}
  \item{DIFitems}{either \code{"No DIF item detected"} or an integer vector with the items that were flagged as DIF.}
  \item{adjust.extreme}{the value of the \code{extreme} argument.}
  \item{const.range}{the value of the \code{const.range} argument.}
  \item{nrAdd}{the value of the \code{nrAdd} argument.}
  \item{purify}{the value of the \code{purify} argument.}
  \item{alpha}{the value of the \code{alpha} argument.}
  \item{save.output}{the value of the \code{save.output} argument.}
  \item{output}{the value of the \code{output} argument.}
}

\details{
Angoff's Delta plot (Angoff and Ford, 1973) is a straightforward test-score method to detect DIF among dichotomously 
scored items. Proportions of correct responses are computed first per item and per group of respondents, and are 
successively transformed onto \emph{z}-scores and then onto \eqn{\Delta} scores. The pairs of \eqn{\Delta} scores can
be displayed onto a scatter plot, called the \emph{Delta plot}, and the majr axis of the ellipsoid of Delta points is
derived. Eventually, items whose perpendicular distance (from the major axis) is too large are flagged as DIF. See 
Angoff and Ford (1973) for further details.

The data must be passed through the argument \code{data} and can be of three types. Each type is defined by the 
\code{type} argument and can take three values: \code{"response"}, \code{"prop"} and \code{"delta"}.
\itemize{
\item If \code{type} is \code{"response"}, the input \code{data} consist in a matrix with one row per respondent and
\eqn{J+1} columns, where \eqn{J} is the number of items. In the colmuns coding for the items, only possible entries are 0
(for incorrect responses), 1 (for corect responses) and \code{NA} (for missing values). The extra column is used to
define group membership: all respondents of the reference group take the same value (either numeric or character), and all
respondents in the focal group take the same (numeric or character) value but different from the reference group. Note 
that the group membership column can be located anywhere in the data set (not especially in first or last position).
\item If \code{type} is \code{"prop"}, the input \code{data} consist in a two-column matrix with one row per item. Each
row contains the proportions of correct responses, respectively in the reference group (first column) and in the focal
group (second column). 
\item If \code{type} is \code{"delta"}, the input \code{data} consist in a two-column matrix that is similar to that
provided with the \code{"prop"} type of input, but with the Delta scores provided instead of the proportions of correct
responses.
}

If the \code{type} of input is either \code{"prop"} or \code{"delta"}, not anymore input information is required and the
arguments \code{group} and \code{focal.bname} are ignored. Otherwise, the group membership column in the \code{data}
matrix is specified by giving to argument \code{group} either the column number (1 for first column, etc.) or the column
name (provided the \code{data} matrix has argument names). Moreover, the focal group is specified by giving to the
argument \code{focal.name} the value that was used in the group membership column to code for the focal group.

If the input \code{type} is not \code{"delta"}, then extreme proportions of correct responses (either provided when 
\code{type} is \code{"prop"} or computed from the data if \code{type} is \code{"response"}) are adjusted by specifying
the arguments \code{extreme}, \code{const.range} and \code{nrAdd} with appropriate values. See the 
\code{\link{adjustExtreme}} function for further details (note that the cuyrrent \code{extreme} argument corresponds to
the \code{method} argument in this function).

The threshold for flaging items as DIF can be of two types and is specified by the \code{thr} argument.
\enumerate{
\item It can be fixed to some arbitrary positive value by the user, for instance 1.5 (Angoff and Ford, 1973). In this 
case, \code{thr} takes the required numeric threshold value.
\item Alternatively, it can be derived from the bivariate normal approximation of the Delta points (Magis and Facon, 2012). In this case, \code{thr} must be given the character value \code{"norm"} (which is the default value).
This threshold equals
\deqn{\Phi^{-1}(1-\alpha/2) \; \sqrt{\frac{b^2\,{s_0}^2-2\,b\,s_{01}+{s_1}^2}{b^2+1}}}
where \eqn{\Phi} is the density of the standard normal distribution, \eqn{\alpha} is the significance level (set by the
argument \code{alpha} with default value 0.05), \eqn{b} is the slope parameter of the major axis, \eqn{s_0} and \eqn{s_1}
are the sample standard deviations of the Delta scores in the reference group and the focal group, respecively, and
\eqn{s_{01}} is the sample covariance of the Delta scores (see Magis and Facon, 2012, for further details).
}

Item purification can be performed by setting the argument \code{purify} to \code{TRUE} (by default it is \code{FALSE} so 
no purification is performed). The item purification process (IPP) starts when at least one item was flagged as DIF after
the first run of the Delta plot, and proceeds as follows.
\enumerate{
\item The intercept and slope parameters of the major axis are re-calculated by removing all DIF that are currently 
flagged as DIF. This yields updated values \eqn{a^*}, \eqn{b^*}, \eqn{s_0^*}, \eqn{s_1^*} and \eqn{s_{01}^*} of the 
intercept and slope parameters, sample stanbdard deviations and sample covariance of the Delta scores.
\item Perpendicular distances (for all items) are updated with respect to the updated major axis.
\item Detection threshold is also updated. Three possible updates are possible: see below.
\item All items are now tested for the presence of DIF, given the updated perpendicular distances and major axis.
\item If the set of items flagged as DIF is the same as the one from the previous loop, stop the process. Otherwise go
back to step 1.
}

Unlike traditional DIF methods, the detection threshold may also be updated since it depends on the sample estimates (when 
the normal approximation is considered). Three approaches are currently implemented and are specified by the 
\code{purType} argument.
\enumerate{
\item Method 1 (\code{purType=="IPP1"}): the same threshold is used throughout the purification process, it is not
iteratively updated. The threshold is the one obtained after the first run of the Delta plot.
\item Method 2 (\code{purType=="IPP2"}): only the slope parameter is updated in the threshold formula. By this way, one
keeps the full data structure (i.e. neither the sample variances nor the sample covariance of the Delta scores are 
modified) but only the slope parameter is adjusted to lessen the impact of DIF items.
\item Method 3 (\code{purType=="IPP3"}): all adjusted parameters are plugged in the threshold formula. This approach
completely discards the effect of items flagged as DIF from the computation of the threshold.
}
See Magis and Facon (2013) for further details. Note that purification can also be performed with fixed threshold (i.e.
specified by the user), but then only IPP1 process is performed.

In order to avoid possible infinite loops in the purification process, a maximal number of iterations must be specified
through the argument \code{maxIter}. The default maximal number of iterations is 10. 

The output contains all input information, the Delta scores and perpendicular distances, the parameter of the major axis
and the items flagged as DIF (if none, a character sentence is returned). In addition, the detection threshold and the
type of threshold (fixed or normal approximation) is provided. 

If item purification was run, several additional elements are returned: the number of iterations, a logical indicator
whether the convergence was reached (or not, meaning that the process stopped because of reaching the maximal number of 
allowed iterations), a matrix with indicators of which items were flagged as DIF at each iteration, and the type of item
purification process. Moreover, perpendicular distances are returned in a matrix format (one column per iteration), as
well as successive major axis parameters (one row per iteration) and successive thresholds (as a vector).

The output is managed and printed in a more user-friendly way. When item purification is performed, only the first and
last steps are displayed. Specifying the argument \code{only.final} to \code{FALSE} prints in addition all intermediate 
steps of the process (successive perpendicular distances, parameters of the major axis, and detection thresholds).

The output can be saved into na text file by specifying the argument \code{save.output} to \code{TRUE} (by default the 
output is not captured). If so, the argument \code{output} can be specified as a vector of two character values. The first
one gives the desired name of the text file, and the second one specifies the directory where the file will be saved (full
path is required). By default, the output will be saved in the current working directory as "out.txt" file.
}

\references{
Angoff, W. H. and Ford, S. F. (1973). Item-race interaction on a test of scholastic aptitude. \emph{Journal of
Educational Measurement}, 10, 95-106.

Magis, D., and Facon, B. (2012). Angoff's Delta method revisited: improving the DIF detection under small samples.
\emph{British Journal of Mathematical and Statistical Psychology, 65}, 302-321.

Magis, D., and Facon, B. (2013). Item purification does not always improve DIF detection: a counter-example with Angoff's Delta plot. \emph{Educational and Psychological Measurement, 73}, 293-311.
}
 

\seealso{
\code{\link{adjustExtreme}}
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

 # Basic Delta plot, threshold 1.5, no item purification
 res <- deltaPlot(data=verbal, type="response", group=25, focal.name=1, purify=FALSE, 
                  thr=1.5)

 # Equivalent writing
 res <- deltaPlot(data=verbal, type="response", group="Gender", focal.name=1, 
                  purify=FALSE, thr=1.5)

 # Using proportions of correct responses as input
 dataRef <- verbal[verbal[,25]==0,1:24]
 dataFoc <- verbal[verbal[,25]==1,1:24]
 p0 <- colMeans(dataRef)
 p1 <- colMeans(dataFoc)
 res.1 <- deltaPlot(data=cbind(p0,p1), type="prop", purify=FALSE, thr=1.5)

 # Using Delta values as input
 Delta <- 4*qnorm(1-cbind(p0,p1))+13
 res.2 <- deltaPlot(data=Delta, type="delta", purify=FALSE, thr=1.5)

 # 'norm' threshold
 res <- deltaPlot(data=verbal, type="response", group="Gender", focal.name=1, 
                  purify=FALSE, thr="norm")

 # Keeping the first 10 items to exhibit DIF
 data <- verbal[,c(1:10,25)]
 deltaPlot(data=data, type="response", group=11, focal.name=1, purify=FALSE, thr="norm")
   # Item 8 is flagged as DIF

 # Item purification with the three processes
 res0 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr=1.5, purType="IPP1") 
 res0 # No DIF item detected

 res1 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP1") 
 res1 # Item 8 flagged as DIF after 2 iterations

 res2 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP2") 
 res2 # Item 8 flagged as DIF after 2 iterations

 res3 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP3") 
 res3 # Items 6, 7 and 8 flagged as DIF after 4 iterations

 # Printing the full results of item purification
 print(res, only.final=FALSE)
 print(res0, only.final=FALSE)
 print(res1, only.final=FALSE)
 print(res2, only.final=FALSE)
 print(res3, only.final=FALSE)
}

