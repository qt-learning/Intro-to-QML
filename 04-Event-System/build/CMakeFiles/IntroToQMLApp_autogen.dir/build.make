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

# Utility rule file for IntroToQMLApp_autogen.

# Include any custom commands dependencies for this target.
include CMakeFiles/IntroToQMLApp_autogen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/IntroToQMLApp_autogen.dir/progress.make

CMakeFiles/IntroToQMLApp_autogen: .rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target IntroToQMLApp"
	/Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E cmake_autogen /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles/IntroToQMLApp_autogen.dir/AutogenInfo.json Debug

.rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp: /Users/ashwalton/Qt/6.5.2/macos/libexec/qmlcachegen
.rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp: .rcc/qmlcache/IntroToQMLApp_qml_loader_file_list.rsp
.rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp: .rcc/configuration.qrc
.rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp: .rcc/qmake_Main.qrc
.rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp: .rcc/IntroToQMLApp_raw_qml_0.qrc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating .rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp"
	/Users/ashwalton/Qt/6.5.2/macos/libexec/qmlcachegen --resource-name qmlcache_IntroToQMLApp --resource /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/.rcc/configuration.qrc --resource /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/.rcc/qmake_Main.qrc --resource /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/.rcc/IntroToQMLApp_raw_qml_0.qrc -o /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/.rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp @/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/.rcc/qmlcache/IntroToQMLApp_qml_loader_file_list.rsp

IntroToQMLApp_autogen: .rcc/qmlcache/IntroToQMLApp_qmlcache_loader.cpp
IntroToQMLApp_autogen: CMakeFiles/IntroToQMLApp_autogen
IntroToQMLApp_autogen: CMakeFiles/IntroToQMLApp_autogen.dir/build.make
.PHONY : IntroToQMLApp_autogen

# Rule to build all files generated by this target.
CMakeFiles/IntroToQMLApp_autogen.dir/build: IntroToQMLApp_autogen
.PHONY : CMakeFiles/IntroToQMLApp_autogen.dir/build

CMakeFiles/IntroToQMLApp_autogen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/IntroToQMLApp_autogen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/IntroToQMLApp_autogen.dir/clean

CMakeFiles/IntroToQMLApp_autogen.dir/depend:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles/IntroToQMLApp_autogen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/IntroToQMLApp_autogen.dir/depend
