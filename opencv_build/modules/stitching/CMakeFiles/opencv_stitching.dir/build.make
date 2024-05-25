# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.28

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = D:\Code\CMake\bin\cmake.exe

# The command to remove a file.
RM = D:\Code\CMake\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\OpenCV\opencv-3.4.6

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\OpenCV\opencv_build

# Include any dependencies generated for this target.
include modules/stitching/CMakeFiles/opencv_stitching.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.make

# Include the progress variables for this target.
include modules/stitching/CMakeFiles/opencv_stitching.dir/progress.make

# Include the compile flags for this target's objects.
include modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make

modules/stitching/opencl_kernels_stitching.cpp: D:/OpenCV/opencv-3.4.6/modules/stitching/src/opencl/multibandblend.cl
modules/stitching/opencl_kernels_stitching.cpp: D:/OpenCV/opencv-3.4.6/modules/stitching/src/opencl/warpers.cl
modules/stitching/opencl_kernels_stitching.cpp: D:/OpenCV/opencv-3.4.6/cmake/cl2cpp.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Processing OpenCL kernels (stitching)"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\CMake\bin\cmake.exe -DMODULE_NAME=stitching -DCL_DIR=D:/OpenCV/opencv-3.4.6/modules/stitching/src/opencl -DOUTPUT=D:/OpenCV/opencv_build/modules/stitching/opencl_kernels_stitching.cpp -P D:/OpenCV/opencv-3.4.6/cmake/cl2cpp.cmake

modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/autocalib.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\autocalib.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\autocalib.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\autocalib.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\autocalib.cpp > CMakeFiles\opencv_stitching.dir\src\autocalib.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\autocalib.cpp -o CMakeFiles\opencv_stitching.dir\src\autocalib.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/blenders.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\blenders.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\blenders.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\blenders.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/blenders.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\blenders.cpp > CMakeFiles\opencv_stitching.dir\src\blenders.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/blenders.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\blenders.cpp -o CMakeFiles\opencv_stitching.dir\src\blenders.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/camera.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\camera.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\camera.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\camera.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/camera.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\camera.cpp > CMakeFiles\opencv_stitching.dir\src\camera.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/camera.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\camera.cpp -o CMakeFiles\opencv_stitching.dir\src\camera.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/exposure_compensate.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\exposure_compensate.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\exposure_compensate.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\exposure_compensate.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\exposure_compensate.cpp > CMakeFiles\opencv_stitching.dir\src\exposure_compensate.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\exposure_compensate.cpp -o CMakeFiles\opencv_stitching.dir\src\exposure_compensate.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/matchers.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\matchers.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\matchers.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\matchers.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/matchers.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\matchers.cpp > CMakeFiles\opencv_stitching.dir\src\matchers.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/matchers.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\matchers.cpp -o CMakeFiles\opencv_stitching.dir\src\matchers.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/motion_estimators.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\motion_estimators.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\motion_estimators.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\motion_estimators.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\motion_estimators.cpp > CMakeFiles\opencv_stitching.dir\src\motion_estimators.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\motion_estimators.cpp -o CMakeFiles\opencv_stitching.dir\src\motion_estimators.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/seam_finders.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\seam_finders.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\seam_finders.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\seam_finders.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\seam_finders.cpp > CMakeFiles\opencv_stitching.dir\src\seam_finders.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\seam_finders.cpp -o CMakeFiles\opencv_stitching.dir\src\seam_finders.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/stitcher.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\stitcher.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\stitcher.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\stitcher.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\stitcher.cpp > CMakeFiles\opencv_stitching.dir\src\stitcher.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\stitcher.cpp -o CMakeFiles\opencv_stitching.dir\src\stitcher.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/timelapsers.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\timelapsers.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\timelapsers.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\timelapsers.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\timelapsers.cpp > CMakeFiles\opencv_stitching.dir\src\timelapsers.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\timelapsers.cpp -o CMakeFiles\opencv_stitching.dir\src\timelapsers.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/util.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\util.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\util.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\util.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/util.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\util.cpp > CMakeFiles\opencv_stitching.dir\src\util.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/util.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\util.cpp -o CMakeFiles\opencv_stitching.dir\src\util.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/warpers.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\warpers.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\warpers.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\warpers.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/warpers.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\warpers.cpp > CMakeFiles\opencv_stitching.dir\src\warpers.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/warpers.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\warpers.cpp -o CMakeFiles\opencv_stitching.dir\src\warpers.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj: D:/OpenCV/opencv-3.4.6/modules/stitching/src/warpers_cuda.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj -MF CMakeFiles\opencv_stitching.dir\src\warpers_cuda.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\src\warpers_cuda.cpp.obj -c D:\OpenCV\opencv-3.4.6\modules\stitching\src\warpers_cuda.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv-3.4.6\modules\stitching\src\warpers_cuda.cpp > CMakeFiles\opencv_stitching.dir\src\warpers_cuda.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv-3.4.6\modules\stitching\src\warpers_cuda.cpp -o CMakeFiles\opencv_stitching.dir\src\warpers_cuda.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj: modules/stitching/opencl_kernels_stitching.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj -MF CMakeFiles\opencv_stitching.dir\opencl_kernels_stitching.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\opencl_kernels_stitching.cpp.obj -c D:\OpenCV\opencv_build\modules\stitching\opencl_kernels_stitching.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv_build\modules\stitching\opencl_kernels_stitching.cpp > CMakeFiles\opencv_stitching.dir\opencl_kernels_stitching.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv_build\modules\stitching\opencl_kernels_stitching.cpp -o CMakeFiles\opencv_stitching.dir\opencl_kernels_stitching.cpp.s

modules/stitching/CMakeFiles/opencv_stitching.dir/vs_version.rc.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/vs_version.rc.obj: modules/stitching/vs_version.rc
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building RC object modules/stitching/CMakeFiles/opencv_stitching.dir/vs_version.rc.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\windres.exe -O coff $(RC_DEFINES) $(RC_INCLUDES) $(RC_FLAGS) D:\OpenCV\opencv_build\modules\stitching\vs_version.rc CMakeFiles\opencv_stitching.dir\vs_version.rc.obj

modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/flags.make
modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/includes_CXX.rsp
modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj: modules/stitching/opencv_stitching_main.cpp
modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj: modules/stitching/CMakeFiles/opencv_stitching.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj -MF CMakeFiles\opencv_stitching.dir\opencv_stitching_main.cpp.obj.d -o CMakeFiles\opencv_stitching.dir\opencv_stitching_main.cpp.obj -c D:\OpenCV\opencv_build\modules\stitching\opencv_stitching_main.cpp

modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.i"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\OpenCV\opencv_build\modules\stitching\opencv_stitching_main.cpp > CMakeFiles\opencv_stitching.dir\opencv_stitching_main.cpp.i

modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.s"
	cd /d D:\OpenCV\opencv_build\modules\stitching && D:\Code\QT\QT\Tools\mingw730_64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\OpenCV\opencv_build\modules\stitching\opencv_stitching_main.cpp -o CMakeFiles\opencv_stitching.dir\opencv_stitching_main.cpp.s

# Object files for target opencv_stitching
opencv_stitching_OBJECTS = \
"CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/util.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj" \
"CMakeFiles/opencv_stitching.dir/vs_version.rc.obj" \
"CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj"

# External object files for target opencv_stitching
opencv_stitching_EXTERNAL_OBJECTS =

bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/autocalib.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/blenders.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/camera.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/exposure_compensate.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/matchers.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/motion_estimators.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/seam_finders.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/stitcher.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/timelapsers.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/util.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/src/warpers_cuda.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/opencl_kernels_stitching.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/vs_version.rc.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/opencv_stitching_main.cpp.obj
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/build.make
bin/libopencv_stitching346.dll: lib/libopencv_calib3d346.dll.a
bin/libopencv_stitching346.dll: lib/libopencv_features2d346.dll.a
bin/libopencv_stitching346.dll: lib/libopencv_flann346.dll.a
bin/libopencv_stitching346.dll: lib/libopencv_highgui346.dll.a
bin/libopencv_stitching346.dll: lib/libopencv_videoio346.dll.a
bin/libopencv_stitching346.dll: lib/libopencv_imgcodecs346.dll.a
bin/libopencv_stitching346.dll: lib/libopencv_imgproc346.dll.a
bin/libopencv_stitching346.dll: lib/libopencv_core346.dll.a
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/linkLibs.rsp
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/objects1.rsp
bin/libopencv_stitching346.dll: modules/stitching/CMakeFiles/opencv_stitching.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:\OpenCV\opencv_build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Linking CXX shared library ..\..\bin\libopencv_stitching346.dll"
	cd /d D:\OpenCV\opencv_build\modules\stitching && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\opencv_stitching.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
modules/stitching/CMakeFiles/opencv_stitching.dir/build: bin/libopencv_stitching346.dll
.PHONY : modules/stitching/CMakeFiles/opencv_stitching.dir/build

modules/stitching/CMakeFiles/opencv_stitching.dir/clean:
	cd /d D:\OpenCV\opencv_build\modules\stitching && $(CMAKE_COMMAND) -P CMakeFiles\opencv_stitching.dir\cmake_clean.cmake
.PHONY : modules/stitching/CMakeFiles/opencv_stitching.dir/clean

modules/stitching/CMakeFiles/opencv_stitching.dir/depend: modules/stitching/opencl_kernels_stitching.cpp
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\OpenCV\opencv-3.4.6 D:\OpenCV\opencv-3.4.6\modules\stitching D:\OpenCV\opencv_build D:\OpenCV\opencv_build\modules\stitching D:\OpenCV\opencv_build\modules\stitching\CMakeFiles\opencv_stitching.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : modules/stitching/CMakeFiles/opencv_stitching.dir/depend

