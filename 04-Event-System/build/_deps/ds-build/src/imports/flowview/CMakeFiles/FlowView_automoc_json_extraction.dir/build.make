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

# Utility rule file for FlowView_automoc_json_extraction.

# Include any custom commands dependencies for this target.
include _deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/progress.make

_deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction: /Users/ashwalton/Qt/6.5.2/macos/./libexec/cmake_automoc_parser
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running AUTOMOC file extraction for target FlowView"
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview && /Users/ashwalton/Qt/6.5.2/macos/libexec/cmake_automoc_parser --cmake-autogen-cache-file /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_autogen.dir/ParseCache.txt --cmake-autogen-info-file /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_autogen.dir/AutogenInfo.json --output-file-path /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview/meta_types/FlowView_json_file_list.txt --timestamp-file-path /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview/meta_types/FlowView_json_file_list.txt.timestamp --cmake-autogen-include-dir-path /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview/FlowView_autogen/include

FlowView_automoc_json_extraction: _deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction
FlowView_automoc_json_extraction: _deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/build.make
.PHONY : FlowView_automoc_json_extraction

# Rule to build all files generated by this target.
_deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/build: FlowView_automoc_json_extraction
.PHONY : _deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/build

_deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/clean:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview && $(CMAKE_COMMAND) -P CMakeFiles/FlowView_automoc_json_extraction.dir/cmake_clean.cmake
.PHONY : _deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/clean

_deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/depend:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-src/src/imports/flowview /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/_deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : _deps/ds-build/src/imports/flowview/CMakeFiles/FlowView_automoc_json_extraction.dir/depend

