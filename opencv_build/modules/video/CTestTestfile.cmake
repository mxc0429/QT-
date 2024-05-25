# CMake generated Testfile for 
# Source directory: D:/OpenCV/opencv-3.4.6/modules/video
# Build directory: D:/OpenCV/opencv_build/modules/video
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_video "D:/OpenCV/opencv_build/bin/opencv_test_video.exe" "--gtest_output=xml:opencv_test_video.xml")
set_tests_properties(opencv_test_video PROPERTIES  LABELS "Main;opencv_video;Accuracy" WORKING_DIRECTORY "D:/OpenCV/opencv_build/test-reports/accuracy" _BACKTRACE_TRIPLES "D:/OpenCV/opencv-3.4.6/cmake/OpenCVUtils.cmake;1555;add_test;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1261;ocv_add_test_from_target;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1066;ocv_add_accuracy_tests;D:/OpenCV/opencv-3.4.6/modules/video/CMakeLists.txt;2;ocv_define_module;D:/OpenCV/opencv-3.4.6/modules/video/CMakeLists.txt;0;")
add_test(opencv_perf_video "D:/OpenCV/opencv_build/bin/opencv_perf_video.exe" "--gtest_output=xml:opencv_perf_video.xml")
set_tests_properties(opencv_perf_video PROPERTIES  LABELS "Main;opencv_video;Performance" WORKING_DIRECTORY "D:/OpenCV/opencv_build/test-reports/performance" _BACKTRACE_TRIPLES "D:/OpenCV/opencv-3.4.6/cmake/OpenCVUtils.cmake;1555;add_test;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1177;ocv_add_test_from_target;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1067;ocv_add_perf_tests;D:/OpenCV/opencv-3.4.6/modules/video/CMakeLists.txt;2;ocv_define_module;D:/OpenCV/opencv-3.4.6/modules/video/CMakeLists.txt;0;")
add_test(opencv_sanity_video "D:/OpenCV/opencv_build/bin/opencv_perf_video.exe" "--gtest_output=xml:opencv_perf_video.xml" "--perf_min_samples=1" "--perf_force_samples=1" "--perf_verify_sanity")
set_tests_properties(opencv_sanity_video PROPERTIES  LABELS "Main;opencv_video;Sanity" WORKING_DIRECTORY "D:/OpenCV/opencv_build/test-reports/sanity" _BACKTRACE_TRIPLES "D:/OpenCV/opencv-3.4.6/cmake/OpenCVUtils.cmake;1555;add_test;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1178;ocv_add_test_from_target;D:/OpenCV/opencv-3.4.6/cmake/OpenCVModule.cmake;1067;ocv_add_perf_tests;D:/OpenCV/opencv-3.4.6/modules/video/CMakeLists.txt;2;ocv_define_module;D:/OpenCV/opencv-3.4.6/modules/video/CMakeLists.txt;0;")
