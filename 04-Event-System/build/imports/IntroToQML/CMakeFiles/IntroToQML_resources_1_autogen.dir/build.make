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

# Utility rule file for IntroToQML_resources_1_autogen.

# Include any custom commands dependencies for this target.
include imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/compiler_depend.make

# Include the progress variables for this target.
include imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/progress.make

imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target IntroToQML_resources_1"
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/imports/IntroToQML && /Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E cmake_autogen /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/AutogenInfo.json Debug

IntroToQML_resources_1_autogen: imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen
IntroToQML_resources_1_autogen: imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/build.make
.PHONY : IntroToQML_resources_1_autogen

# Rule to build all files generated by this target.
imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/build: IntroToQML_resources_1_autogen
.PHONY : imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/build

imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/clean:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/imports/IntroToQML && $(CMAKE_COMMAND) -P CMakeFiles/IntroToQML_resources_1_autogen.dir/cmake_clean.cmake
.PHONY : imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/clean

imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/depend:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/imports/IntroToQML /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/imports/IntroToQML /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : imports/IntroToQML/CMakeFiles/IntroToQML_resources_1_autogen.dir/depend

