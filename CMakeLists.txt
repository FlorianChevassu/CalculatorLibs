cmake_minimum_required(VERSION 3.10)
project(CalculatorLibs)

option(BUILD_DOCUMENTATION "Build the documentation" OFF)
option(BUILD_TESTING "Build the tests" ON)

set(CMAKE_CXX_STANDARD 11)

include(cmake/CalculatorLibsMacros.cmake)

add_subdirectory(src)

if(${BUILD_DOCUMENTATION})
	add_subdirectory(doc)
endif()

if(${BUILD_TESTING})
	# These should absolutely be included in the root CMakeLists.txt file. Otherwise, CDash won't work.
	include(CTest)
	enable_testing()
	add_subdirectory(testing)
endif()

# This command will generate a file named CalculatorLibs-targets.cmake at installation time in the
# cmake folder.
# The generated file will contain IMPORTED CMake targets. Those targets can be used by users of this
# library as if they were built by the same project. They should carry all their dependencies (includes, dependent libraries, etc.)
install(EXPORT CalculatorLibs-targets DESTINATION cmake)
# Install the CalculatorLibsConfig.cmake file in the cmake folder. This file will be used by CMake to find
# the IMPORTED targets of this project when calling find_package from another project.
install(FILES ${CMAKE_SOURCE_DIR}/cmake/CalculatorLibsConfig.cmake
        DESTINATION cmake)