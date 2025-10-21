# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -g -Iinclude
LDFLAGS :=

# Directories
SRC_DIR := src
BUILD_DIR := build
BIN_DIR := bin

# Source files and Object files
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

# Target executable
TARGET := $(BIN_DIR)/edge_ai_system

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)
	@echo "Linked executable: $@"

# Compile source files to object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@
	@echo "Compiled object: $@"

# Clean rule
clean:
	@rm -rf $(BUILD_DIR) $(BIN_DIR)
	@echo "Cleaned build and bin directories."

# Phony targets
.PHONY: all clean