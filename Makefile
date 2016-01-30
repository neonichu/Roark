BUILD_DIR=./.build/debug

.PHONY: all clean lib

all: lib
	$(BUILD_DIR)/test
	
lib:
	swift build

clean:
	swift build --clean
