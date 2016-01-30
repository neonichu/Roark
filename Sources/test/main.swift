import Roark

InitializeXcode()
let project = Project(file: "/Users/boris/Projects/blog-app-ios/Blog.xcodeproj")
print(project.name)
print((project.targets.map { $0.description }).joinWithSeparator("\n"))
print(project.targetNamed("BlogTests"))
print(project.write())
