## Filter a candidate set X with a star-marking constraint Z.

source less.fst;

define Optimize(X,Z) [[[X .o. Z].l - [[X .o. Z].l .o. LX].l] .o. "*" -> 0 ].l ; 
define OptimizeL(X,Z,A) [[[X .o. Z].l - [[X .o. Z].l .o. LL(A)].l] .o. "*" -> 0 ].l ; 
define OptimizeR(X,Z,A) [[[X .o. Z].l - [[X .o. Z].l .o. LR(A)].l] .o. "*" -> 0 ].l ; 

define Tst(X,Z) [[X .o. Z].l - [[X .o. Z].l .o. LX].l] ; 

define TST(X,Z) [X .o. Z].l; 
