file(REMOVE_RECURSE
  "../../../../../../qml/QtQuick/Studio/EventSimulator/EventSimulator.qml"
  "../../../../../../qml/QtQuick/Studio/EventSimulator/EventSimulatorDelegate.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/QuickStudioEventSimulator_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
