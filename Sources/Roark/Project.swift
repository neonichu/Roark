import ObjectiveC.runtime

public class Project: NSObject {
  let OBJC_CLASS = (objc_getClass("PBXProject") as? NSObjectProtocol) ?? undefined()
  let obj: NSObject

  public var name: String {
    return (obj.valueForKey("name") as? String) ?? undefined()
  }

  public init(file: String) {
    let result = OBJC_CLASS.performSelector(Selector("projectWithFile:"), withObject: file)
    obj = (result.takeRetainedValue() as? NSObject) ?? undefined()
  }
}
