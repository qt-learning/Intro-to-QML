# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build

# Utility rule file for QuickStudioEventSimulator_qmllint.

# Include any custom commands dependencies for this target.
include _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/progress.make

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint: /Users/ashwalton/Qt/6.5.2/macos/bin/qmllint
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint: _deps/ds-src/src/imports/tools/eventsimulator/EventSimulator.qml
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint: _deps/ds-src/src/imports/tools/eventsimulator/EventSimulatorDelegate.qml
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-src/src/imports/tools/eventsimulator && /Users/ashwalton/Qt/6.5.2/macos/bin/qmllint --bare -I /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/qml -I /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/qml -I /Users/ashwalton/Qt/6.5.2/macos/./qml --resource /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/tools/eventsimulator/.rcc/qmake_QtQuick_Studio_EventSimulator.qrc --resource /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/tools/eventsimulator/.rcc/QuickStudioEventSimulator_raw_qml_0.qrc /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-src/src/imports/tools/eventsimulator/EventSimulator.qml /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-src/src/imports/tools/eventsimulator/EventSimulatorDelegate.qml

QuickStudioEventSimulator_qmllint: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint
QuickStudioEventSimulator_qmllint: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/build.make
.PHONY : QuickStudioEventSimulator_qmllint

# Rule to build all files generated by this target.
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/build: QuickStudioEventSimulator_qmllint
.PHONY : _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/build

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/clean:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/tools/eventsimulator && $(CMAKE_COMMAND) -P CMakeFiles/QuickStudioEventSimulator_qmllint.dir/cmake_clean.cmake
.PHONY : _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/clean

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/depend:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-src/src/imports/tools/eventsimulator /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/tools/eventsimulator /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulator_qmllint.dir/depend

