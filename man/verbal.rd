\name{verbal}
\alias{verbal}

\docType{data}

\title{Verbal Aggression Data Set}

\description{
 The Verbal Aggression data set comes from Vansteelandt (2000) and is made of the responses of 316 subjects (243 women  and 73 men) to a questionnaire of 24 items, about verbal aggression. All items describe a frustrating situation together with a verbal agression response. A correct answer responses is coded as 0 and 1, a value of one meaning that the subject would (want to) respond to the frustrating situation in an aggressive way. In addition, the \emph{Trait Anger} score (Spielberger, 1988) was computed for each subject.
}

\format{
 The \code{verbal} matrix consists of 316 rows (one per subject) and 26 columns. 

 The first 24 columns hold the responses to the dichotomously scored items. The 25th column holds the trait anger score for each subject. The 26th column is vector of the group membership; values 0 and 1 refer to women and men, respectively.

 Each item name starts with \code{S} followed by a value between 1 and 4, referring to one of the situations below:

 \emph{S1}: A bus fails to stop for me.
 
 \emph{S2}: I miss a train because a clerk gave me faulty information.

 \emph{S3}: The grocery store closes just as I am about to enter.

 \emph{S4}: The operator disconnects me when I had used up my last 10 cents for a call.

 The second part of the name is either \emph{Want} or \emph{Do}, and indicates whether the subject wanted to respond to the situation or actually did respond. 

 The third part of the name is one of the possible aggressive responses, either \emph{Curse}, \emph{Scold} or \emph{Shout}.
 
 For example, item \code{S1WantShout} refers to the sentence: "a bus fails to stop for me. I want to shout". The corresponding
 item response is 1 if the subject agrees with that sentence, and 0 if not.
}

\source{
 The Verbal agression data set is taken originally from Vansteelandt (2000) and has been used as an illustrative example in De Boeck (2008), De Boeck and Wilson (2004) and Smits, De Boeck and Vansteelandt (2004), among others. The following URL \emph{http://bear.soe.berkely.edu/EIRM/} permits to get access to the full data set.
}

\note{
This data set was originally included in the \code{difR} package (Magis, Beland and Raiche, 2012). It is reproduced here for illustrative purposes.
}

\references{
 De Boeck, P. (2008). Random item IRT models. \emph{Psychometrika, 73}, 533-559.

 De Boeck, P. and Wilson, M. (2004). \emph{Explanatory item response models: a generalized linear and nonlinear approach}. New-York: Springer.

 Magis, D., Beland, S. and Raiche, G. (2012). \emph{difR:
  Collection of methods to detect dichotomous differential item functioning (DIF) in psychometrics}. R package version 4.2.

 Magis, D., Beland, S., Tuerlinckx, F. and De Boeck, P. (2010). A general framework and an R package for the detection
 of dichotomous differential item functioning. \emph{Behavior Research Methods, 42}, 847-862.

 Smits, D., De Boeck, P. and Vansteelandt, K. (2004). The inhibition of verbal aggressive behavior. \emph{European Journal of Personality, 18}, 537-555.

 Spielberger, C.D. (1988). \emph{State-trait anger expression inventory research edition. Professional manual}. Odessa, FL: Psychological Assessment Resources.

 Vansteelandt, K. (2000). \emph{Formal models for contextualized personality psychology}. Unpublished doctoral dissertation, K.U. Leuven, Belgium.
}


