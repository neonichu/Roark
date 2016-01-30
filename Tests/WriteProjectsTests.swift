import Spectre
import PathKit
import Roark

func describeWriteProject() {
  describe("Writing of Xcode projects") {
    var project: Project!

    $0.before {
      InitializeXcode()

      let path = Path.current + "Tests/Fixtures/Blog.xcodeproj"
      project = Project(file: String(path))
    }

    $0.it("can write a project file to disk") {
      try expect(project.write()) == true
    }
  }
}
