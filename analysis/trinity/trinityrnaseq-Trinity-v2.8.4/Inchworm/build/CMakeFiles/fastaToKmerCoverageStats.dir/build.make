# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.13.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.13.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build

# Include any dependencies generated for this target.
include CMakeFiles/fastaToKmerCoverageStats.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/fastaToKmerCoverageStats.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fastaToKmerCoverageStats.dir/flags.make

CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.o: ../src/fastaToKmerCoverageStats.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/fastaToKmerCoverageStats.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/fastaToKmerCoverageStats.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/fastaToKmerCoverageStats.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.s

CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.o: ../src/argProcessor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/argProcessor.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/argProcessor.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/argProcessor.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.s

CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.o: ../src/Fasta_reader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/Fasta_reader.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/Fasta_reader.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/Fasta_reader.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.s

CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.o: ../src/Fasta_entry.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/Fasta_entry.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/Fasta_entry.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/Fasta_entry.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.s

CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.o: ../src/sequenceUtil.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/sequenceUtil.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/sequenceUtil.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/sequenceUtil.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.s

CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.o: ../src/string_util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/string_util.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/string_util.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/string_util.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.s

CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.o: ../src/stacktrace.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/stacktrace.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/stacktrace.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/stacktrace.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.s

CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.o: CMakeFiles/fastaToKmerCoverageStats.dir/flags.make
CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.o: ../src/KmerCounter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.o -c /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/KmerCounter.cpp

CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/KmerCounter.cpp > CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.i

CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/src/KmerCounter.cpp -o CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.s

# Object files for target fastaToKmerCoverageStats
fastaToKmerCoverageStats_OBJECTS = \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.o" \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.o" \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.o" \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.o" \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.o" \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.o" \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.o" \
"CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.o"

# External object files for target fastaToKmerCoverageStats
fastaToKmerCoverageStats_EXTERNAL_OBJECTS =

fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/fastaToKmerCoverageStats.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/argProcessor.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_reader.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/Fasta_entry.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/sequenceUtil.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/string_util.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/stacktrace.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/src/KmerCounter.cpp.o
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/build.make
fastaToKmerCoverageStats: CMakeFiles/fastaToKmerCoverageStats.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable fastaToKmerCoverageStats"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fastaToKmerCoverageStats.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fastaToKmerCoverageStats.dir/build: fastaToKmerCoverageStats

.PHONY : CMakeFiles/fastaToKmerCoverageStats.dir/build

CMakeFiles/fastaToKmerCoverageStats.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fastaToKmerCoverageStats.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fastaToKmerCoverageStats.dir/clean

CMakeFiles/fastaToKmerCoverageStats.dir/depend:
	cd /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build /Users/calderatta/Downloads/trinityrnaseq-Trinity-v2.8.4/Inchworm/build/CMakeFiles/fastaToKmerCoverageStats.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fastaToKmerCoverageStats.dir/depend
