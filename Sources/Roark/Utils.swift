import Darwin.C

private let RTLD_DEFAULT = UnsafeMutablePointer<Void>(bitPattern: -2)

func CFunction<T>(name: String, _ type: T.Type) -> T {
  let sym = dlsym(RTLD_DEFAULT, name)
  return unsafeBitCast(sym, type.self)
}

func silence_stderr(silenced: () -> ()) {
  let orig_stderr = dup(fileno(stderr))
  freopen("/dev/null", "w", stderr)
  silenced()
  stderr = fdopen(orig_stderr, "w")
}

// From: https://github.com/weissi/swift-undefined/
func undefined<T>(hint:String="", file:StaticString=__FILE__, line:UInt=__LINE__) -> T {
    let message = hint == "" ? "" : ": \(hint)"
    fatalError("undefined \(T.self)\(message)", file:file, line:line)
}

extension String {
  private func split(char: Character) -> [String] {
    return self.characters.split { $0 == char }.map(String.init)
  }

  var lines: [String] {
    return split("\n")
  }

  var words: [String] {
    return split(" ")
  }
}
