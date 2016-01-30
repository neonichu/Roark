import Foundation
import ObjectiveC.runtime

public class Project: NSObject, Named {
  private let OBJC_CLASS = (objc_getClass("PBXProject") as? NSObjectProtocol) ?? undefined()
  public let obj: NSObject

  public var targets: [Target] {
    let targets = (obj.valueForKey("targets") as? NSArray) ?? undefined()
    return targets.map { Target(obj: ($0 as? NSObject) ?? undefined()) }
  }

  public init(file: String) {
    let result = OBJC_CLASS.performSelector(Selector("projectWithFile:"), withObject: file)
    obj = (result.takeRetainedValue() as? NSObject) ?? undefined()
  }
}
