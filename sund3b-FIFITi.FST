source universal.fst;
define Align {[} | {]};
define INPUT [ U(F) U(I) U(F) U(I) U(T) U(i) ] & wff;
define Phon0(X) X;
define Phon(X) Phon0(X);
define OUTPUT Phon(INPUT);
load defined spell.fsd;
regex [OUTPUT .o. spell1].l { } OUTPUT;
print words
source span.fst;
regex [OUTPUT .o. span1].l;
print words
