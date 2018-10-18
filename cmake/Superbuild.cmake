# This Superbuild script will download and build the CalculatorLibs subproject before building the CalculatorDriver projec.

include(ExternalProject)

ExternalProject_Add(CalculatorLibs
                    SOURCE_DIR ${CMAKE_SOURCE_DIR}
                    CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${CMAKE_SOURCE_DIR}/toolchain/toolchain1.cmake
                    BINARY_DIR ${CMAKE_BINARY_DIR}/ProjectToolchain1
                    INSTALL_COMMAND ""
                    )

ExternalProject_Add(ProjectToolchain2
                    SOURCE_DIR ${CMAKE_SOURCE_DIR}
                    CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${CMAKE_SOURCE_DIR}/toolchain/toolchain2.cmake
                    INSTALL_COMMAND ""
                    )
