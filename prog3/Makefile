src = $(wildcard *.c)
bin = $(src:%.c=%)
obj	= $(src:%.c=%.o)

all : $(bin)

% : %.c
	gcc $@.c -o $@

clean:
	rm -f $(bin) $(hi) $(obj)
