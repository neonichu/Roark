import Roark

InitializeXcode()
let project = Project(file: Process.arguments.last!)
print(project.name)
print((project.targets.map { $0.description }).joinWithSeparator("\n"))
print(project.targetNamed("BlogTests"))
print(project.write())

print(templatesForProject(project))
