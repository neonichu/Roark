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

  private func buildPhaseForKey(key: String) -> BuildPhase {
    let result = (obj.valueForKey(key) as? NSObject) ?? undefined()
    return BuildPhase(obj: result)
  }

  public var defaultFrameworksBuildPhase: BuildPhase {
    return buildPhaseForKey(__FUNCTION__)
  }

  public var defaultHeaderBuildPhase: BuildPhase {
    return buildPhaseForKey(__FUNCTION__)
  }

  public var defaultLinkBuildPhase: BuildPhase {
    return buildPhaseForKey(__FUNCTION__)
  }

  public var defaultResourceBuildPhase: BuildPhase {
    return buildPhaseForKey(__FUNCTION__)
  }

  public var defaultSourceCodeBuildPhase: BuildPhase {
    return buildPhaseForKey(__FUNCTION__)
  }
}
