import ObjectiveC.runtime

func call(object: NSObjectProtocol, _ methodName: String, _ argument: NSObject? = nil) -> NSObject {
  let result: Unmanaged<AnyObject>!

  if let argument = argument {
    result = object.performSelector(Selector(methodName), withObject: argument)
  } else {
    result = object.performSelector(Selector(methodName))
  }

  return (result.takeRetainedValue() as? NSObject) ?? undefined()
}

func getObjCClass(name: String) -> NSObjectProtocol {
  return (objc_getClass(name) as? NSObjectProtocol) ?? undefined("No such class: \(name)")
}

public protocol Dynamic {
  var OBJC_CLASS: NSObjectProtocol { get }
  var obj: NSObject { get }

  var `class`: AnyClass { get }
}

public extension Dynamic {
  public var `class`: AnyClass {
    return (OBJC_CLASS as? AnyClass) ?? undefined()
  }
}

public protocol Named: Dynamic {
  var name: String { get }
}

public extension Named {
  public var name: String {
    return (obj.valueForKey("name") as? String) ?? undefined()
  }
}
