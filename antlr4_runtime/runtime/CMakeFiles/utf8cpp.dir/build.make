# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/roman/Desktop/cpp/spreadsheets

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/roman/Desktop/cpp/spreadsheets

# Utility rule file for utf8cpp.

# Include any custom commands dependencies for this target.
include antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/compiler_depend.make

# Include the progress variables for this target.
include antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/progress.make

antlr4_runtime/runtime/CMakeFiles/utf8cpp: antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete

antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-install
antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-mkdir
antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-download
antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-patch
antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-configure
antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-build
antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/roman/Desktop/cpp/spreadsheets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'utf8cpp'"
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/CMakeFiles
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-done

antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-build: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/roman/Desktop/cpp/spreadsheets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing build step for 'utf8cpp'"
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-build && $(MAKE)
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-build && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-build

antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-configure: antlr4_runtime/runtime/utf8cpp-prefix/tmp/utf8cpp-cfgcmd.txt
antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-configure: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/roman/Desktop/cpp/spreadsheets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Performing configure step for 'utf8cpp'"
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-build && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -DCMAKE_INSTALL_PREFIX=/Users/roman/Desktop/cpp/spreadsheets/runtime/thirdparty/utfcpp/install -DUTF8_TESTS=off -DUTF8_SAMPLES=off "-GUnix Makefiles" /Users/roman/Desktop/cpp/spreadsheets/runtime/thirdparty/utfcpp
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-build && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-configure

antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-download: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-gitinfo.txt
antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-download: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/roman/Desktop/cpp/spreadsheets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'utf8cpp'"
	cd /Users/roman/Desktop/cpp/spreadsheets/runtime/thirdparty && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -P /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/tmp/utf8cpp-gitclone.cmake
	cd /Users/roman/Desktop/cpp/spreadsheets/runtime/thirdparty && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-download

antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-install: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/roman/Desktop/cpp/spreadsheets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Performing install step for 'utf8cpp'"
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-build && $(MAKE) install
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-build && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-install

antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/roman/Desktop/cpp/spreadsheets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'utf8cpp'"
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/runtime/thirdparty/utfcpp
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-build
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/tmp
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E make_directory /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-mkdir

antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-patch: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/roman/Desktop/cpp/spreadsheets/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'utf8cpp'"
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E echo_append
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E touch /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-patch

utf8cpp: antlr4_runtime/runtime/CMakeFiles/utf8cpp
utf8cpp: antlr4_runtime/runtime/CMakeFiles/utf8cpp-complete
utf8cpp: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-build
utf8cpp: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-configure
utf8cpp: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-download
utf8cpp: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-install
utf8cpp: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-mkdir
utf8cpp: antlr4_runtime/runtime/utf8cpp-prefix/src/utf8cpp-stamp/utf8cpp-patch
utf8cpp: antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/build.make
.PHONY : utf8cpp

# Rule to build all files generated by this target.
antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/build: utf8cpp
.PHONY : antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/build

antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/clean:
	cd /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime && $(CMAKE_COMMAND) -P CMakeFiles/utf8cpp.dir/cmake_clean.cmake
.PHONY : antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/clean

antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/depend:
	cd /Users/roman/Desktop/cpp/spreadsheets && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/roman/Desktop/cpp/spreadsheets /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime /Users/roman/Desktop/cpp/spreadsheets /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime /Users/roman/Desktop/cpp/spreadsheets/antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : antlr4_runtime/runtime/CMakeFiles/utf8cpp.dir/depend

