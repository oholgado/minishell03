NAME = minishell

MK_DIR = mkdir -p
RM = rm -rf
CC = clang
INC = -I /usr/include/readline \
	  -I ${PWD} \
	  -I ${PWD}/libft

CFLAGS = -Wall -Werror -Wextra -g3 #-fsanitize=address 

LIB = -L usr/include/readline -lreadline \
	  -L . -lft

FILES	= 	main \
			minishell_utils \
			aux \
			functions

SRC = $(addsuffix .c, $(FILES))
OBJ = $(addsuffix .o, $(FILES))

.c.o:
	${CC} ${CFLAGS} ${INC} -c $^ -o $@

$(NAME): ${OBJ}
	${CC} ${CFLAGS} -o ${NAME} ${OBJ} ${LIB}

all: $(NAME)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
