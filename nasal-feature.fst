
# Spelling notation for underlying segments, e.g. U(r), U(i).
# The permissible arguments are i,I y,r,f,t,I,Y,R,F,T.
# V i,I Vowel
# G y,Y Glide
# L r,R Liquid
# S t,T Obstruent stop
#
# Nasal indicated by capitalizalization in spelling.

# Feature blocks.
# V and C... are disjunctive
# C is subclassified by G | L | F | S
# N feature comes last.
#   G glide
#   L liquid
#   F fricative
#   S stop

# Allow only N to have non-unit span
# define Block [V | [ C [G | L | F | S ]]] (N);
# Allow also manner to have non-unit span
define Block [V | [ C (G | L | F | S )]] (N);

# Segment is built from four feature blocks.
# [<und start>.<surface start>..<und end><surface end>]
define LeftSemiSeg "[" Block "." Block ".";
define RightSemiSeg "." Block "." Block "]";
define Seg LeftSemiSeg RightSemiSeg;


# Map a letter to a set of segments. The upper side is deterministic, and
# the lower side unconstrained.  We get 100 options for each input.

define U( Z ) "[" 
    Test([i & Z],V,
     Test([y & Z],[C G],
      Test([r & Z],[C L],
       Test([f & Z],[C F],
        Test([t & Z],[C S],
         Test([I & Z],[V N],     
          Test([Y & Z],[C G N],
           Test([R & Z],[C L N],
            Test([F & Z],[C F N],
             Test([T & Z],[C S N],SegmentSpecificationError)))))))))) 
    "." Block "."  "." 
    Test([i & Z],V,
     Test([y & Z],[C G],
      Test([r & Z],[C L],
       Test([f & Z],[C F],
        Test([t & Z],[C S],
         Test([I & Z],[V N],     
          Test([Y & Z],[C G N],
           Test([R & Z],[C L N],
            Test([F & Z],[C F N],
             Test([T & Z],[C S N],SegmentSpecificationError)))))))))) 
    "." Block "]" & Seg;

# Howe are nasal stops fit in?





