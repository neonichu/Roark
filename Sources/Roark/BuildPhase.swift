import ObjectiveC.runtime

let buildPhases = ["PBXAppleScriptBuildPhase", "PBXCopyFilesBuildPhase",
  "PBXFrameworksBuildPhase", "PBXHeadersBuildPhase", "PBXResourcesBuildPhase",
  "PBXShellScriptBuildPhase", "PBXSourcesBuildPhase"]

public class BuildPhase: NSObject, Named {
  public let OBJC_CLASS = (objc_getClass("PBXBuildPhase") as? NSObjectProtocol) ?? undefined()
  public let obj: NSObject

  init(obj: NSObject) {
    assert(buildPhases.contains(String(obj.dynamicType)))
    self.obj = obj
  }
}
