
# Inputs of various sizes.
bisyllable.out: bisyllable.fst
	xfst -q -f bisyllable.fst | sort > bisyllable.out

trisyllable.out: trisyllable.fst
	xfst -q -f trisyllable.fst | sort > trisyllable.out

# Feature to spelling, defines spell1.
# This is slow to compile.
spell.fsd: spell.fst
	xfst -q -f spell.fst

# Default compilation
%.out: %.fst
	xfst -q -f $*.fst > $*.out

# Compilation for FST extension.
%.out: %.FST
	xfst -q -f $*.FST > $*.out

# Not used?
# %.opt: %.cnt optimize.awk
#	cat $*.cnt | awk -f optimize.awk  > $*.opt


# Generate confluence markup
%.cnf: %.fst
	cat $*.fst | awk -f ../fst2cnf.awk > $*.cnf
	(echo Generated with fst2cnf from $*.fst on `date`) >> $*.cnf

# Nested functions
# $(subst c,C, $(subst a,A,$*))
# Space character does not need to be quoted

# Make an fst program like sund3-iYi.FST.
# The hyphenated base is taken apart.
# Dependencies are not handled ):
%.FST: optimize.awk input.awk
	echo "source universal.fst;" > $*.FST   # Universal nasal harmony
	echo "define Align {[} | {]};" >> $*.FST
	echo $(word 2,$(subst -, ,$*)) | awk -f input.awk >> $*.FST # Unspell word
	cat $(word 1,$(subst -, ,$*)).cnt | awk -f optimize.awk >> $*.FST # Phonology
	echo "define OUTPUT Phon(INPUT);" >> $*.FST # Run phonology
	echo "load defined spell.fsd;" >> $*.FST 
	echo "regex [OUTPUT .o. spell1].l { } OUTPUT;" >> $*.FST 
	echo "print words" >> $*.FST # Print result
	echo "source span.fst;" >> $*.FST
	echo "regex [OUTPUT .o. span1].l;" >> $*.FST
	echo "print words" >> $*.FST # Print result

# Bisyllables.
sund3.out: sund3.cnt bisyllable.out
	date > sund3.out
	for f in `cat bisyllable.out`; do echo $$f; make sund3-$$f.FST; \
	echo $$f >> sund3.out; xfst -q -f sund3-$$f.FST >> sund3.out; \
	echo >> sund3.out; mv sund3-$$f.FST Data; done

# Trisyllables.
sund3B.out: sund3.cnt trisyllable.out
	date > sund3B.out
	for f in `cat trisyllable.out`; do echo $$f; make sund3-$$f.FST; \
	echo $$f >> sund3B.out; xfst -q -f sund3-$$f.FST >> sund3B.out; \
	echo >> sund3B.out; mv sund3-$$f.FST Data; done

# Trisyllables.
sund3LB.out: sund3L.cnt trisyllable.out
	date > sund3LB.out
	for f in `cat trisyllable.out`; do echo $$f; make sund3L-$$f.FST; \
	echo $$f >> sund3LB.out; xfst -q -f sund3L-$$f.FST >> sund3LB.out; \
	echo >> sund3LB.out; mv sund3L-$$f.FST Data; done