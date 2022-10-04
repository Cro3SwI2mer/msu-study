#set name of the executable file
target = main.out

#set directories
build_dir = ~/docs/education/msu/pp/sem1
src_dir = ~/docs/education/msu/pp/sem1

fpc = fpc
sources = $(shell find $(src_dir) -name *.pp -or -name *.pas)

.PHONY: clean
clean:
	rm -f $(build_dir)/*.o $(build_dir)/*.out
