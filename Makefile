NAME = a.out
CXX = c++
CXXFLAGS = -Wall -Werror -Wextra -std=c++98

HEADERS_PATH = ./includes
HEADER_FILES = ft_vector.hpp
HEADERS = $(addprefix $(HEADERS_PATH)/,$(HEADER_FILES))

SOURCES_PATH = ./sources
SOURCE_FILES =	main.cpp
SOURCE = $(addprefix $(SOURCES_PATH)/,$(SOURCE_FILES))

OBJECTS_PATH = ./objects
OBJECTS = $(addprefix $(OBJECTS_PATH)/,$(subst .cpp,.opp,$(SOURCE_FILES)))
RM = rm -rf 
SAFE_MAKEDIR = mkdir -p 

all: $(NAME)

$(NAME): $(OBJECTS) 
	$(CXX) $(CFLAGS) $(OBJECTS) -o $(NAME)

$(OBJECTS_PATH)/%.opp: $(SOURCES_PATH)/%.cpp $(HEADERS)
	$(SAFE_MAKEDIR) $(OBJECTS_PATH)
	$(CXX) $(CXXFLAGS) -I $(HEADERS_PATH) -o $@ -c $<

clean:
	$(RM) $(OBJECTS_PATH)

fclean: clean
	$(RM) $(NAME)

re: fclean all