BUILD_DIR=./.build/debug

.PHONY: all clean lib test debug

all: lib
	$(BUILD_DIR)/test `pwd`/Tests/Fixtures/Blog.xcodeproj
	
lib:
	swift build

clean:
	swift build --clean

test: lib
	$(BUILD_DIR)/spectre-build

debug:
	lldb $(BUILD_DIR)/spectre-runner
