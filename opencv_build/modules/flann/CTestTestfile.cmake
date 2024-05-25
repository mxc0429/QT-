# CMake generated Testfile for 
# Source directory: D:/OpenCV/opencv-3.4.6/modules/flann
# Build directory: D:/OpenCV/opencv_build/modules/flann
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_flann "D:/OpenCV/opencv_build/bin/opencv_test_flann.exe" "--gtest_output=xml:opencv_test_flann.xml")
set_tests_properties(opencv_test_flann PROPERTIES  LABELS "Main;opencv_flann;Accuracy" WORKING_DIRECTORY "D:/OpenCV/opencv_build/test-reports/accuracy" _BACKTRACE_TRIPLES "D:/OpenCV/opencv-3.4.6/cmake/OpenCVUtils.cmake;1555;add_test;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1261;ocv_add_test_from_target;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1066;ocv_add_accuracy_tests;D:/OpenCV/opencv-3.4.6/modules/flann/CMakeLists.txt;2;ocv_define_module;D:/OpenCV/opencv-3.4.6/modules/flann/CMakeLists.txt;0;")
