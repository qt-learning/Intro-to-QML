# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.24.2)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(ds-populate NONE)


# Pass through things we've already detected in the main project to avoid
# paying the cost of redetecting them again in ExternalProject_Add()
set(GIT_EXECUTABLE [==[/usr/bin/git]==])
set(GIT_VERSION_STRING [==[2.39.2 (Apple Git-143)]==])
set_property(GLOBAL PROPERTY _CMAKE_FindGit_GIT_EXECUTABLE_VERSION
  [==[/usr/bin/git;2.39.2 (Apple Git-143)]==]
)


include(ExternalProject)
ExternalProject_Add(ds-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_TAG" "qds-4.1" "GIT_REPOSITORY" "https://code.qt.io/qt-labs/qtquickdesigner-components.git"
                    SOURCE_DIR          "/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-src"
                    BINARY_DIR          "/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


