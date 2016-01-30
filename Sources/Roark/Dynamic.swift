import ObjectiveC.runtime

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
