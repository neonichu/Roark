import ObjectiveC.runtime

private let targetTypes = ["PBXAggregateTarget", "PBXLegacyTarget", "PBXNativeTarget"]

public class Target: NSObject, Named {
  public let OBJC_CLASS = (objc_getClass("PBXTarget") as? NSObjectProtocol) ?? undefined()
  public let obj: NSObject

  public override var description: String {
    return "\(obj.dynamicType): \(name)"
  }

  init(obj: NSObject) {
    assert(targetTypes.contains(String(obj.dynamicType)))
    self.obj = obj
  }
}
