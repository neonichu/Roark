import Foundation
import ObjectiveC.runtime

public class Project: NSObject, Named {
  private static let sOBJC_CLASS = (objc_getClass("PBXProject") as? NSObjectProtocol) ?? undefined()
  public let OBJC_CLASS = Project.sOBJC_CLASS
  public let obj: NSObject

  public var targets: [Target] {
    let targets = (obj.valueForKey("targets") as? NSArray) ?? undefined()
    return targets.map { Target(obj: ($0 as? NSObject) ?? undefined()) }
  }

  public init(file: String) {
    let result = OBJC_CLASS.performSelector(Selector("projectWithFile:"), withObject: file)
    obj = (result.takeRetainedValue() as? NSObject) ?? undefined()
  }

  public func close() {
    obj.performSelector(Selector("close"))
  }

  public func targetNamed(name: String) -> Target {
    let result = obj.performSelector(Selector("targetNamed:"), withObject: name)
    return Target(obj: (result.takeRetainedValue() as? NSObject) ?? undefined())
  }

  public func write() -> Bool {
    typealias writeToFileSystemType = @convention(c) (Bool, Bool, Bool) -> Bool
    let writeToFileSystem = ObjCMethod(`class`,
        "writeToFileSystemProjectFile:userFile:checkNeedsRevert:", writeToFileSystemType.self)
    return writeToFileSystem(true, false, true)
  }

  public static func isProjectWrapperExtension(extension: String) -> Bool {
    typealias isProjectWrapperExtensionType = @convention(c) (String) -> Bool
    let `class`: AnyClass = (sOBJC_CLASS as? AnyClass) ?? undefined()
    let isProjectWrapperExtension = ObjCClassMethod(`class`, __FUNCTION__ + ":",
        isProjectWrapperExtensionType.self)
    print(`extension`)
    return isProjectWrapperExtension(`extension`)
  }

  /* Missing:
    - (id<XCConfigurationList>) buildConfigurationList;

    Implementation of PBXContainer
  */
}
