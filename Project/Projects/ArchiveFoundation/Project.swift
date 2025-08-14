import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let projectName: String = "ArchiveFoundation"
let project = Project(
  name: projectName,
  organizationName: Project.organizationName,
  packages: [],
  targets: Project.dynamicFrameworkTargets(
    name: projectName,
    destinations: .iOS,
    frameworkDependencies: [],
    testDependencies: [],
    targetScripts: [
      .pre(script: "${PROJECT_DIR}/../../Tools/LocalizationGen/LocalizationGen.sh", name: "LocalizationAutoGen"),
      .pre(script: "${PROJECT_DIR}/../../Tools/swiftgen config run --config \"${PROJECT_DIR}/Resources/uiComponentsSwiftgen.yml\"", name: "Gen"),
      .pre(script: "${PROJECT_DIR}/../../Tools/swiftlint --config \"${PROJECT_DIR}/../App/Resources/swiftlint.yml\"", name: "Lint")
    ],
    coreDataModel: []
  ),
  schemes: [],
  additionalFiles: [],
  resourceSynthesizers: [
    .assets(),
    .custom(
      name: "Lottie",
      parser: .json,
      extensions: ["lottie"]
    ),
    .json()
  ]
)
