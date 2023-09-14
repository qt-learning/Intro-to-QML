file(REMOVE_RECURSE
  "../../qml/IntroToQML/Constants.qml"
  "../../qml/IntroToQML/DirectoryFontLoader.qml"
  "../../qml/IntroToQML/EventListModel.qml"
  "../../qml/IntroToQML/EventListSimulator.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/IntroToQML_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
