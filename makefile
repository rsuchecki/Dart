.KEEP_STAT:

all: main

Compiler	= g++
FLAGS		= -D NDEBUG -O3
LIB		= -lz -lm -lpthread
SOURCE		= main.cpp Mapping.cpp AlignmentCandidates.cpp GetData.cpp tools.cpp PairwiseAlignment.cpp bwt_search.cpp bwt_index.cpp KmerAnalysis.cpp
HEADER		= structure.h
OBJECT		= $(SOURCE:%.cpp=%.o)

main:		$(OBJECT)
			$(Compiler) $(FLAGS) $(OBJECT) -o dart $(LIB)
%.o:		%.cpp $(HEADER)
			$(Compiler) $(FLAGS) -c $<

eva:		GeneralEvaluation.cpp
		$(Compiler) $(FLAGS) GeneralEvaluation.cpp -o eva

FluxEva:	FluxEvaluation.cpp
		$(Compiler) $(FLAGS) FluxEvaluation.cpp -o FluxEva
		
clean:
		rm -f *.o *~
