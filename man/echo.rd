\name{echo}

\alias{echo}

\title{Echo generator}
\description{This function generate echoes of a time wave.}

\usage{echo(wave, f, amp, delay, plot = FALSE,
listen = FALSE, Sample = FALSE, ...)}

\arguments{
  \item{wave}{data describing a time wave
    or a \code{\link[sound]{Sample}} object generated loading a wav file
    with \code{\link[sound]{loadSample}} (package \pkg{sound}).}
  \item{f}{sampling frequency of \code{wave} (in Hz).
  Does not need to be specified if \code{wave} is a \code{\link[sound]{Sample}} object.}
  \item{amp}{a vector describing the relative amplitude
    of the successive echoes. Each value of the vector should in [0,1]}
  \item{delay}{a vector describing the time delays of the successive echoes
    from the beginning of \code{wave} (in s.)}
  \item{plot}{logical, if \code{TRUE} returns an oscillographic plot of the wave
    modified (by default \code{FALSE}).}
  \item{listen}{if \code{TRUE} the new sound is played back.}
  \item{Sample}{if \code{TRUE} and \code{plot} is \code{FALSE}
    returns an object of class \code{\link[sound]{Sample}}}.
  \item{\dots}{other \code{\link{oscillo}} graphical parameters.}
}

\details{
\code{amp} and \code{delay} should strictly have the same length corresponding
to the number of desired echoes.}

\value{When \code{plot} is \code{FALSE}, a new wave is returned as a one-column matrix
or as a \code{\link[sound]{Sample}} object if \code{Sample} is \code{TRUE}.}

\references{Stoddard, P. K. (1998). Application of filters in bioacoustics.
\emph{In}: Hopp, S. L., Owren, M. J. and Evans, C. S. (Eds), \emph{Animal acoustic
communication}. Springer, Berlin, Heidelberg,pp. 105-127.}

\author{J�r�me Sueur \email{sueur@mnhn.fr}}

\note{This function is based on a convolution (\code{\link{convolve}}) between the
input wave and a pulse echo filter.}

\seealso{\code{\link{synth}}}

\examples{
# generation of the input wave
a<-synth(f=11025,d=1,cf=2000,shape="tria",am=c(50,10),fm=c(1000,10,1000))
# generation of three echoes
# with respectively a relative amplitude of 0.8, 0.4, and 0.2
# and with a delay of 1s, 2s, and 3s  from the beginning of the input wave
aecho<-echo(a,f=11025,amp=c(0.8,0.4,0.2),delay=c(1,2,3))
# oscillographic ooutput to see what we have generated
op<-par(mfrow=c(2,1))
oscillo(a,f=11025,title="Input signal")
oscillo(aecho,f=11025,colwave="blue",title="Signal with echoes",coltitle="blue")
par(op)
# another echo with time delays overlapping with the input wave
echo(a,f=11025,amp=c(0.4,0.2,0.4),delay=c(0.6,0.8,1.5),plot=TRUE,listen=TRUE)
}

\keyword{datagen}
\keyword{ts}