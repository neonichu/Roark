import Foundation

public class TargetTemplate: CustomStringConvertible {
  private let obj: NSObject

  init(obj: NSObject) {
    assert(String(obj.dynamicType) == "XCTargetTemplate")
    self.obj = obj
  }

  // same as -templateDescription :(
  var name: String {
    return (obj.valueForKey(__FUNCTION__) as? String) ?? undefined()
  }

  public var description: String {
    return name
  }
}

class TargetTemplateScanner {
  static let OBJC_CLASS = getObjCClass("XCTargetTemplateScanner")

  static func findTemplatesForProject(project: Project) -> [TargetTemplate] {
    if let templates = call(OBJC_CLASS, "\(__FUNCTION__):", project.obj) as? NSArray {
      return templates.map { TargetTemplate(obj: ($0 as? NSObject) ?? undefined()) }
    }

    return [TargetTemplate]()
  }
}

public func templatesForProject(project: Project) -> [TargetTemplate] {
  return TargetTemplateScanner.findTemplatesForProject(project)
}
