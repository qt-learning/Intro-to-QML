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

# Utility rule file for IntroToQMLApp_qmltyperegistration.

# Include any custom commands dependencies for this target.
include CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/progress.make

CMakeFiles/IntroToQMLApp_qmltyperegistration: introtoqmlapp_qmltyperegistrations.cpp
CMakeFiles/IntroToQMLApp_qmltyperegistration: qml/Main/IntroToQMLApp.qmltypes

introtoqmlapp_qmltyperegistrations.cpp: qmltypes/IntroToQMLApp_foreign_types.txt
introtoqmlapp_qmltyperegistrations.cpp: meta_types/qt6introtoqmlapp_debug_metatypes.json
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/./libexec/qmltyperegistrar
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/metatypes/qt6core_relwithdebinfo_metatypes.json
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/metatypes/qt6gui_relwithdebinfo_metatypes.json
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/metatypes/qt6qml_relwithdebinfo_metatypes.json
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/metatypes/qt6network_relwithdebinfo_metatypes.json
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/metatypes/qt6quick_relwithdebinfo_metatypes.json
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/metatypes/qt6qmlmodels_relwithdebinfo_metatypes.json
introtoqmlapp_qmltyperegistrations.cpp: /Users/ashwalton/Qt/6.5.2/macos/metatypes/qt6opengl_relwithdebinfo_metatypes.json
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic QML type registration for target IntroToQMLApp"
	/Users/ashwalton/Qt/6.5.2/macos/libexec/qmltyperegistrar --generate-qmltypes=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/qml/Main/IntroToQMLApp.qmltypes --import-name=Main --major-version=1 --minor-version=0 @/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/qmltypes/IntroToQMLApp_foreign_types.txt -o /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/introtoqmlapp_qmltyperegistrations.cpp /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/meta_types/qt6introtoqmlapp_debug_metatypes.json
	/Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E make_directory /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/.generated
	/Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E touch /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/.generated/IntroToQMLApp.qmltypes

qml/Main/IntroToQMLApp.qmltypes: introtoqmlapp_qmltyperegistrations.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate qml/Main/IntroToQMLApp.qmltypes

meta_types/qt6introtoqmlapp_debug_metatypes.json: meta_types/qt6introtoqmlapp_debug_metatypes.json.gen
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating meta_types/qt6introtoqmlapp_debug_metatypes.json"
	/Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E true

meta_types/qt6introtoqmlapp_debug_metatypes.json.gen: /Users/ashwalton/Qt/6.5.2/macos/./libexec/moc
meta_types/qt6introtoqmlapp_debug_metatypes.json.gen: meta_types/IntroToQMLApp_json_file_list.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Running moc --collect-json for target IntroToQMLApp"
	/Users/ashwalton/Qt/6.5.2/macos/libexec/moc -o /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/meta_types/qt6introtoqmlapp_debug_metatypes.json.gen --collect-json @/Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/meta_types/IntroToQMLApp_json_file_list.txt
	/Users/ashwalton/Qt/Tools/CMake/CMake.app/Contents/bin/cmake -E copy_if_different /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/meta_types/qt6introtoqmlapp_debug_metatypes.json.gen /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/meta_types/qt6introtoqmlapp_debug_metatypes.json

IntroToQMLApp_qmltyperegistration: CMakeFiles/IntroToQMLApp_qmltyperegistration
IntroToQMLApp_qmltyperegistration: introtoqmlapp_qmltyperegistrations.cpp
IntroToQMLApp_qmltyperegistration: meta_types/qt6introtoqmlapp_debug_metatypes.json
IntroToQMLApp_qmltyperegistration: meta_types/qt6introtoqmlapp_debug_metatypes.json.gen
IntroToQMLApp_qmltyperegistration: qml/Main/IntroToQMLApp.qmltypes
IntroToQMLApp_qmltyperegistration: CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/build.make
.PHONY : IntroToQMLApp_qmltyperegistration

# Rule to build all files generated by this target.
CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/build: IntroToQMLApp_qmltyperegistration
.PHONY : CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/build

CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/cmake_clean.cmake
.PHONY : CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/clean

CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/depend:
	cd /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build /Users/ashwalton/Desktop/Intro-To-QML/04-Event-System/build/CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/IntroToQMLApp_qmltyperegistration.dir/depend

