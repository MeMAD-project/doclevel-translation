
DOCSIZE = 100
SRC     = en
TRG     = fi
YEAR    = 2019


SRCTESTFILE = sgm/newstest${YEAR}-${SRC}${TRG}-src.${SRC}.sgm
REFTESTFILE = sgm/newstest${YEAR}-${SRC}${TRG}-ref.${TRG}.sgm

SRCDOCFILE = ${SRCTESTFILE:.sgm=.doc${DOCSIZE}}
REFDOCFILE = ${REFTESTFILE:.sgm=.doc${DOCSIZE}}

TXTFILES = $(patsubst %.sgm,%.txt,${wildcard sgm/*.sgm})


.PHONY: all extract
all: sgm
	${MAKE} ${SRCDOCFILE} ${REFDOCFILE}

extract: ${TXTFILES}

sgm:
	wget http://data.statmt.org/wmt19/translation-task/test.tgz
	tar -xzf test.tgz

sgm/newstest${YEAR}-${SRC}${TRG}-src.${SRC}.doc${DOCSIZE}: \
			sgm/newstest${YEAR}-${SRC}${TRG}-src.${SRC}.txt \
			sgm/newstest${YEAR}-${SRC}${TRG}-ref.${TRG}.txt
	../scripts/large-context.pl -l ${DOCSIZE} $^ | cut -f1 > $@

sgm/newstest${YEAR}-${SRC}${TRG}-ref.${TRG}.doc${DOCSIZE}: \
			sgm/newstest${YEAR}-${SRC}${TRG}-src.${SRC}.txt \
			sgm/newstest${YEAR}-${SRC}${TRG}-ref.${TRG}.txt
	../scripts/large-context.pl -l ${DOCSIZE} $^ | cut -f2 > $@


sgm/%.txt: sgm/%.sgm
	grep '<doc\|<seg' $< |\
	sed 's#</*seg[^>]*>##g' |\
	sed "s/\&gt;/>/g;s/\&lt;/</g;s/\&apos;/'/g;s/\&amp;/%/g" |\
	sed 's/^.*<doc.*$$//' |\
	tail -n +2 > $@

sgm/%.doc${DOCSIZE}: sgm/%.txt
	../scripts/large-context.pl -l ${DOCSIZE}
