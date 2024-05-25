# CMake generated Testfile for 
# Source directory: D:/OpenCV/opencv-3.4.6/modules/videoio
# Build directory: D:/OpenCV/opencv_build/modules/videoio
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_videoio "D:/OpenCV/opencv_build/bin/opencv_test_videoio.exe" "--gtest_output=xml:opencv_test_videoio.xml")
set_tests_properties(opencv_test_videoio PROPERTIES  LABELS "Main;opencv_videoio;Accuracy" WORKING_DIRECTORY "D:/OpenCV/opencv_build/test-reports/accuracy" _BACKTRACE_TRIPLES "D:/OpenCV/opencv-3.4.6/cmake/OpenCVUtils.cmake;1555;add_test;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1261;ocv_add_test_from_target;D:/OpenCV/opencv-3.4.6/modules/videoio/CMakeLists.txt;307;ocv_add_accuracy_tests;D:/OpenCV/opencv-3.4.6/modules/videoio/CMakeLists.txt;0;")
add_test(opencv_perf_videoio "D:/OpenCV/opencv_build/bin/opencv_perf_videoio.exe" "--gtest_output=xml:opencv_perf_videoio.xml")
set_tests_properties(opencv_perf_videoio PROPERTIES  LABELS "Main;opencv_videoio;Performance" WORKING_DIRECTORY "D:/OpenCV/opencv_build/test-reports/performance" _BACKTRACE_TRIPLES "D:/OpenCV/opencv-3.4.6/cmake/OpenCVUtils.cmake;1555;add_test;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1177;ocv_add_test_from_target;D:/OpenCV/opencv-3.4.6/modules/videoio/CMakeLists.txt;308;ocv_add_perf_tests;D:/OpenCV/opencv-3.4.6/modules/videoio/CMakeLists.txt;0;")
add_test(opencv_sanity_videoio "D:/OpenCV/opencv_build/bin/opencv_perf_videoio.exe" "--gtest_output=xml:opencv_perf_videoio.xml" "--perf_min_samples=1" "--perf_force_samples=1" "--perf_verify_sanity")
set_tests_properties(opencv_sanity_videoio PROPERTIES  LABELS "Main;opencv_videoio;Sanity" WORKING_DIRECTORY "D:/OpenCV/opencv_build/test-reports/sanity" _BACKTRACE_TRIPLES "D:/OpenCV/opencv-3.4.6/cmake/OpenCVUtils.cmake;1555;add_test;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1178;ocv_add_test_from_target;D:/OpenCV/opencv-3.4.6/modules/videoio/CMakeLists.txt;308;ocv_add_perf_tests;D:/OpenCV/opencv-3.4.6/modules/videoio/CMakeLists.txt;0;")
