add_executable(AdderTestExecutable AdderTest.cpp)

target_link_libraries(AdderTestExecutable PRIVATE AdderLib)

add_test(NAME AdderTest COMMAND AdderTestExecutable)
