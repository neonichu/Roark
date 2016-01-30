import ObjectiveC.runtime

public protocol Dynamic {
  var obj: NSObject { get }
}

public protocol Named: Dynamic {
  var name: String { get }
}

public extension Named {
  public var name: String {
    return (obj.valueForKey("name") as? String) ?? undefined()
  }
}
