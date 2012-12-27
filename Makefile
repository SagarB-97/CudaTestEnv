PROG = mp1

CFLAGS = -g -Os -Wall -Wextra -I. -std=c99 -DCUDA_EMU
CXXFLAGS = -g -Os -Wall -Wextra -I. -DCUDA_EMU -pie
LDFLAGS = -lboost_thread-mt

$(PROG): $(PROG).cc wb.h thread_processor.hpp
	$(CXX) $(CXXFLAGS) $(PROG).cc -o $(PROG) $(LDFLAGS)


run: $(PROG)
	./$(PROG) foo foo

clean:
	rm -f *~ *.o core $(PROG)
