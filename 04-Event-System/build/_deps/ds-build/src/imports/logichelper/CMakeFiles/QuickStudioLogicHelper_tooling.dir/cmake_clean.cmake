file(REMOVE_RECURSE
  "../../../../../qml/QtQuick/Studio/LogicHelper/AndOperator.qml"
  "../../../../../qml/QtQuick/Studio/LogicHelper/BidirectionalBinding.qml"
  "../../../../../qml/QtQuick/Studio/LogicHelper/MinMaxMapper.qml"
  "../../../../../qml/QtQuick/Studio/LogicHelper/NotOperator.qml"
  "../../../../../qml/QtQuick/Studio/LogicHelper/OrOperator.qml"
  "../../../../../qml/QtQuick/Studio/LogicHelper/RangeMapper.qml"
  "../../../../../qml/QtQuick/Studio/LogicHelper/StringMapper.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/QuickStudioLogicHelper_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
