BUILD_DIR=./.build/debug

.PHONY: all clean lib test

all: lib
	$(BUILD_DIR)/test `pwd`/Tests/Fixtures/Blog.xcodeproj
	
lib:
	swift build

clean:
	swift build --clean

test: lib
	$(BUILD_DIR)/spectre-build
