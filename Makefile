EXE = pa3
EXETest = pa3test

OBJS_EXE = HSLAPixel.o lodepng.o PNG.o main.o toqutree.o stats.o
OBJS_EXET = HSLAPixel.o lodepng.o PNG.o testComp.o toqutree.o stats.o

CXX = clang++
CXXFLAGS = -std=c++1y -stdlib=libc++ -c -g -O0 -Wall -Wextra -pedantic 
LD = clang++
#LDFLAGS = -std=c++1y -stdlib=libc++ -lc++abi -lpthread -lm
LDFLAGS = -std=c++1y -stdlib=libc++ -lpthread -lm 

all : pa3 pa3test

$(EXE) : $(OBJS_EXE)
	$(LD) $(OBJS_EXE) $(LDFLAGS) -o $(EXE)

$(EXETest) : $(OBJS_EXET)
	$(LD) $(OBJS_EXET) $(LDFLAGS) -o $(EXETest)

#object files
HSLAPixel.o : pixelUtil/HSLAPixel.cpp pixelUtil/HSLAPixel.h
	$(CXX) $(CXXFLAGS) pixelUtil/HSLAPixel.cpp -o $@

PNG.o : pixelUtil/PNG.cpp pixelUtil/PNG.h pixelUtil/HSLAPixel.h pixelUtil/lodepng/lodepng.h
	$(CXX) $(CXXFLAGS) pixelUtil/PNG.cpp -o $@

lodepng.o : pixelUtil/lodepng/lodepng.cpp pixelUtil/lodepng/lodepng.h
	$(CXX) $(CXXFLAGS) pixelUtil/lodepng/lodepng.cpp -o $@

stats.o : stats.h stats.cpp pixelUtil/HSLAPixel.h pixelUtil/PNG.h
	$(CXX) $(CXXFLAGS) stats.cpp -o $@

toqutree.o : toqutree.h toqutree.cpp stats.h pixelUtil/PNG.h pixelUtil/HSLAPixel.h
	$(CXX) $(CXXFLAGS) toqutree.cpp -o $@

testComp.o : testComp.cpp pixelUtil/PNG.h pixelUtil/HSLAPixel.h toqutree.h
	$(CXX) $(CXXFLAGS) testComp.cpp -o testComp.o

main.o : main.cpp pixelUtil/PNG.h pixelUtil/HSLAPixel.h toqutree.h
	$(CXX) $(CXXFLAGS) main.cpp -o main.o

clean :
	-rm -f *.o $(EXE) $(EXETest)
