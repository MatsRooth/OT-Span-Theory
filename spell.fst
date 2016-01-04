source test.fst;
source nasal-feature.fst;
source interval.fst;

# Spelling span structure by writing letters in the violation locus.
# Not a big network (2262 states), but slow to compile.

define spell0 [..] -> i || .#. [a1(V) & a0(N)] _,,
              [..] -> I || .#. [a1(V) & a1(N)] _,,
              [..] -> y || .#. [a1(G) & a0(N)] _,,
              [..] -> Y || .#. [a1(G) & a1(N)] _,,
              [..] -> r || .#. [a1(L) & a0(N)] _,,
              [..] -> R || .#. [a1(L) & a1(N)] _,,
              [..] -> f || .#. [a1(F) & a0(N)] _,,
              [..] -> F || .#. [a1(F) & a1(N)] _,,
              [..] -> t || .#. [a1(S) & a0(N)] _,,
              [..] -> T || .#. [a1(S) & a1(N)] _;

define cleanup ["[" Block "." Block "."] -> 0 , ["." Block "." Block "]"] -> 0 ;

define spell1  spell0 .o. cleanup;

# define spell(X) [X .o. spell1].l;

# Some elements too short!
# xfst[6]: regex [INPUT .o. spell].l;
# 2.3 Kb. 7 states, 60 arcs, 1111111 paths.
# xfst[7]: print random-words
# rfRifT
# FfRfRr
# TITfiY
# iryRRR
# ryrfIt
# rFYyTF
# YRtYRf
# RiiIfY
# YRRR
# YyTYyI
# tYTFrY
# YItTIT
# TFRYTf
# yifriY
# iiTfRy

undefine Block;
undefine LeftSemiSeg;
undefine RightSemiSeg;
undefine Seg;

save defined spell.fsd;





