cmake_minimum_required(VERSION 3.20)
project(IntroToQML LANGUAGES CXX)

set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(IntroToQML main.cpp)

qt_add_qml_module(IntroToQML
    URI "Main"
    QML_FILES "Main.qml"
    RESOURCES resources.qrc
)

target_link_libraries(IntroToQML
    PRIVATE
        Qt6::Quick
)
