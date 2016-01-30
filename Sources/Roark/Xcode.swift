import Chores
import Foundation

private func load_xcode_framework(path: String) {
  let result = >["xcode-select", "-p"]
  if let xcodePath = result.stdout.lines.first {
    if dlopen("\(xcodePath)/../\(path)", RTLD_NOW) == nil {
      fatalError(String.fromCString(dlerror()) ?? "dlopen() failed")
    }
  }
}

public func InitializeXcode() {
  load_xcode_framework("SharedFrameworks/DVTFoundation.framework/DVTFoundation")
  load_xcode_framework("SharedFrameworks/DVTSourceControl.framework/DVTSourceControl")
  //load_xcode_framework("SharedFrameworks/CSServiceClient.framework/CSServiceClient")
  load_xcode_framework("Frameworks/IBFoundation.framework/IBFoundation")
  load_xcode_framework("Frameworks/IBAutolayoutFoundation.framework/IBAutolayoutFoundation")
  load_xcode_framework("Frameworks/IDEFoundation.framework/IDEFoundation")
  load_xcode_framework("PlugIns/Xcode3Core.ideplugin/Contents/MacOS/Xcode3Core")

  silence_stderr {
  	typealias IDEInitializeType = @convention(c) (Int, UnsafePointer<Void>) -> ()
  	let IDEInitialize = CFunction("IDEInitialize", IDEInitializeType.self)
  	IDEInitialize(1, nil)

  	typealias XCInitializeCoreIfNeededType = @convention(c) (Int) -> ()
  	let XCInitializeCoreIfNeeded = CFunction("XCInitializeCoreIfNeeded", XCInitializeCoreIfNeededType.self)
  	XCInitializeCoreIfNeeded(0)
  }
}
