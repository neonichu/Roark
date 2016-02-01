import Spectre
import PathKit
import Roark

func describeTemplates() {
  describe("Xcode templates") {
    var project: Project!

    $0.before {
      InitializeXcode()

      let path = Path.current + "Tests/Fixtures/Blog.xcodeproj"
      project = Project(file: String(path))
    }

    $0.it("can read target templates for a specific project") {
      let templates = templatesForProject(project)
      print(templates)
    }
  }
}