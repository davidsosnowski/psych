\name{sim}
\alias{sim}
\alias{sim.simplex}
\alias{sim.minor}



\title{Functions to simulate psychological/psychometric data.}
\description{A number of functions in the psych package will generate simulated data with particular structures. The three documented here are for basic factor analysis simulations.  These functions include
\code{\link{sim}} for a factor simplex, and \code{\link{sim.simplex}} for a data simplex, and \code{\link{sim.minor}} to simulate major and minor factors.  

Other simulations aimed at special item structures include  \code{\link{sim.circ}} for a circumplex structure, \code{\link{sim.congeneric}} for a one factor factor congeneric model, \code{\link{sim.dichot}} to simulate dichotomous items, \code{\link{sim.hierarchical}} to create a hierarchical factor model, \code{\link{sim.item}} a more general item simulation are documented is separate help files.  They are listed here to help find them.

\code{\link{sim.omega}} to test various examples of omega,
\code{\link{sim.parallel}} to compare the efficiency of various ways of deterimining the number of factors.   See the help pages for some more simulation functions here: 
\code{\link{sim.rasch}} to create simulated rasch data, 
\code{\link{sim.irt}} to create general 1 to 4 parameter IRT data by calling 
\code{\link{sim.npl}} 1 to 4 parameter logistic IRT or 
\code{\link{sim.npn}} 1 to 4 paramater normal IRT,
\code{\link{sim.poly}} to create polytomous ideas by calling
\code{\link{sim.poly.npn}} 1-4 parameter polytomous normal theory items or
\code{\link{sim.poly.npl}} 1-4 parameter polytomous logistic items, and 
\code{\link{sim.poly.ideal}} which creates data following an ideal point or unfolding model by calling 
\code{\link{sim.poly.ideal.npn}} 1-4 parameter polytomous normal theory ideal point model or 
\code{\link{sim.poly.ideal.npl}} 1-4 parameter polytomous logistic ideal point model.

\code{\link{sim.structural}} a general simulation of structural models,  and \code{\link{sim.anova}} for ANOVA and lm simulations, and \code{\link{sim.VSS}}. Some of these functions are separately documented and are listed here for ease of the help function.  See each function for more detailed help.
}
\usage{
sim(fx=NULL,Phi=NULL,fy=NULL,alpha=.8,lambda = 0,n=0,mu=NULL,raw=TRUE)
sim.simplex(nvar =12, alpha=.8,lambda=0,beta=1,mu=NULL, n=0)
sim.minor(nvar=12,nfact=3,n=0,g=NULL,fbig=NULL,fsmall = c(-.2,.2),bipolar=TRUE) 

}
\arguments{
  \item{fx}{The measurement model for x. If NULL, a 4 factor model is generated}
  \item{Phi}{The structure matrix of the latent variables}
  \item{fy}{The measurement model for y}
  \item{mu}{The means structure for the fx factors}
  \item{n}{ Number of cases to simulate.  If n=0 or NULL, the population matrix is returned.}
  \item{raw}{if raw=TRUE, raw data are returned as well.}
  \item{nvar}{Number of variables for a simplex structure}
  \item{nfact}{Number of large factors to simulate in sim.minor,number of group factors in sim.general,sim.omega}
  \item{g}{General factor correlations in sim.general and general factor loadings in sim.omega and sim.minor}
 
  \item{alpha}{the base correlation for an autoregressive simplex}
  \item{lambda}{the trait component of a State Trait Autoregressive Simplex}
  \item{beta}{Test reliability of a STARS simplex}
  \item{fbig}{Factor loadings for the main factors.  Default is a simple structure with loadings sampled from (.8,.6) for nvar/nfact variables and 0 for the remaining.  If fbig is specified, then  each factor has loadings sampled from it.}
  \item{bipolar}{if TRUE, then positive and negative loadings are generated from fbig}
  \item{fsmall}{nvar/2 small factors are generated with loadings sampled from e.g. (-.2,0,.2)}
  
   }
   


\details{Simulation of data structures is a very useful tool in psychometric research and teaching.  By knowing ``truth" it is possible to see how well various algorithms can capture it.  For a much longer discussion of the use of simulation in psychometrics, see the accompany vignettes.  

The simulations documented here are the core set of functions.  Others are documented in other help files.

\code{\link{sim}} simulates one (fx) or two (fx and fy) factor structures where both fx and fy respresent factor loadings of variables.  The use of fy is particularly appropriate for simulating sem models.  This is better documentated in the help for \code{\link{sim.structural}}.

Perhaps the easist simulation to understand is just \code{\link{sim}}.  A factor model (fx) and perhaps fy with intercorrelations between the two factor sets of Phi.  This will produce a correlation matrix R = fx' phi fy.  Factors can differ in their mean values by specifying mu.  

The default values for \code{\link{sim.structure}} is to generate a 4 factor, 12 variable data set with a simplex structure between the factors. This, and the simplex of items (\code{\link{sim.simplex}}) can also be converted in a STARS model with an autoregressive component (alpha) and a stable trait component (lambda). 

Two data structures that are particular challenges to exploratory factor analysis are the simplex structure and the presence of minor factors.  Simplex structures \code{\link{sim.simplex}} will typically occur in developmental or learning contexts and have a correlation structure of r between adjacent variables and r^n for variables n apart.  Although just one latent variable (r) needs to be estimated, the structure will have nvar-1 factors.  

An alternative version of the simplex is the State-Trait-Auto Regressive Structure (STARS) which has both a simplex state structure, with autoregressive path alpha and a trait structure with path lambda. This simulated in  \code{\link{sim.simplex}} by specifying a non-zero lambda value.

Many simulations of factor structures assume that except for the major factors, all residuals are normally distributed around 0.  An alternative, and perhaps more realistic situation, is that the there are a few major (big) factors and many minor (small) factors.
For a nice discussion of this situation, see Maccallum, Browne and Cai (2007).  The challenge is thus to identify the major factors. \code{\link{sim.minor}} generates such structures.  The structures generated can be thought of as havinga a major factor structure with some small correlated residuals. To make these simulations complete, the possibility of a general factor is considered.  For simplicity, sim.minor allows one to specify a set of loadings to be sampled from for g, fmajor and fminor.  Alternatively, it is possible to specify the complete factor matrix.

Another structure worth considering is direct modeling of a general factor with several group factors.  This is done using \code{\link{sim.general}}.

Although coefficient \eqn{\omega}{\omega} is a very useful indicator of the general factor saturation of a unifactorial test (one with perhaps several sub factors), it has problems with the case of multiple, independent factors.  In this situation, one of the factors is labelled as ``general'' and  the omega estimate is too large.  This situation may be explored using the \code{\link{sim.omega}} function with general left as NULL.  If there is a general factor, then results from \code{\link{sim.omega}} suggests that omega estimated either from EFA or from SEM does a pretty good job of identifying it but that the EFA approach using Schmid-Leiman transformation is somewhat more robust than the SEM approach. 

The four irt simulations, \code{\link{sim.rasch}},  \code{\link{sim.irt}},  \code{\link{sim.npl}} and  \code{\link{sim.npn}} simulate dichotomous items following the Item Response model.   \code{\link{sim.irt}} just calls either  \code{\link{sim.npl}} (for logistic models) or  \code{\link{sim.npn}} (for normal models) depending upon the specification of the model. 

The logistic model is \deqn{P(i,j) = \gamma + \frac{\zeta-\gamma}{1+ e^{\alpha(\delta-\theta)}}}{P(i,j) = \gamma + (\zeta-\gamma)/(1+ exp(\alpha(\delta-\theta)))} where \eqn{\gamma} is the lower asymptote or guesssing parameter, \eqn{\zeta} is the upper asymptote (normally 1), \eqn{\alpha} is item discrimination and \eqn{\delta} is item difficulty.  For the 1 Paramater Logistic (Rasch) model, gamma=0, zeta=1, alpha=1 and item difficulty is the only free parameter to specify.

For the 2PL and 2PN models, a = \eqn{\alpha} and  d = \eqn{\delta} are specified. \cr
For the 3PL or 3PN models, items also differ in their guessing parameter c =\eqn{\gamma}. \cr
For the 4PL and 4PN models, the upper asymptote, z= \eqn{\zeta} is also specified.  \cr
(Graphics of these may be seen in the demonstrations for the \code{\link{logistic}} function.)

The normal model (irt.npn) calculates the probability using pnorm instead of the logistic function used in irt.npl, but the meaning of the parameters are otherwise the same.  With the a = \eqn{\alpha} parameter = 1.702 in the logistic model the two models are practically identical.

In parallel to the dichotomous IRT simulations are the poly versions which simulate polytomous item models.  They have the additional parameter of how many categories to simulate.  In addition, the \code{\link{sim.poly.ideal}} functions will simulate an ideal point or unfolding model in which the response probability varies by the distance from each subject's ideal point.  Some have claimed that this is a more appropriate model of the responses to personality questionnaires.  It will lead to simplex like structures which may be fit by a two factor model.  The middle items form one factor, the extreme a bipolar factor.

By default, the theta parameter is created in each function as normally distributed with mean mu=0  and sd=1.  In the case where you want to specify the theta to be equivalent from another simulation or fixed for a particular experimental condition, either take the theta object from the output of a previous simulation, or create it using whatever properties are desired. 

The previous functions all assume one latent trait.  Alternatively, we can simulate dichotomous or polytomous items with a particular structure using the sim.poly.mat function.  This takes as input the population correlation matrix, the population marginals, and the sample size.  It returns categorical items with the specified structure.

Other simulation functions in psych that are documented separately includ: 

\code{\link{sim.structure}}  A function to combine a measurement and structural model into one data matrix.  Useful for understanding structural equation models.  Combined with \code{\link{structure.diagram}} to see the proposed structure.  


\code{\link{sim.congeneric}}   A function to create congeneric items/tests for demonstrating classical test theory. This is just a special case of sim.structure.
 
\code{\link{sim.hierarchical}}  A function to create data with a hierarchical (bifactor) structure.  

\code{\link{sim.item}}      A function to create items that either have a simple structure or a circumplex structure.

\code{\link{sim.circ}}    Create data with a circumplex structure.

\code{\link{sim.dichot}}    Create dichotomous item data with a simple or circumplex structure.


\code{\link{sim.minor}}   Create a factor structure for nvar variables defined by nfact major factors and nvar/2 ``minor" factors for n observations.  

Although the standard factor model assumes that K major factors (K << nvar) will account for the correlations among the variables

\deqn{R = FF' + U^2} 
where R is of rank P and F is a P x K matrix of factor coefficients and U is a diagonal matrix of uniquenesses.  However, in many cases, particularly when working with items, there are many small factors (sometimes referred to as correlated residuals) that need to be considered as well.  This leads to a data structure such that 
\deqn{R = FF' + MM' + U^2} 
where R is a P x P matrix of correlations, F is a  P x K factor loading matrix,  M is a P x P/2 matrix of minor factor loadings, and U is a diagonal matrix (P x P) of uniquenesses.  

Such a correlation matrix will have a poor \eqn{\chi^2} value in terms of goodness of fit if just the K factors are extracted, even though for all intents and purposes, it is well fit.  

 \code{\link{sim.minor}} will generate such data sets with big factors with loadings of .6 to .8 and small factors with loadings of -.2 to .2.  These may both be adjusted.

\code{\link{sim.parallel}} Create a number of simulated data sets using  \code{\link{sim.minor}} to show how parallel analysis works.  The general observation is that with the presence of minor factors, parallel analysis is probably best done with component eigen values rather than factor eigen values, even when using the factor model. 

\code{\link{sim.anova}}    Simulate a 3 way balanced ANOVA or linear model, with or without repeated measures. Useful for teaching research  methods and generating teaching examples. 


\code{\link{sim.multilevel}}  To understand some of the basic concepts of multilevel modeling, it is useful to create multilevel structures.  The correlations of aggregated data is sometimes called an 'ecological correlation'.  That group level and individual level correlations are independent makes such inferences problematic.  This simulation allows for demonstrations that correlations within groups do not imply, nor are implied by, correlations between group means. 


}

\value{
\item{model}{The model based correlation matrix (FF' )} 
\item{reliability}{Model based reliability}
\item{r}{Observed (sample based) correlation matrix}
\item{theta}{True scores generating the data}
\item{N}{Sample size}
\item{fload}{The factor model (F + S) generating the model}
}

\note{The theta values are "true scores" and may be compared to the factor analytic based factor score estimates of the data.  This is a useful way to understand factor indeterminancy.}


\references{

MacCallum, Robert C. and Browne, Michael W. and Cai, Li (2007)  Factor analysis models as approximations. Factor analysis at 100: Historical developments and future directions. (Cudeck and MacCallum Eds). Lawrence Erlbaum Associates Publishers.


Revelle, W. (in preparation) An Introduction to Psychometric Theory with applications in R. Springer. at \url{https://personality-project.org/r/book/}  
}

\author{William Revelle}

\seealso{ See above}

\examples{
simplex <- sim.simplex() #create the default simplex structure
lowerMat(simplex) #the correlation matrix
#create a congeneric matrix
congeneric <- sim.congeneric()
lowerMat(congeneric)
R <- sim.hierarchical()
lowerMat(R)
#now simulate categorical items with the hierarchical factor structure.  
#Let the items be dichotomous with varying item difficulties.
marginals = matrix(c(seq(.1,.9,.1),seq(.9,.1,-.1)),byrow=TRUE,nrow=2)
X <- sim.poly.mat(R=R,m=marginals,n=1000)
lowerCor(X) #show the raw correlations
#lowerMat(tetrachoric(X)$rho) # show the tetrachoric correlations (not run)
#generate a structure 
fx <- matrix(c(.9,.8,.7,rep(0,6),c(.8,.7,.6)),ncol=2)
fy <- c(.6,.5,.4)
Phi <- matrix(c(1,0,.5,0,1,.4,0,0,0),ncol=3)
R <- sim.structure(fx,Phi,fy) 
cor.plot(R$model) #show it graphically

simp <- sim.simplex()
#show the simplex structure using cor.plot
cor.plot(simp,colors=TRUE,main="A simplex structure")
#Show a STARS model 
simp <- sim.simplex(alpha=.8,lambda=.4)
#show the simplex structure using cor.plot
cor.plot(simp,colors=TRUE,main="State Trait Auto Regressive Simplex" )

dichot.sim <- sim.irt()  #simulate 5 dichotomous items
poly.sim <- sim.poly(theta=dichot.sim$theta)  #simulate 5 polytomous items that correlate 
  #with the dichotomous items

}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{multivariate}
\keyword{datagen}

