## Defines a star-counting harmony ordering LX.
#  x LX y iff x has fewer stars than y.

# The star violation mark.
define Star "*";

define W \[ Star ];


# The definition reads any number of stars in pairs,
# mixed in with lexical material on both sides.
# Then one star and optionally more lexical material
# is read on the lower side.

# To make operations like composition and projection work 
# in xfst, it seems to be advantageous to do asynchronous 
# reading as deterministically as possible. Here we 
# read everything possible on the lower side, then everything
# possible on the upper side, then the star or pair of stars.
# The finite state machine has three states.

define LX [[0:W]* [W:0]* Star:Star]* [0:W]* [W:0]* 0:Star [0:?]* ;


# The same thing as a boolean operator.
# The value is non-empty iff some element of X is 
# less than some element of Y.
define Less(X,Y) [X .o. LX .o. Y].l ;

# Linear star comparison from left.  A is align relation, which should have only
# length 1 strings on both sides.

define Skip(A)  [[\[A.u | Star]] .x. 0]* [0 .x. [\[A.l | Star]]]*;

define Match(A) Skip(A) [[A | Star:Star] Skip(A)]*;

# Fails on final *
# define LL(A) Match(A) [A.u]:Star [?:0]* [0:?]*;

define LL(A) Match(A) [[[A.u]:Star [?:0]* [0:?]*] | [0:Star [\[A.u]]* [0:?]*]];

define LR(A) LL(A).r;

# For testing
define Sigma [l | h];

define MS Sigma .x. Sigma;


