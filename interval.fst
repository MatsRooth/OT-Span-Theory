
## Half intervals with starts and end of features.

# left semi-segment not specifying F on surface 
define l0(F) "[" Block "." [Block & ~ $ F] "." ;

# left semi-segment specifying F on surface 
define l1(F) "[" Block "." [Block & $ F] "." ;

# right semi-segment not specifying F on surface 
define r0(F)  "." Block "." [Block & ~ $ F] "]" ;

# right semi-segment specifying F on surface 
define r1(F)  "." Block "." [Block & $ F] "]" ;

# left semi-segment not specifying F underlyingly
define L0(F) "[" [Block & ~$F] "." Block ".";

# left semi-segment specifying F underlyingly
define L1(F) "[" [Block & $F] "." Block ".";

# right semi-segment not specifying F underlyingly
define R0(F)  "." [Block & ~$F] "." Block "]" ;

#define EndUnd(F)  "." [Block & $F] "." Block "]" ;
define R1(F)  "." [Block & $F] "." Block "]" ;

# segment not changing F on surface
define s0(F) [l0(F) r0(F)];

# segment beginning and ending F on surface
define s1(F) [l1(F) r1(F)];

# segment not changing F underlyingly
define S0(F) [L0(F) R0(F)];

# segment beginning and ending F underlyingly
define S1(F) [L1(F) R1(F)];

# Left context that represents a positive surface value for F at the target.
# Should be used with boundary symbol .#. in *-insertion rules.

define a1(F) Seg* l1(F) [r0(F) l0(F)]*;

# Left context that represents a negative surface value for F at the target.
# Doing this with a negation flopped, because *'s got inserted
# all over the place. 

define a0(F) [s0(F) | [l1(F) [r0(F) l0(F)]* r1(F)] ]*  l0(F) ; 


# Left context that represents a positive underlying value for F 
# at the target. 
define A1(F) Seg* L1(F) [R0(F) L0(F)]*;

# Left context that represents a negative underlying value for F 
# at the target. 
define A0(F) [S0(F) | [L1(F) [R0(F) L0(F)]* R1(F)] ]* L0(F) ; 

## Sequence of segments not mentioning F, or matching F specifications
## bracketing boundaries not mentioning F       
define wf(F) [s0(F) | [l1(F) [r0(F) l0(F)]* r1(F)]]* ;
