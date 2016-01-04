define Ident(F) [..] -> "*" 
  ||  .#. [a1(F) & A0(F)] _, .#. [a0(F) & A1(F)] _; 

define Ident1(F) [..] -> "*" 
  || .#. [A1(F) & a0(F)] _; 

# [+F] is marked. 
define Mark1(F) [..] -> "*" || .#. a1(F) _;

# [+F,+G] is marked. Boundary needs to be included?
define Mark11(F,H) [..] -> "*" || .#. [a1(F) & a1(H)] _;


# SpreadR
# Penalize segment that follows a nasal span end.
# Should be poor in enforcing spread of second nasal.
define SpreadR1( N ) [..] -> "*" || .#. Seg* LeftSemiSeg r1(N) Seg* LeftSemiSeg  _ ".";

# Penalize segment in an non-nasal area following a nasal span end
# and the first segment in the next nasal span.
define SpreadR2( N ) [..] -> "*" || .#. Seg* LeftSemiSeg r1(N) s0(N)* LeftSemiSeg  _ ".";

# Mark locus immediately after N span ends.  Good for left-linear.
define SpreadR3( N ) [..] -> "*" || r1(N) [l0(N) | l1(N)]  _ ".";
