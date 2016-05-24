##
## Makefile in /home/arnhol_m/rendu/Supinfo/arc/ARC
##
## Made by Arnholz Martin
## Login : arnhol_m
##
## Started on  Mon Dec 21 19:29:12 2015
## Last update Fri Jan 29 09:18:00 2016 
##

CC	= gcc -g3

CFLAGS	= -I./inc/

RM	= rm -rf

NAME	= arc

LIBC	= src/libc/affchar.c \
	  src/libc/affnbr.c \
	  src/libc/affstr.c \
	  src/libc/afftabchar.c \
	  src/libc/afftabint.c \
	  src/libc/getlen.c \
	  src/libc/getmatch.c \
	  src/libc/affthat.c \
	  src/libc/getnext.c \
	  src/libc/getcopy.c \
	  src/libc/gettok.c

SRC	= $(LIBC) \
	  src/main.c \
	  src/recode.c

OBJS	= $(SRC:.c=.o)

all	: $(NAME)
	@echo "\\033[1;33m \t\t----------COMPILATION FINISHED---------- \\033[0;39m"

.c.o	:
	 @$(CC) $(CFLAGS) -c -o $@ $<
	 @echo " $(CC) $(CFLAGS) -c -o $< \\033[1;32m >> \\033[0;39m $@ \\033[1;32m OK \\033[0;39m"

$(NAME) : $(OBJS)
	@echo "\\033[1;33m \t\t----------COMPILATION BEGIN---------- \\033[0;39m"
	$(CC) -o $(NAME) $(OBJS) $(CFLAGS)

clean	:
	@echo "\\033[1;31m \t\t----------STARTING FAST CLEANING---------- \\033[0;39m"
	@$(RM) $(OBJS)
	@$(RM) *~
	@$(RM) *#
	@$(foreach value, $(OBJS), echo "\\033[1;31m DELETING >> \\033[0;39m" $(value);)
	@echo "\\033[1;31m DELETING >> \\033[0;39m temporary (*~)"
	@echo "\\033[1;31m DELETING >> \\033[0;39m failed saving (*#)"
	@echo "\t\t\\033[1;31m----------END OF FAST CLEANING---------- \\033[0;39m"

fclean	:
	@echo "\\033[1;31m \t\t----------STARTING ADVANCED CLEANING---------- \\033[0;39m"
	@$(RM) $(OBJS)
	@$(RM) *~
	@$(RM) $(NAME)
	@$(foreach value, $(OBJS), echo "\\033[1;31m DELETING >> \\033[0;39m" $(value);)
	@echo "\\033[1;31m DELETING >> \\033[0;39m *~"
	@echo "\\033[1;31m DELETING >> \\033[0;39m *#"
	@echo "\\033[1;31m DELETING >> BINARY \\033[0;39m  $(RM) $(NAME)"
	@echo "\\033[1;31m \t\t----------END OF ADVANCED CLEANING---------- \\033[0;39m"

re	: fclean all

.PHONY	: fclean all re clean
