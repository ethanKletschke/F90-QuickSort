# Variables
GFORT = gfortran
BIN_DIR = bin
SRC_DIR = src
SRC_EXT = f90
SRC = $(wildcard $(SRC_DIR)/*.$(SRC_EXT))
TARGET = quicksort

# Rules
.PHONY: all clean
all: $(SRC) $(BIN_DIR) $(BIN_DIR)/$(TARGET)

run:
	./$(BIN_DIR)/$(TARGET)

$(BIN_DIR)/$(TARGET): $(SRC)
	$(GFORT) -o bin/$(TARGET) $^
