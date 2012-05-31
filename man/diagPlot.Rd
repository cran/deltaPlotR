\name{diagPlot}
\alias{diagPlot}

\title{Plot of the Deltas points from the Delta Plot method}

\description{
 This command plots the output of the \code{\link{deltaPlot}} function as a diagonal plot of Deltas points. Several 
 graphical options are available.
}

\usage{
diagPlot(x, pch=2, pch.mult=17, axis.draw=TRUE, thr.draw=FALSE, dif.draw=c(1,3), 
 print.corr=FALSE, xlim=NULL, ylim=NULL, xlab=NULL, ylab=NULL,
 save.plot=FALSE, save.options=c("plot","default","pdf"))
}

\arguments{
 \item{x}{an object of class \code{"deltaPlot"}, typically the output of the \code{\link{deltaPlot}} function.}
 \item{pch}{integer: the usual point character type for point display. Default value is 2, that is, Delta points are 
            drawn as empty triangles.}
 \item{pch.mult}{integer: the typoe of point to be used for superposing onto Delta points that correspond to several
                 items. Default value is 17, that is, full black traingles are drawn onto existing Delta plots wherein
                 multiple items are located.}
 \item{axis.draw}{Logical: should the major axis be drawn? (default is \code{TRUE}). If so, it will be drawn as a solid
                  line.}
 \item{thr.draw}{logical: should the upper and lower bounds for DIF detection be drawn? (default is \code{FALSE}). If
                 \code{TRUE}, they will be drawn as dashed lines.}
 \item{dif.draw}{numeric: a vector of two integer values to specify how the DIF items should be displayed. The first 
                 component of \code{dif.draw} is the type of point (i.e. the usual \code{pch} argument) and the second
                 component determlines the point size (i.e. the usual \code{cex} argument). Default values are 1 and 3,
                 meaning that empty circles of three time the usual size are drawn around the Delta points of items
                 flagged as DIF.}
 \item{print.corr}{Logical: should the sample correlation of Delta scores be printed? (default is \code{FALSE}). If
                   \code{TRUE}, it is printed in upper-left corner of the plot.}
 \item{xlim, ylim, xlab, ylab}{either the usual plot arguments \code{xlim}, \code{ylim}, \code{xlab} and \code{ylab},
                               or \code{NULL} (default value for all arguments). If \code{NULL}, the X and Y axis limits
                               are computed from the range of Delta scores, and the X and Y axis labels are 
                               \code{"Reference group"} and \code{"Focal group"} respectively.}
 \item{save.plot}{logical: should the plot be saved in an external figure? (default is \code{FALSE}).}
 \item{save.options}{character: a vector of three components. The first component is the name of the output file, 
 the second component is either the file path or \code{"default"} (default), and the third component is the file 
 extension, either \code{"pdf"} (default) or \code{"jpeg"}. Ignored if \code{save.plot} is \code{FALSE}.}
}


\details{
The results of the Delta plot method can be graphically displayed using this function. Basqically the Delta plot displays
the items in a scatter plot by means of their Delta points, and the major axis is drawn. Several options permit to
enhance this basic plot.

The input data \code{x} must be a list of class \code{deltaPlot}, so typically the output of the \code{\link{deltaPlot}}
function. All other argumpents are rather standard and for optimization of the graphical display.

The type of point is defined by the \code{cex} argument. It takes the default value 2, which means that items are 
displayed with empty triangles. If several items are located on exactly the same Delta point, the \code{pch.mult} 
argument defines the type of point to display bover the existing point. The default value is 17, that is, a full black
triangle. In this way, multiple items located at a single Delta point can easily be located on the plot.

The types of axes can be dran: the major axis and the upper and lower bounds for DIF detection. The major axis is drawn by
default, while the upper and lower boun ds are not. The major axis can be withdrawn by setting the argument 
\code{axis.draw} to \code{FALSE}, and the bounds can be displayed by setting the argument \code{thr.draw} to \code{TRUE}.
The major axis is always drawn by a solid line, the bounds by dashed lines.

Items flagged as DIF are also clearly identified on the plot. The argument \code{dif.draw} defines both the type of point
and the size of the point to draw over the existing Delta points (for items flagged as DIF only). The defaulkt value is
\code{c(1,3)}, meaning that empty circles three times larger than usual are drawn. 

The sample correlation between the Delta scores can also be printed, in the upper-left corner of the plot. To do this, 
the argument \code{print.corr} must be set to  \code{TRUE}.

Finally, the function will automatically determines the X and Y axis limits and specifies default labels for X and Y axes.
These can obviously be specified by the user, using the usual \code{xlim}, \code{ylim}, \code{xlab} and \code{ylab}
arguments.

The plot can be saved in an external file, either as PDF or JPEG format. First, the argument \code{save.plot} must be set
to \code{TRUE} (default is \code{FALSE}). Then, the name of the figure, its location and format are specified through 
the argument \code{save.options}, all as character strings. See the \bold{Examples} section for further information and a 
practical example. 
}


\references{
Angoff, W. H. and Ford, S. F. (1973). Item-race interaction on a test of scholastic aptitude. \emph{Journal of
Educational Measurement}, 10, 95-106.

Magis, D., and Facon, B. (in press). Item purification does not always improve DIF detection: a counter-example with Angoff's Delta plot. \emph{Educational and Psychological Measurement}.

Magis, D., and Facon, B. (2012). Angoff's Delta method revisited: improving the DIF detection under small samples.
\emph{British Journal of Mathematical and Statistical Psychology, 65}, 302-321.
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

 # Basic Delta plot, threshold 1.5, no item purification
 res <- deltaPlot(data=verbal, type="response", group=25, focal.name=1, purify=FALSE, 
                  thr=1.5)

 # Keeping the first 10 items to exhibit DIF
 data <- verbal[,c(1:10,25)]
 res0 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=FALSE,
  thr="norm")
 res0 # Item 8 is flagged as DIF

 res1 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP3") 
 res1 # Items 6, 7 and 8 flagged as DIF after 4 iterations

 # Delta plot, default options
 diagPlot(res)
 diagPlot(res0)
 diagPlot(res1)

 # Drawing upper and lower bounds and removing the major axis
 diagPlot(res, axis.draw=FALSE, thr.draw=TRUE)
 diagPlot(res1, axis.draw=FALSE, thr.draw=TRUE)

 # Modifying the type of points for all and for DIF items
 diagPlot(res, pch=3, dif.draw=c(2,4))
 diagPlot(res1, pch=3, dif.draw=c(2,4))

 # Printing the correlation and modifying the axis limits
 diagPlot(res, xlim=c(9,20), ylim=c(9,20), print.corr=TRUE)
 diagPlot(res1, xlim=c(9,17), print.corr=TRUE)

 # Saving the plots as PDF and JPEG files, default folder, specific names
 diagPlot(res, save.plot=TRUE, save.options=c("res","default","pdf"))
 diagPlot(res1, save.plot=TRUE, save.options=c("res1","default","jpeg"))

 # Modifying the results to make two items be located on the same place
 res2<-res1
 res2$Deltas[9,]<-res2$Deltas[3,]
 diagPlot(res2)
}

