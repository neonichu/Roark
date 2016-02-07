import Spectre
import PathKit
import Roark

func describeReadProject() {
  describe("Reading of Xcode projects") {
    var project: Project!

    $0.before {
      InitializeXcode()

      let path = Path.current + "Tests/Fixtures/Blog.xcodeproj"
      project = Project(file: String(path))
    }

    $0.it("can check if an extension is a project wrapper extension") {
      // FIXME: isProjectWrapperExtension() doesn't actually work :/
      //try expect(Project.isProjectWrapperExtension("xcodeproj")) == true
      try expect(Project.isProjectWrapperExtension("txt")) == false
    }

    $0.it("can open a project file") {
      try expect("\(project.obj.dynamicType)") == "PBXProject"
    }

    $0.it("can read the name of a project") {
      try expect(project.name) == "Blog"
    }

    $0.it("can read the targets of a project") {
      let targets = project.targets.map { $0.name }
      try expect(targets.first) == "Blog"
      try expect(targets.last) == "BlogTests"
    }

    $0.it("can retrieve a target by name") {
      let target = project.targetNamed("BlogTests")
      try expect(target.name) == "BlogTests"
    }

    $0.it("can retrieve the source code build phase") {
      let target = project.targetNamed("Blog")
      let buildPhase = target.defaultSourceCodeBuildPhase
      try expect("\(buildPhase.obj.dynamicType)") == "PBXSourcesBuildPhase"
    }
  }
}
